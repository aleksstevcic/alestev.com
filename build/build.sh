#!/bin/bash

#this will build the docker container, then restart the docker instance
apikey=""

#https://stackoverflow.com/questions/14447406/bash-shell-script-check-for-a-flag-and-grab-its-value
while getopts ":t:" opt; do
  case $opt in
    t)
      echo "-t was triggered, Parameter: $OPTARG" >&2
      apikey=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

#variables. interfaces with portainer
stackid="23"

#build with the dockerfile in the same folder, and name it alestevcom
#should be run within the root alestev.com folder
docker build -t alestevcom --no-cache .

#stop compose file that runs this server
curl -X POST --insecure -I "https://localhost:9443/api/stacks/$stackid/stop" \
-H "X-API-Key:$apikey"

#wait a second
sleep 1

#start compose file that runs this server
curl -X POST --insecure -I "https://localhost:9443/api/stacks/$stackid/start" \
-H "X-API-Key:$apikey"

#prune any untagged images
yes | docker image prune