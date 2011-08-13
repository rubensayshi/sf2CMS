#!/bin/bash

if [ -z "$APACHE_USR" ]; then
	for USR in 		httpd \
					www-data \
					daemon \
					apache
	do
		ID=`id $USR 2>&1`
		if [ "$?" != "1" ]; then
			APACHE_USR=$USR
		fi
	done
	export APACHE_USR
fi

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

sudo rm -rf $ROOT/app/cache/*
sudo rm -rf $ROOT/app/logs/*