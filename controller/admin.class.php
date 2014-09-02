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

        $uuid = get_uuid();

        $handle = new Upload($_FILES['picture'], 'zh_CN');
        if (!$handle->uploaded) {
            $handle = new Upload(c('default_goods_image'), 'zh_CN');
        }

        $handle->file_new_name_body = $uuid;
        $handle->image_resize = true;
        $handle->image_ratio = true;
        $handle->image_ratio_fill = true;

        //original
        $handle->Process(c('goods_image_dir'));
        //150*120
        $handle->image_x = 150;
        $handle->image_y = 120;
        $handle->Process(c('goods_image_dir') . '150x120/');

        $handle->Clean();

        $name = v('name');
        $price = v('price');
        $status = v('status');
        $description = v('description');
        save_goods(array($name, $handle->file_dst_name, $price, $description, $status, getDBDate()));

        forward('?c=admin&a=goodsListPage');
    }

    function delGoods()
    {
        perm_required('menu');

        $ids = v('ids');
        if (!$ids) {
            AjaxMessage::simple(false);
            return;
        }

        $is_success = delete_goods($ids);
        AjaxMessage::simple($is_success);
    }
}
