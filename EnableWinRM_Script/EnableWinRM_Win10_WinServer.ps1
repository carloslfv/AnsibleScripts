#Get this host IP
$HostIP = (
    Get-NetIPConfiguration |
    Where-Object {
        $_.IPv4DefaultGateway -ne $null -and
        $_.NetAdapter.Status -ne "Disconnected"
    }
).IPv4Address.IPAddress

#Start WinRM and set service startup mode to Auto
Start-Service -Name "WinRM"
sc.exe config WinRM start= delayed-auto 

#Create a SelfSignedCertificate and get the thumbprint
$SelfSignedCert = New-SelfSignedCertificate -DnsName $HostIP -CertStoreLocation Cert:\LocalMachine\My -NotAfter (Get-Date).AddMonths(60)
$Thumbprint = $SelfSignedCert.thumbprint

#Create an HTTPS listener
$command = @'
& winrm create winrm/config/Listener?Address=*+Transport=HTTPS '@{Hostname="' "$HostIP" '";CertificateThumbprint="' "$Thumbprint" '" }'
'@

Invoke-Expression $command

#Enable WinRM basic auth
winrm set winrm/config/service/auth '@{Basic="true"}'