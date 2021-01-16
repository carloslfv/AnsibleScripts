#/bin/bash
cp /BodyTemplates/CheckUpdatesBodyTemplate.html /tmp/"$1.html"
sed -i 's,{{ Link }},'$2',' "/tmp/$1.html"
