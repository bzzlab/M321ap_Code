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
TRG="~/08/03"

echo "Remove directory ${TRG} on ${DEST}"
ssh -i ${PRIVATE_KEY} ${DEST} "rm -rf ${TRG}"
echo "Create directory ${TRG} on ${DEST}"
ssh -i ${PRIVATE_KEY} ${DEST} "mkdir -p ${TRG}"
scp -r -i ${PRIVATE_KEY} ${SRC}/deploy ${DEST}:${TRG}
scp -i ${PRIVATE_KEY} ${SRC}/0{1..4}_*.sh ${DEST}:${TRG}
scp -i ${PRIVATE_KEY} ${SRC}/App* ${DEST}:${TRG}
# convert files ..
#for f in $(ls 0{1..3}_*.sh); do convert.sh ${f};done