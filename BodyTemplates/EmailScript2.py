import sys
import os
#
JobID = sys.argv[1]
Link = sys.argv[2]
workingdir='/tmp/'+JobID+'/'
#
#Folder = ('E:\\tmp\\')
#
with open(workingdir+JobID+'.html') as file:
    finalhtml = file.read()
#
outputstring = ""
#
for files in os.listdir(workingdir):
    if ("txt" in files): 
        #
        count = 0
        outputstring = outputstring + "<table id='customers'>"
        outputstring = outputstring + "<tr>"
        outputstring = outputstring + "<th>"
        outputstring = outputstring +  'Host: ' + files.replace("Patching-","").replace(".txt","").replace("-",".")
        outputstring = outputstring + "</th>"
        outputstring = outputstring + "</tr>"
        #
        file1 = open(workingdir+files, 'r') 
        Lines = file1.readlines()
        for line in Lines:
            if ("title" in line):
                count = count + 1
                outputstring = outputstring + "<tr>"
                outputstring = outputstring + "<td>"
                outputstring = outputstring + line.replace('"',"").replace("                                                                          title:  ","").replace(",","").replace("title: ","").rstrip("\n")
                outputstring = outputstring + "</td>"
                outputstring = outputstring + "</tr>"
        if (count == 0):
            outputstring = outputstring + "<tr>"
            outputstring = outputstring + "<td>"
            outputstring = outputstring + "No updates pending for this host"
            outputstring = outputstring + "</td>"
            outputstring = outputstring + "</tr>"
        outputstring = outputstring +  "</table><hr>"
print (outputstring)

finalhtml = finalhtml.replace("VarHyperLink", Link)
finalhtml = finalhtml.replace("VarHTMLTable", outputstring)
print(finalhtml)

f = open(workingdir+JobID+'.html', 'w')
f.write(finalhtml)
f.close()