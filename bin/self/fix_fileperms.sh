#!/bin/bash

SUDO_DO="sudo -u root "

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

if [ -z "$APACHE_USR" ]; then
	for USR in 		daemon \
					httpd \
					www-data \
					apache
	do
		ID=`id $USR 2>&1`
		if [ "$?" != "1" ]; then
			APACHE_USR=$USR
		fi
	done
	export APACHE_USR
fi

if [ -z "$DEV_USR_GRP" ]; then
	DEV_USR_GRP=`id -g`
	export DEV_USR_GRP
fi

${SUDO_DO}chmod -R 0770 $ROOT
${SUDO_DO}chown -R $APACHE_USR:$DEV_USR_GRP $ROOT
