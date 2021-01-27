import sys
import json as j
import requests
from requests.auth import HTTPBasicAuth

JobID = sys.argv[1]
Link = sys.argv[2]
wsuser = sys.argv[3]
wspass = sys.argv[4]
prismurl = sys.argv[5]
requiredstats = sys.argv[6].split (",")

workingdir='/tmp/'+JobID+'/'

jsonfile = open(workingdir+'file.json', 'w')
response = requests.get(prismurl,auth=HTTPBasicAuth(wsuser, wspass), verify=False)
jsonfile.writelines(response.text)
jsonfile.close() 

#Format the JSON as HTML Table

outputstring = ""

with open(workingdir+JobID+'.html') as file:
    finalhtml = file.read()

with open(workingdir+'file.json') as json_format_file: 
  d = j.load(json_format_file)

for z in d["entities"]:
#
  list = str(z["usage_stats"]).split (",")
#
  usage_stats_list1 = []
  usage_stats_list2 = []
#
  for el in list:
     usage_stats_list1.append(el.split(":")[0])
     usage_stats_list2.append(el.split(":")[1])
#
  outputstring = outputstring + "<table id='customers'>"
  outputstring = outputstring + "<tr>"
  outputstring = outputstring + "<th>"+z["name"]+"</th>"
  outputstring = outputstring + "<th>Statistics</th>"
  outputstring = outputstring + "</tr>"
  for index,item in enumerate(usage_stats_list1):
    stat = item.replace("'","").replace(" ","").replace("{","").replace("}","")
    for rs in requiredstats:
      if (rs == stat):
       stat = stat.replace("_bytes","").replace("."," ").replace("_"," ")
       #print (stat)
       #print (usage_stats_list2[index])
       sts = usage_stats_list2[index].replace("'","").replace(" ","").replace("{","").replace("}","")
       if ("bytes" in usage_stats_list1[index]):
        sts1 = float(sts)
        if (sts1 >= 1099511627776):
         sts1 = sts1/1099511627776
         sts1 = str(round(sts1,2))+" TB"
        elif (sts1 >= 1073741824):
         sts1 = sts1/1073741824
         sts1 = str(round(sts1,2))+" GB"
        elif (sts1 >= 1048576):
         sts1 = sts1/1048576
         sts1 = str(round(sts1,2))+" MB"
        else:
         print("Its below a single MB")
         sts1 = str(sts1)
        outputstring = outputstring + "<tr>"
        outputstring = outputstring + "<td>"+stat.replace("storage user unreserved usage","Used").replace("storage user capacity","Max Capacity").replace("storage user free","Free Space (Logical)")+"</td>"
        outputstring = outputstring + "<td>"+sts1+"</td>"
        outputstring = outputstring + "</tr>"
       else:
        outputstring = outputstring + "<tr>"
        outputstring = outputstring + "<td>"+stat+"</td>"
        outputstring = outputstring + "<td>"+sts1+"</td>"
        outputstring = outputstring + "</tr>"    
  outputstring = outputstring + "</table><hr>"


finalhtml = finalhtml.replace("VarHyperLink", Link)
finalhtml = finalhtml.replace("VarHTMLTable", outputstring)
print(finalhtml)

f = open(workingdir+JobID+'.html', 'w')
f.write(finalhtml)
f.close()
