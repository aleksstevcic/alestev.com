# alestev.com
my meme site lol https://www.alestev.com/

here is the flow:

1. on commit, github action is performed which sends an HTTPS request to my local server
2. webhook will capture that request and send a shell command (via SSH) to my debian machine
3. shell script will clean up, then clone this repository and run build.sh within ./build
4. that script will rebuild a docker image based on nginx:stable-alpine-slim, but with my site loaded onto it
5. the script will then send an HTTP request to portainer within the same machine to restart the stack that uses this image
6. profit