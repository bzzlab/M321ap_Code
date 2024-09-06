#!/bin/bash
#
# Global variables
IP=""
SWARM_TOKEN=""
##------------------------------------------------------------------
# Functions for docker swarm setup
##------------------------------------------------------------------
function initNodes() {
  local node=$1
  # print meaningful message
  echo "Setup ${node} with container runtime ..." #??
  multipass exec ${node} -- bash -c "curl -s https://get.docker.com | sh - && sudo usermod -aG docker ubuntu" #??
}

function setupLeader() {
  local node=$1
  # print meaningful message
  echo "Setup ${node} as manager/leader ..." #??
  # retrieve IP information of node (multipass, grep, awk)
  IP=$(multipass info ${node} | grep IPv4 | awk '{print $2}') #??
  # if IP-address could not be retrieved exit script with a message and error code
  if [ -z ${IP} ] #??
  then  #??
      echo Any IP-address could not be retrieved ! #??
      exit 1  #??
  fi  #??
  # initialize docker swarm
  multipass exec ${node} -- bash -c "docker swarm init --advertise-addr $IP:2377 --listen-addr $IP:2377" #??
  # retrieve and save token for joining swarm in a variable
	SWARM_TOKEN=$(multipass exec ${node} -- bash -c 'docker swarm join-token --quiet worker') #??
	# if token is empty then exit script with a message
  if [ -z ${SWARM_TOKEN} ] #??
  then  #??
      echo ${node} could not initialized as manager! #??
      exit 2  #??
  fi  #??
  echo "${node} setup as manager successfully." #??
}

function addNodeToCluster() {
  local node=$1
  echo "Add ${node} to the cluster ..." #??
  multipass exec ${node} -- bash -c "docker swarm join --token $SWARM_TOKEN $IP:2377"  #??
	#multipass exec ${node} -- bash -c 'docker info|grep Manager'  #??
}

function checkSetup() {
  local node=$1
  echo "Check setup on ${node} ..." #??
  multipass exec ${node} -- bash -c 'docker node ls' #??
}

function leaveNodeFromCluster() {
  local node=$1
  echo "${node} leaves cluster ..." #??
  multipass exec ${node} -- bash -c 'docker swarm leave' #??
}
##------------------------------------------------------------------
# Setup docker swarm
##------------------------------------------------------------------
initNodes "node1"
initNodes "node2"
initNodes "node3"

setupLeader "node1"
addNodeToCluster "node2"
addNodeToCluster "node3"
checkSetup "node1"