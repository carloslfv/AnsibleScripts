#/bin/bash
#Attachment and Details on Body
#BodyTemplate
python3 /BodyTemplates/JsonPrismInterpreter.py $1 $2 $3 $4 $5 $6
#filename="/tmp/$1/$1.html"
#sed -i 's,{{ Link }},'$2',' $filename
#sed -i 's,{{ Details }},'"`cat /tmp/$1/File.report`"',g' $filename
#echo $filename
#storage.capacity_bytes,storage.usage_bytes,storage.reserved_capacity_bytes,storage.free_bytes,data_reduction.compression.user_saved_bytes
#sh EmailScript3.sh 436 www.google.co.cr admin pass https://192.168.254.121:9440/PrismGateway/services/rest/v2.0/storage_containers storage.capacity_bytes,storage.usage_bytes,storage.reserved_capacity_bytes,storage.free_bytes,data_reduction.compression.user_saved_bytes