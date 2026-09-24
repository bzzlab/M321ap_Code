#!/bin/bash
#
<<'TASK'
Based on the two articles in the 05b/01_Intro fill the gaps in order to manage
the agnhost netexec app as K8s service. This script helpful for your next
exercise in 05b/02_Exercises/02_Exercise.sh
TASK
#
if [ $# -lt 2 ]
then
  printf "%s\n" \
    "Error: Provide at least 2 arguments:" \
    "argument 1 - script configuration sh.conf" \
    "argument 2 - action:0=deploy service, 1=expose service, 2=getNodePort" \
    "3=Access service, 4=remove service, 5=remove deployment" \
    "Example 1: $0 sh1.conf 0" \
    "Example 2: $0 sh2.conf 4" \
    "Exit script."
  exit 1
fi

# Read CLI arguments
#??
#??

# check if configuration exists
#??
#??
  # print error message and exit script
#??
#??
#??
# Load configuration
#??


function deployService() {
#??
#??
#??
#??
#??
#??
}

function exposeService(){
#??
#??
#??
#??
#??
#??
#??
#??
#??
}

function getNodePort() {
#??
#??
#??
#??
#??
#??
#??
}

function accessService() {
#??
#??
#??
#??
#??
}

function deleteService() {
#??
#??
#??
}

function deleteDeployment() {
#??
#??
#??
}

# NAME and SVC from import app.conf
case ${ACTION} in
0)
  printf "Deploy service ...\n"
  deployService "${NAME}"
  ;;
1)
  printf "Expose service ...\n"
  exposeService "${NAME}" "${SVC}"
  ;;
2)
  printf "Get NodePort ...\n"
  getNodePort "$SVC"
  ;;
3)
  printf "Access service ...\n"
  accessService "${SVC}"
  ;;
4)
  printf "Delete service ...\n"
  deleteService "${SVC}"
  ;;
5)
  printf "Delete deployment ...\n"
  deleteDeployment "${NAME}"
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
