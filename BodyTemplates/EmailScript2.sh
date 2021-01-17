#/bin/bash
cp /BodyTemplates/CheckUpdatesBodyTemplate.html /tmp/"$1.html"
sed -i 's,{{ Link }},'$2',' "/tmp/$1.html"
VarDetail=$(cat /tmp/$1/$1.body)
sed -i 's,{{ Details }},'$VarDetail',' "/tmp/$1.html"