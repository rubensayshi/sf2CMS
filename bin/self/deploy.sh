#!/bin/sh

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

if [ -z "$SUDO_DO" ]; then
	SUDO_DO="sudo -u $APACHE_USR "
	export SUDO_DO
fi

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

$ROOT/bin/self/quick_clearcache.sh
$ROOT/bin/self/fix_fileperms.sh

${SUDO_DO}$ROOT/app/console cache:clear
${SUDO_DO}$ROOT/app/console cache:warmup
${SUDO_DO}$ROOT/app/console assets:install web
${SUDO_DO}$ROOT/app/console assetic:dump

$ROOT/bin/self/fix_fileperms.sh

${SUDO_DO}$ROOT/app/console doctrine:ensure-production-settings