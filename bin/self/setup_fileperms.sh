#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/setup_fileperms_init.sh"

${SUDO_DO}${ROOT}/bin/self/quick_clearcache.sh

if [ "$SETUP_SYSTEM" == "setfalc" ]; then
	${SUDO_DO}setfacl -R -m u:${APACHE_USR}:rwx -m u:${DEV_USR}:rwx ${ROOT}app/cache ${ROOT}app/logs
	${SUDO_DO}setfacl -dR -m u:${APACHE_USR}:rwx -m u:${DEV_USR}:rwx ${ROOT}app/cache ${ROOT}app/logs
elif [ "$SETUP_SYSTEM" == "chmod+a" ]; then
	${SUDO_DO}chmod +a "${APACHE_USR} allow delete,write,append,file_inherit,directory_inherit" ${ROOT}app/cache ${ROOT}app/logs
	${SUDO_DO}chmod +a "${DEV_USR} allow delete,write,append,file_inherit,directory_inherit" ${ROOT}app/cache ${ROOT}app/logs
fi
