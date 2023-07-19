#this will build the docker container, then restart the docker instance

while getopts token: flag
do
    case "${flag}" in
        token) apikey=${OPTARG};;
    esac
done

echo $apikey

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