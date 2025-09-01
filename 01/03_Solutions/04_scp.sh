#!/bin/bash
#
LIB='../../bin/aws.conf'
if [ ! -f $LIB ]; then  #??
    echo $LIB does not exist! #??
    exit 2  #??
  fi  #??
source $LIB

# Set variable for target directory where the app should be stored
DIR="~/01_sol" #??

# remove (with ssh) target directory for the app
echo "Remove directory ${DIR} on ${DEST}"
ssh -i ${PRIVATE_KEY} ${DEST} "rm -rf ${DIR}" #??
echo "Create directory ${DIR} on ${DEST}"
# create (with ssh) target directory for the app
ssh -i ${PRIVATE_KEY} ${DEST} "mkdir ${DIR}" #??
# copy (with scp) all relevant bash script & Dockerfiles to destination
scp -i ${PRIVATE_KEY} 00{a..b}_*.sh  *.conf 05_*.sh ${DEST}:${DIR} #??
scp -i ${PRIVATE_KEY}  Dockerfile* ${DEST}:${DIR} #??
#scp -i ${PRIVATE_KEY} 00{a..b}_*.sh  *.conf 05_*.sh ${DEST}:${DIR} #??