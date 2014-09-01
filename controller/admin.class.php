<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'config' . DS . 'admin.config.php');
include_once(AROOT . 'lib' . DS . 'admin.function.php');

class adminController extends appController
{
    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if (!check_login()) {
            render_to_web('admin/login');
        } else {
            forward('?c=admin&a=system');
        }
    }

    function login()
    {
        $username = v('username');
        $password = v('password');

        if (!($username && $password)) {
            forward('?c=admin');
            return;
        }

        $admin = c('admin');
        $salt = $admin['salt'];
        $user = $admin['users'][$username];
        $password = md5($password . $salt);
        if (!$user || $user['password'] != $password) {
            forward('?c=admin');
            return;
        }

        $_SESSION['_id'] = $user['id'];
        $_SESSION['_name'] = $user['name'];
        $_SESSION['_is_super'] = $user['is_super'];
        $_SESSION['_perms'] = $user['perms'];
        forward('?c=admin&a=system');
    }

    function logout()
    {
        session_unset();
        session_destroy();
        forward('?c=admin');
    }

    function system()
    {
        login_required();
        $data = get_system();
        render_to_web('admin/base', 'system', $data);
    }

    function updateSystem()
    {
        $name = v('name');
        $status = v('status');
        $start_time = v('start_time');
        $end_time = v('end_time');
        $phone = v('phone');
        $comments = v('comments');

        $is_success = update_system(array($name, $status, $start_time, $end_time, $phone, $comments));
        return ajax_echo($is_success);
    }
}
