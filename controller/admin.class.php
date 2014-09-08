<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'config' . DS . 'admin.config.php');
include_once(AROOT . 'lib' . DS . 'upload.class.php');
include_once(AROOT . 'lib' . DS . 'admin.function.php');
include_once(AROOT . 'model' . DS . 'sysconfig.function.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');
include_once(AROOT . 'model' . DS . 'category.function.php');
include_once(AROOT . 'model' . DS . 'order.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');
include_once(AROOT . 'model' . DS . 'notice.function.php');

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

    function sysconfig()
    {
        login_required();

        $data = get_sysconfig();
        render_to_web('admin/base', 'sysconfig', $data);
    }

    function updateSysconfig()
    {
        perm_required('sysconfig');

        $name = v('name');
        $status = v('status');
        $start_time = v('start_time');
        $end_time = v('end_time');
        $phone = v('phone');
        $comments = v('comments');

        $data = array($name, $status, $start_time, $end_time, $phone, $comments);
        update_sysconfig($data);
        AjaxMessage::simple(true);
    }

    function goodsList()
    {
        perm_required('goods');

        $data['pager'] = get_goods_page(20, 9, "c=admin&a=goodsList");
        render_to_web('admin/base', 'goodsList', $data);
    }

    function addGoods()
    {
        perm_required('goods');

        $data['category_list'] = get_category_list();
        render_to_web('admin/addGoods', null, $data);
    }

    function isExistGoods()
    {
        perm_required('goods');

        $name = v('name');
        $previous = v('previous');

        if ($previous && $name == $previous) {
            ajax_echo(json_encode(true), 'json');
            return;
        }

        $is_has = has_goods($name);
        ajax_echo(json_encode(!$is_has), 'json');
    }

    function saveGoods()
    {
        perm_required('goods');

        $name = v('name');
        $price = v('price');
        $status = v('status');
        $description = v('description');
        $category_ids = v('category');

        $handle = new Upload($_FILES['picture'], 'zh_CN');
        if (!$handle->uploaded) {
            $handle = new Upload(c('no_image'), 'zh_CN');
        }

        $uuid = get_uuid();
        //original
        $handle->file_new_name_body = $uuid;
        $handle->image_resize = true;
        $handle->image_ratio = true;
        $handle->image_ratio_fill = true;
        $handle->Process(c('goods_image_dir'));
        //150*120
        $handle->file_new_name_body = $uuid;
        $handle->image_resize = true;
        $handle->image_ratio = true;
        $handle->image_ratio_fill = true;
        $handle->image_x = 150;
        $handle->image_y = 120;
        $handle->Process(c('goods_image_dir') . '150x120/');
        //210*170
        $handle->file_new_name_body = $uuid;
        $handle->image_resize = true;
        $handle->image_ratio = true;
        $handle->image_ratio_fill = true;
        $handle->image_x = 210;
        $handle->image_y = 170;
        $handle->Process(c('goods_image_dir') . '210x170/');

        $handle->Clean();

        $data = array($name, $handle->file_dst_name, $price, $description, $status, getDBDate());
        $goods_id = save_goods($data);
        add_goods_category($goods_id, $category_ids);
        forward('?c=admin&a=goodsList');
    }

    function deleteGoods()
    {
        perm_required('goods');

        $ids = v('ids');
        if (!$ids) {
            AjaxMessage::simple(false);
            return;
        }

        delete_goods($ids);
        AjaxMessage::simple(true);
    }

    function editGoods()
    {
        perm_required('goods');

        $id = v('id');
        $data['goods'] = get_goods($id);
        $data['category_list'] = get_category_list();
        $data['goods_category_ids'] = get_category_ids_by_goods($id);

        render_to_web('admin/editGoods', null, $data);
    }

    function updateGoods()
    {
        perm_required('menu');

        $id = v('id');
        $name = v('name');
        $price = v('price');
        $status = v('status');
        $description = v('description');
        $category_ids = v('category');

        $handle = new Upload($_FILES['picture'], 'zh_CN');

        if ($handle->uploaded) {
            $uuid = get_uuid();
            //original
            $handle->file_new_name_body = $uuid;
            $handle->image_resize = true;
            $handle->image_ratio = true;
            $handle->image_ratio_fill = true;
            $handle->Process(c('goods_image_dir'));
            //150*120
            $handle->file_new_name_body = $uuid;
            $handle->image_resize = true;
            $handle->image_ratio = true;
            $handle->image_ratio_fill = true;
            $handle->image_x = 150;
            $handle->image_y = 120;
            $handle->Process(c('goods_image_dir') . '150x120/');
            //210*170
            $handle->file_new_name_body = $uuid;
            $handle->image_resize = true;
            $handle->image_ratio = true;
            $handle->image_ratio_fill = true;
            $handle->image_x = 210;
            $handle->image_y = 170;
            $handle->Process(c('goods_image_dir') . '210x170/');

            $handle->Clean();
            $picture = $handle->file_dst_name;
        } else {
            $goods = get_goods($id);
            $picture = $goods['picture'];
        }

        update_goods($id, array($name, $picture, $price, $description, $status));
        update_goods_category($id, $category_ids);
        forward('?c=admin&a=goodsList');
    }

    function categoryList()
    {
        perm_required('category');

        $data['pager'] = get_category_page(20, 9, "c=admin&a=categoryList");
        render_to_web('admin/base', 'categoryList', $data);
    }

    function addCategory()
    {
        perm_required('category');

        $data['goods_list'] = get_goods_list();
        render_to_web('admin/addCategory', null, $data);
    }

    function isExistCategory()
    {
        perm_required('category');

        $name = v('name');
        $previous = v('previous');

        if ($previous && $name == $previous) {
            ajax_echo(json_encode(true), 'json');
            return;
        }

        $is_has = has_category($name);

        ajax_echo(json_encode(!$is_has), 'json');
    }

    function saveCategory()
    {
        perm_required('category');

        $name = v('name');
        $order = v('order');
        $goods_ids = v('goods');

        $category_id = save_category(array($name, $order, getDBDate()));
        add_category_goods($category_id, $goods_ids);

        forward('?c=admin&a=categoryList');
    }

    function deleteCategory()
    {
        perm_required('category');

        $ids = v('ids');
        if (!$ids) {
            AjaxMessage::simple(false);
            return;
        }

        delete_category($ids);
        AjaxMessage::simple(true);
    }

    function editCategory()
    {
        perm_required('category');

        $id = v('id');
        $data['category'] = get_category($id);
        $data['goods_list'] = get_goods_list();
        $data['category_goods_ids'] = get_goods_ids_by_category($id);

        render_to_web('admin/editCategory', null, $data);
    }

    function updateCategory()
    {
        perm_required('category');

        $id = v('id');
        $name = v('name');
        $order = v('order');
        $goods_ids = v('goods');

        $data = array($name, $order);
        update_category($id, $data);
        update_category_goods($id, $goods_ids);

        forward('?c=admin&a=categoryList');
    }
}
