<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'model' . DS . 'cart.function.php');

function save_order($cart_id, $data)
{
    $goods_list = get_cart_goods_list($cart_id);
    $user_id = get_cart_user_id($cart_id);

    $total = 0;
    foreach ($goods_list as $goods) {
        $total += $goods['price'] * $goods['num'];
    }

    $data[] = $user_id;
    $data[] = $total;
    $sql = prepare("INSERT INTO orders(`name`,`mobile`,`address`,`comments`,`user_id`,`total`,`createDate`)
                    VALUES(?s,?s,?s,?s,?s,?s,now())", $data);
    run_sql($sql);
    $order_id = last_id();

    $v = "";
    foreach ($goods_list as $goods) {
        if ($v) {
            $v .= ",";
        }
        $data = array($order_id, $goods['id'], $goods['num'], $goods['price']);
        $v .= "(" . implode(',', $data) . ")";
    }
    $sql = "INSERT INTO order_goods(`order_id`,`goods_id`,`num`,`price`) VALUES" . $v;
    run_sql($sql);

    delete_cart_goods_by_cart_id($cart_id);
}
