#!/bin/bash
#
# set docker file name
file="Dockerfile2" #??
# set image name
image=myubu2 #??
# set container name
container=ubu2c #??

# if docker file does not exist ..
if [ ! -f ${file} ] #??
then #??
  # print error message and exit script
  printf "Dockerfile %s is missing!\nExit script!" ${file} #??
  exit 1 #??
fi #??
# 1. Build a dockerfile with tag -t
docker build -t ${image} -f ${file} . #??
sleep 1 #??
# 2. List images
docker image ls #??
sleep 2 #??
clear #??
# 3. Run image with and name it m347_c1
docker run -itd --rm --name ${container} ${image} #??
# 4. Start bash-shell in container
docker exec -it ${container} bash #??
# 5. Stop and remove container
docker stop ${container}#??
# 6. Remove image
docker rmi ${image}#??
