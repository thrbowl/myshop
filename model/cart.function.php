<?php
if (!defined('IN')) die('bad request');

function init_cart()
{
    $cart_id = $_COOKIE['cartid'];
    if (!$cart_id) {
        $cart_id = get_uuid();
        $data = array($cart_id, null);
        save_cart($data);
        setcookie('cartid', $cart_id, time() + 31536000);
    }
    return $cart_id;
}

function sync_cart($source_cart_id, $target_cart_id)
{
    $sql = prepare("SELECT * FROM cart_goods WHERE `cart_id`=?s", array($source_cart_id));
    $result_source = get_data($sql);
    if (!$result_source) {
        return;
    }

    $sql = prepare("SELECT * FROM cart_goods WHERE `cart_id`=?s", array($target_cart_id));
    $result_target = get_data($sql);

    $target_data = array();
    foreach ($result_target as $r) {
        $target_data[$r['goods_id']] = $r;
    }

    $add_goods = array();
    $update_goods = array();
    foreach ($result_source as $r) {
        if (array_key_exists($r['goods_id'], $target_data)) {
            $update_goods[] = $r['id'];
        } else {
            $add_goods[] = $r['id'];
        }
    }

    $sql = prepare("UPDATE cart_goods SET `cart_id`=?s WHERE `id` IN (" . implode(',', $add_goods) . ")",
                    array($target_cart_id));
    run_sql($sql);

    delete_cart_goods_by_cart_id($source_cart_id);
}

function save_cart($data)
{
    $sql = prepare("INSERT INTO cart(`id`,`user_id`,`createDate`,`updateDate`) VALUES(?s,?s,now(),now())", $data);
    run_sql($sql);
}

function touch_cart($cart_id)
{
    $sql = prepare("UPDATE cart SET `updateDate`=now() WHERE `id`=?s", array($cart_id));
    run_sql($sql);
}

function get_user_cart_id($user_id)
{
    $sql = prepare("SELECT `id` FROM cart WHERE `user_id`=?s", array($user_id));
    return get_var($sql);
}

function add_cart_goods($cart_id, $data)
{
    $sql = prepare("INSERT INTO cart_goods(`cart_id`,`goods_id`,`num`) values(?s,?s,?s)", $data);
    run_sql($sql);

    touch_cart($cart_id);
}

function get_cart_goods_list($cart_id)
{
    $sql = prepare("SELECT A.id,A.name,A.price,B.num FROM goods AS A,cart_goods AS B WHERE `cart_id`=?s
                    AND A.id=B.goods_id", array($cart_id));
    return get_data($sql);
}

function has_cart_goods($cart_id, $goods_id)
{
    $sql = prepare("SELECT 1 FROM cart_goods WHERE `cart_id`=?s AND `goods_id`=?s",
        array($cart_id, $goods_id));
    return (bool)get_var($sql);
}

function delete_cart_goods_by_cart_id($cart_id)
{
    $sql = prepare("DELETE FROM cart_goods WHERE `cart_id`=?s", array($cart_id));
    run_sql($sql);

    touch_cart($cart_id);
}

function delete_cart_goods_by_goods_ids($cart_id, $goods_ids)
{
    $sql = prepare("DELETE FROM cart_goods WHERE `cart_id`=?s AND `goods_id` IN ("
        . implode(',', $goods_ids) . ")", array($cart_id));
    run_sql($sql);

    touch_cart($cart_id);
}

function update_cart_goods_num($cart_id, $goods_id, $num)
{
    $sql = prepare("UPDATE cart_goods SET `num`=?s WHERE `cart_id`=?s AND `goods_id`=?s",
            array($num, $cart_id, $goods_id));
    run_sql($sql);

    touch_cart($cart_id);
}
