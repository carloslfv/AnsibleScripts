#/bin/bash
#
#BodyTemplate
cp /BodyTemplates/CheckUpdatesBodyTemplate.html /tmp/$1/"$1.html"
python3 /BodyTemplates/EmailScript2.py $1 $2