#!/bin/bash
source .env

xhost +local: 
if [ ! -f $XAUTH ] ; then
	touch $XAUTH
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ] ; then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    fi
    chmod a+r $XAUTH
fi

docker-compose run --rm --user $(id -u):$(id -g) app
