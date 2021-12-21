#!/bin/bash
# XAUTH=/tmp/.docker.xauth
source .env
touch $XAUTH
xhost +local: 
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod a+r $XAUTH

