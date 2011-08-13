#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(dirname(realpath('$(pwd)/$0')))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/apache_usr.sh"
source "${ROOT}/bin/self/inc/dev_usr.sh"

if [ -z "$SUDO_DO" ]; then
	SUDO_DO="sudo -u root "
fi
