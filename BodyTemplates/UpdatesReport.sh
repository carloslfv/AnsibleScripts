#!/bin/bash
rm /tmp/$1/$1.log
for i in /tmp/$1/*.txt; do echo $i >> /tmp/$1/$1.log && grep "title" $i | sed -e 's/^\s*//' -e '/^$/d' | sed -e 's/"title":  "//' -e '/^$/d' | sed -e 's/",//' -e '/^$/d' >> /tmp/$1/$1.log; done
sed -i 's,/tmp/'$1'/Patching-,,g' /tmp/$1/$1.log
sed -i 's/.txt//g' /tmp/$1/$1.log
sed -i 's/-/./g' /tmp/$1/$1.log