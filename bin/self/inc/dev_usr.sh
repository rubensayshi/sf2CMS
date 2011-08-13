#!/bin/bash

if [ -z "$DEV_USR" ]; then
	DEV_USR=`id -u -n`
	export DEV_USR
fi

if [ -z "$DEV_USR_GRP" ]; then
	DEV_USR_GRP=`id -g -n`
	export DEV_USR_GRP
fi
