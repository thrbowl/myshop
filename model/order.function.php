<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'model' . DS . 'cart.function.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');

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

function get_order_pager($rows_per_page, $links_per_page, $append = "")
{
    $conn = db();
    $sql = "SELECT * FROM orders WHERE `status`!=-1 AND `status`!=9 ORDER BY `status`,`createDate` ASC";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}

function get_order_list()
{
    $sql = "SELECT * FROM orders WHERE `status`!=-1 AND `status`!=9 ORDER BY `status`,`createDate` ASC";
    return get_data($sql);
}

function update_order_status($order_ids, $status)
{
    $sql = prepare("UPDATE orders SET `status`=?s WHERE `id` IN (" . implode(',', $order_ids) . ")", array($status));
    run_sql($sql);

    if ($status == 9) {
        foreach ($order_ids as $order_id) {
            $order_goods_list = get_order_goods_list($order_id);
            foreach ($order_goods_list as $goods) {
                update_goods_sale($goods['id'], $goods['num']);
            }
        }
    }
}

function get_order_goods_list($order_id)
{
    $sql = prepare("SELECT A.id,A.name,A.price,B.num FROM goods AS A,order_goods AS B WHERE `order_id`=?s
                    AND A.id=B.goods_id", array($order_id));
    return get_data($sql);
}
