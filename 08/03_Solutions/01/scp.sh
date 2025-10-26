#!/bin/bash
#
# set variable personal aws configuration
CONF='../../../bin/aws.conf'
# check if configuration exists
if [ ! -f $CONF ]; then
  echo $CONF does not exist!
  exit 2
fi
# Import aws configuration
source ${CONF}
# Set variable for source directory
SRC="."
# Set variable for target directory where the app should be stored
TRG="~/bin"

scp -i ${PRIVATE_KEY} ${SRC}/c*.sh ${DEST}:${TRG}
scp -i ${PRIVATE_KEY} ${SRC}/.bash* ${DEST}:${TRG}
