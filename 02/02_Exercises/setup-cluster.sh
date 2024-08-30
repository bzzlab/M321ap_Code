#!/bin/bash
#
# Global variables
IP=""
SWARM_TOKEN=""
##------------------------------------------------------------------
# Functions for docker swarm setup
##------------------------------------------------------------------
function setupLeader() {
  local node=$1
  # print meaningful message
#??
  # retrieve IP information of node
  IP=$(multipass info ${node} | grep IPv4 | awk '{print $2}')
  # if IP-address could not be retrieved exit script with a message and error code
#??
#??
#??
#??
#??
  # initialize docker swarm
#??
#??
  # retrieve and save token for joining swarm in a variable
#??
#??
	# if token is empty then exit script with a message
#??
#??
#??
#??
#??
#??
}

function addNodeToCluster() {
  local node=$1
#??
  multipass exec ${node} -- \
	  bash -c "docker swarm join --token $SWARM_TOKEN $IP:2377"
	multipass exec ${node} -- bash -c 'docker info|grep Manager'
}

function checkSetup() {
  local node=$1
#??
#??
}

function leaveNodeFromCluster() {
  local node=$1
#??
#??
}
##------------------------------------------------------------------
# Setup docker swarm
##------------------------------------------------------------------
setupLeader "node1"
addNodeToCluster "node2"
addNodeToCluster "node3"
checkSetup "node1"