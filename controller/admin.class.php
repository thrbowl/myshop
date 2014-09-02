<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'config' . DS . 'admin.config.php');
include_once(AROOT . 'lib' . DS . 'admin.function.php');
include_once(AROOT . 'lib' . DS . 'upload.class.php');

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
            $admin = c('admin');
            forward('?c=admin&a=' . $admin['index']);
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
        forward('?c=admin&a=' . $admin['index']);
    }

    function logout()
    {
        session_unset();
        session_destroy();
        forward('?c=admin');
    }

    function systemPage()
    {
        perm_required('system');

        $data = get_system();
        render_to_web('admin/base', 'system', $data);
    }

    function updateSystem()
    {
        perm_required('system');

        $name = v('name');
        $status = v('status');
        $start_time = v('start_time');
        $end_time = v('end_time');
        $phone = v('phone');
        $comments = v('comments');

        $is_success = update_system(array($name, $status, $start_time, $end_time, $phone, $comments));
        AjaxMessage::simple($is_success);
    }

    function goodsListPage()
    {
        perm_required('menu');

        $data['pager'] = get_menu(20, 9, "c=admin&a=goodsListPage");
        render_to_web('admin/base', 'goodsList', $data);
    }

    function addGoodsPage()
    {
        perm_required('menu');

        render_to_web('admin/addGoods');
    }

    function checkGoodsName()
    {
        perm_required('menu');

        $name = v('name');

        $is_has = has_goods($name);
        ajax_echo(json_encode(!$is_has), 'json');
    }

    function addGoods()
    {
        perm_required('menu');

        $name = v('name');
        $price = v('price');
        $status = v('status');
        $description = v('description');

        $goods_id = save_goods(array($name, $price, $description, $status, getDBDate()));

        /*$handle = new Upload($_FILES['picture'], 'zh_CN');
        if (!$handle->uploaded) {
            $handle = new Upload(c('default_goods_image'), 'zh_CN');
        }

        $handle->file_new_name_body = $goods_id;
        $handle->Process(c('goods_image_dir'));
        if ($handle->processed) {
            echo 1;
        } else {
            echo 2;
        }

        $handle->Clean();*/

        forward('?c=admin&a=goodsListPage');
    }
}
