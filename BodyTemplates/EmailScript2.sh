#/bin/bash
#Attachment and Details on Body
rm /tmp/$1/$1.log
for i in /tmp/$1/*.txt; do echo $i >> /tmp/$1/$1.log && grep "title" $i | sed -e 's/^\s*//' -e '/^$/d' | sed -e 's/"title":  "//' -e '/^$/d' | sed -e 's/",//' -e '/^$/d' >> /tmp/$1/$1.log && echo '' >> /tmp/$1/$1.log; done
sed -i 's,/tmp/'$1'/Patching-,,g' /tmp/$1/$1.log
sed -i 's/.txt//g' /tmp/$1/$1.log
sed -i 's/-/./g' /tmp/$1/$1.log
#
cp /tmp/$1/$1.log /tmp/$1/$1.body
sed -i 's/^/<p>/' /tmp/$1/$1.body
sed -i 's/\r$//g' /tmp/$1/$1.body
sed -i ':a;N;$!ba;s,\n,</p>,g' /tmp/$1/$1.body
#
#BodyTemplate
cp /BodyTemplates/CheckUpdatesBodyTemplate.html /tmp/"$1.html"
sed -i 's,{{ Link }},'$2',' "/tmp/$1.html"
sed -i 's,{{ Details }},'"`cat /tmp/$1/$1.body`"',g' "/tmp/$1.html"