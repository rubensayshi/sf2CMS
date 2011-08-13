#!/bin/bash

if [ -z "$ROOT" ]; then
	ROOT=`php -r "echo dirname(dirname(dirname(realpath('$(pwd)/$0'))));"`
	export ROOT
fi

source "${ROOT}/bin/self/inc/setup_fileperms_init.sh"

$ROOT/bin/vendors install --reinstall
$ROOT/bin/self/setup_fileperms.sh -s "$SETUP_SYSTEM"