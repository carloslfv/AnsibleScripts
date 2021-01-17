#/bin/bash
cp /BodyTemplates/BodyTemplate.html /tmp/"$1_Start.html"
cp /BodyTemplates/BodyTemplate.html /tmp/"$1_End.html"
sed -i 's/{{ hostnameIP }}/'$2'/' "/tmp/$1_Start.html"
sed -i 's/{{ VarProgress }}/in progress/' "/tmp/$1_Start.html"
sed -i 's/{{ AutoReboot }}/'$3'/' "/tmp/$1_Start.html"
sed -i 's,{{ Link }},'$4',' "/tmp/$1_Start.html"

sed -i 's/{{ hostnameIP }}/'$2'/' "/tmp/$1_End.html"
sed -i 's/{{ VarProgress }}/finished/' "/tmp/$1_End.html"
sed -i 's/{{ AutoReboot }}/'$3'/' "/tmp/$1_End.html"
sed -i 's,{{ Link }},'$'4,' "/tmp/$1_End.html"
