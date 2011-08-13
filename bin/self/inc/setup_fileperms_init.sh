#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(dirname(realpath('$(pwd)/$0')))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/init.sh"

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
