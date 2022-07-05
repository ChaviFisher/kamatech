#!/bin/sh
echo 'pull' 
docker pull $1:$2   
echo 'run' 
docker run -itd --name $1 -e RUN="TRUE" -p 8000:8080 $1:$2
echo 'stop' 
docker stop $1
echo 'delete'
docker rm $1
echo 're-tag' 
docker tag $1:$2 chavifisher/$3:$1
echo 'push'
docker push chavifisher/$3:$1