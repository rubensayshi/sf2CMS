#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/init.sh"

${ROOT}/bin/self/quick_clearcache.sh
${ROOT}/bin/self/fix_fileperms.sh
${APACHE_DO}${ROOT}/app/console doctrine:database:create
${APACHE_DO}${ROOT}/app/console doctrine:schema:create
${APACHE_DO}${ROOT}/app/console init:acl
${APACHE_DO}${ROOT}/app/console doctrine:fixtures:load
${APACHE_DO}${ROOT}/app/console cache:clear
${APACHE_DO}${ROOT}/app/console assets:install web
