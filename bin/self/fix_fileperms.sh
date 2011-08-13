#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/init.sh"

${SUDO_DO}chmod -R 0770 $ROOT
${SUDO_DO}chown -R $APACHE_USR:$DEV_USR_GRP $ROOT
