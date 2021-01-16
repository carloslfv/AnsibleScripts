#/bin/bash
cp /BodyTemplates/BodyTemplate.html /tmp/"$1.html"
sed -i 's,{{ Link }},'$2',' "/tmp/$1.html"
