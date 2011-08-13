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
		ID=`id -n $USR 2>&1`
		if [ "$?" != "1" ]; then
			APACHE_USR=$USR
		fi
	done
	export APACHE_USR
fi

if [ -z "$DEV_USR" ]; then
	DEV_USR=`id -g -n`
	export DEV_USR
fi

function usage
{
	NAME=$(basename $0)
	
	echo "setup fileperms so that it works for both a dev user and apache"
	echo 
	echo "usage:"
	echo "		$NAME [-h] -s (setfacl|chmod+a)"
	echo
	echo "options:"
	echo "		-s	-		specify the system."
	echo "		-h	-		show this help message."
	echo
	
	exit 1;	
}

SETUP_SYSTEM=''
while getopts ":hs:" OPTION
do
	case $OPTION in
 		s)  
			SETUP_SYSTEM="$OPTARG"
            ;;
        h)      
 			usage
            ;;
    esac
done

if [ -z "$SETUP_SYSTEM" ]; then
	usage
else
	SYSTEM_KNOWN=false
	for SYSTEM in 	"setfacl" \
					"chmod+a"
	do
		if [ "$SYSTEM" == "$SETUP_SYSTEM" ]; then
			SYSTEM_KNOWN=true
		fi
	done

	if [ $SYSTEM_KNOWN != true ]; then 
		usage
	fi
fi
