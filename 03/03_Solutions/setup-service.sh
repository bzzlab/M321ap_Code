#!/bin/bash
#
docker service create \ #??
  --name cluster \ #??
  --constraint 'node.role == worker' \ #??
  -p:80:80/tcp \ #??
  readydocker1/cluster:latest #??
