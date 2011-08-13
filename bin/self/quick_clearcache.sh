#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/init.sh"

${SUDO_DO}rm -rf ${ROOT}/app/cache/*
${SUDO_DO}rm -rf ${ROOT}/app/logs/*