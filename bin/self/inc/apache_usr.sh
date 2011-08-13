#!/bin/bash

if [ -z "$APACHE_USR" ]; then
	for USR in 		daemon \
					httpd \
					www-data \
					apache
	do
		ID=`id -u -n $USR 2>&1`

		if [ "$?" != "1" ]; then
			APACHE_USR=$USR
		fi
	done
	export APACHE_USR
fi

if [ -z "$APACHE_USR_GRP" ]; then
	APACHE_USR_GRP=`id -n -g $APACHE_USR`

	export APACHE_USR_GRP
fi

if [ -z "$APACHE_DO" ]; then
	APACHE_DO="sudo -u ${APACHE_USR} "

	export APACHE_DO
fi
