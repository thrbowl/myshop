<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'config' . DS . 'admin.config.php');
include_once(AROOT . 'lib' . DS . 'upload.class.php');
include_once(AROOT . 'lib' . DS . 'admin.function.php');
include_once(AROOT . 'model' . DS . 'article.function.php');
include_once(AROOT . 'model' . DS . 'category.function.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');
include_once(AROOT . 'model' . DS . 'order.function.php');
include_once(AROOT . 'model' . DS . 'sysconfig.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');

class adminController extends appController
{
    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        if (!_check_login()) {
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

        $_SESSION['_userid'] = $user['id'];
        $_SESSION['_nickname'] = $user['name'];
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
        _perm_required('sysconfig');

        $data = get_sysconfig();
        render_to_web('admin/base', 'sysconfig', $data);
    }

    function updateSysconfig()
    {
        _perm_required('sysconfig');

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
        _perm_required('goods');

        $data['pager'] = get_goods_page(20, 9, "c=admin&a=goodsList");
        render_to_web('admin/base', 'goodsList', $data);
    }

    function addGoods()
    {
        _perm_required('goods');

        $data['category_list'] = get_category_list();
        render_to_web('admin/addGoods', null, $data);
    }

    function isExistGoods()
    {
        _perm_required('goods');

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
        _perm_required('goods');

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

        $data = array($name, $handle->file_dst_name, $price, $description, $status);
        $goods_id = save_goods($data);
        add_goods_category($goods_id, $category_ids);
        forward('?c=admin&a=goodsList');
    }

    function deleteGoods()
    {
        _perm_required('goods');

        $goods_ids = v('ids');
        if (!$goods_ids) {
            AjaxMessage::simple(false);
            return;
        }

        delete_goods($goods_ids);
        AjaxMessage::simple(true);
    }

    function editGoods()
    {
        _perm_required('goods');

        $goods_id = v('id');
        $data['goods'] = get_goods($goods_id);
        $data['category_list'] = get_category_list();
        $data['goods_category_ids'] = get_goods_category_ids($goods_id);

        render_to_web('admin/editGoods', null, $data);
    }

    function updateGoods()
    {
        _perm_required('menu');

        $goods_id = v('id');
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
            $goods = get_goods($goods_id);
            $picture = $goods['picture'];
        }

        $data = array($name, $picture, $price, $description, $status);
        update_goods($goods_id, $data);
        update_goods_category($goods_id, $category_ids);
        forward('?c=admin&a=goodsList');
    }

    function categoryList()
    {
        _perm_required('category');

        $data['pager'] = get_category_page(20, 9, "c=admin&a=categoryList");
        render_to_web('admin/base', 'categoryList', $data);
    }

    function addCategory()
    {
        _perm_required('category');

        $data['goods_list'] = get_goods_list();
        render_to_web('admin/addCategory', null, $data);
    }

    function isExistCategory()
    {
        _perm_required('category');

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
        _perm_required('category');

        $name = v('name');
        $order = v('order');
        $goods_ids = v('goods');

        $data = array($name, $order);
        $category_id = save_category($data);
        add_category_goods($category_id, $goods_ids);

        forward('?c=admin&a=categoryList');
    }

    function deleteCategory()
    {
        _perm_required('category');

        $category_ids = v('ids');
        if (!$category_ids) {
            AjaxMessage::simple(false);
            return;
        }

        delete_category($category_ids);
        AjaxMessage::simple(true);
    }

    function editCategory()
    {
        _perm_required('category');

        $category_id = v('id');
        $data['category'] = get_category($category_id);
        $data['goods_list'] = get_goods_list();
        $data['category_goods_ids'] = get_category_goods_ids($category_id);

        render_to_web('admin/editCategory', null, $data);
    }

    function updateCategory()
    {
        _perm_required('category');

        $category_id = v('id');
        $name = v('name');
        $order = v('order');
        $goods_ids = v('goods');

        $data = array($name, $order);
        update_category($category_id, $data);
        update_category_goods($category_id, $goods_ids);

        forward('?c=admin&a=categoryList');
    }

    function articleList()
    {
        _perm_required('article');

        $data['pager'] = get_article_page(20, 9, "c=admin&a=articleList");
        render_to_web('admin/base', 'articleList', $data);
    }

    function addArticle()
    {
        _perm_required('article');

        render_to_web('admin/addArticle');
    }

    function isExistArticle()
    {
        _perm_required('article');

        $alias = v('alias');
        $previous = v('previous');

        if ($previous && $alias == $previous) {
            ajax_echo(json_encode(true), 'json');
            return;
        }

        $is_has = has_article($alias);
        ajax_echo(json_encode(!$is_has), 'json');
    }

    function saveArticle()
    {
        _perm_required('article');

        $type = v('type');
        $flag = v('flag');
        $alias = v('alias');
        $title = v('title');
        $content = v('content');

        if (!$flag) {
            $flag = 0;
        }

        $data = array($type, $flag, $alias, $title, $content);
        save_article($data);

        forward('?c=admin&a=articleList');
    }

    function deleteArticle()
    {
        _perm_required('article');

        $article_ids = v('ids');
        if (!$article_ids) {
            AjaxMessage::simple(false);
            return;
        }

        delete_article($article_ids);
        AjaxMessage::simple(true);
    }

    function editArticle()
    {
        _perm_required('article');

        $article_id = v('id');

        $data['article'] = get_article_by_id($article_id);
        render_to_web('admin/editArticle', null, $data);
    }

    function updateArticle()
    {
        _perm_required('article');

        $article_id = v('id');
        $type = v('type');
        $flag = v('flag');
        $alias = v('alias');
        $title = v('title');
        $content = v('content');

        if (!$flag) {
            $flag = 0;
        }

        $data = array($type, $flag, $alias, $title, $content);
        update_article($article_id, $data);

        forward('?c=admin&a=articleList');
    }

    function orderList()
    {

        _login_required();

        $data['pager'] = get_order_pager(50, 9, "c=admin&a=orderList");
        render_to_web('admin/base', 'orderList', $data);
    }

    function changeOrderStatus()
    {
        _perm_required('orders');

        $status = v('status');
        $order_ids = v('ids');
        if (!$order_ids) {
            AjaxMessage::simple(false);
            return;
        }

        update_order_status($order_ids, $status);
        AjaxMessage::simple(true);
    }
}
