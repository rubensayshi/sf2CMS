#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/init.sh"

${APACHE_DO}${ROOT}/app/console doctrine:database:drop --force
${ROOT}/bin/self/quick_clearcache.sh