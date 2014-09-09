<?php
/*
 * 注意:
 *  1. index需求的权限，必须只能使用login_required，否则会造成重定向index死循环。
 * */
$GLOBALS['config']['admin']['index'] = 'sysconfig';
$GLOBALS['config']['admin']['perms'] = array('sysconfig', 'users', 'goods', 'category', 'orders', 'article');
$GLOBALS['config']['admin']['salt'] = "\xdef\x1aF{\xa1\x00\xed>\xa3{<\x0bt\xbf\xd8\x08\xf7\xa5\xd6\xa6.jL";
$GLOBALS['config']['admin']['users']['admin']['id'] = 1;
$GLOBALS['config']['admin']['users']['admin']['name'] = 'admin';
$GLOBALS['config']['admin']['users']['admin']['password'] = '0bd536a7e0990e01138c7c35ed25ff3e';
$GLOBALS['config']['admin']['users']['admin']['is_super'] = true;
$GLOBALS['config']['admin']['users']['newbie']['id'] = 2;
$GLOBALS['config']['admin']['users']['newbie']['name'] = 'newbie';
$GLOBALS['config']['admin']['users']['newbie']['password'] = '0bd536a7e0990e01138c7c35ed25ff3e';
$GLOBALS['config']['admin']['users']['newbie']['perms'] = array();
