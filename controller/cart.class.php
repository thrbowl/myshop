<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');

class cartController extends appController
{
    function __construct()
    {
        parent::__construct();
    }

    function index()
    {
        $cart_id = v('id');

        $data['cart_goods'] = get_cart_goods_list($cart_id);
        render_to_web('cart', null, $data);
    }

    function add_goods()
    {
        $cart_id = v('id');
        $goods_id = v('goods_id');
        $num = v('num');

        add_goods($cart_id, $goods_id, $num);
        AjaxMessage::simple(true);
    }

    function clear()
    {
        $cart_id = v('id');

        delete_cart_goods_by_cart_id($cart_id);
        AjaxMessage::simple(true);
    }

    function delete_goods()
    {
        $cart_id = v('id');
        $goods_id = v('goods_id');

        delete_cart_goods_by_ids($cart_id, array($goods_id));
        AjaxMessage::simple(true);
    }

    function update_goods_num()
    {
        $cart_id = v('id');
        $goods_id = v('goods_id');
        $num = v('num');

        update_cart_goods_num($cart_id, $goods_id, $num);
        AjaxMessage::simple(true);
    }
}
