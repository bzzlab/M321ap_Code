#!/bin/bash
# build and run container based on a Dockerfile
#
PARAMS='web.conf'
if [ ! -f $PARAMS ]; then
    echo $PARAMS does not exist!
    exit 2
fi
#import variables
source $PARAMS
# build image
docker build -t "$image" -f "$file" . #??
# List images
docker image ls #??
# Run image with and name it (see variable)
docker run -itd --rm --name "$container" -p 80:80 "$image" #??
# Test container
curl -X GET http://localhost #??

