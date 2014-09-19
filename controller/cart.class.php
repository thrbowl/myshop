<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'lib' . DS . 'qq.class.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');
include_once(AROOT . 'model' . DS . 'category.function.php');
include_once(AROOT . 'model' . DS . 'order.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');
include_once(AROOT . 'model' . DS . 'cart.function.php');


class cartController extends appController
{
    function __construct()
    {
        parent::__construct();
    }

    function add_goods()
    {
        $cart_id = v('cart_id');
        $goods_id = v('goods_id');
        $goods_num = v('goods_num');

        $data = array($cart_id, $goods_id, $goods_num);
        add_cart_goods($data);
        AjaxMessage::simple(true);
    }

    function clear()
    {
        $cart_id = v('cart_id');

        delete_cart_goods_by_cart_id($cart_id);
        AjaxMessage::simple(true);
    }

    function delete_goods()
    {
        $cart_id = v('cart_id');
        $goods_id = v('goods_id');

        delete_cart_goods_by_ids($cart_id, array($goods_id));
        AjaxMessage::simple(true);
    }

    function update_goods_num()
    {
        $cart_id = v('cart_id');
        $goods_id = v('goods_id');
        $num = v('num');

        update_cart_goods_num($cart_id, $goods_id, $num);
        AjaxMessage::simple(true);
    }
}
