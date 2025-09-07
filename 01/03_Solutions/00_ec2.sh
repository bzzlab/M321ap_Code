#!/bin/bash
#
LIB='../../bin/aws.conf'    #??
if [ ! -f $LIB ]; then      #??
  echo $LIB does not exist! #??
  exit 2                    #??
fi                          #??
source $LIB #??

# 1. set full path to your pem-file
# 2. add here your ec2 instance name
ssh -i ${PRIVATE_KEY} ${DEST}


