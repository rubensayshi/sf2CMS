<?php

require_once __DIR__.'/../app/bootstrap.php.cache';
require_once __DIR__.'/../app/AppKernel.php';
//require_once __DIR__.'/../app/AppCache.php';

use Symfony\Component\HttpFoundation\Request;
use GoGreat\SymfonyWrapper\SymfonyApp;

$kernel = new AppKernel(SymfonyApp::getMode(), SymfonyApp::getDebugMode());

$kernel->loadClassCache();
$kernel->handle(Request::createFromGlobals())->send();
