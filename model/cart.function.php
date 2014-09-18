<?php
if (!defined('IN')) die('bad request');

function init_cart()
{
    $cart_id = $_COOKIE['cart_id'];
    if (!$cart_id) {
        $cart_id = get_uuid();
        $data = array($cart_id, null);
        save_cart($data);
        setcookie('cart_id', $cart_id, time() + 31536000);
    }
    return $cart_id;
}

function sync_cart()
{
    $source_cart_id = $_COOKIE['cart_id'];

    $userid = $_SESSION['userid'];
    $target_cart_id = get_cart_id($userid);

    if (!($source_cart_id && $target_cart_id)) {
        return;
    }

    $sql = prepare("SELECT * FROM cart_goods WHERE `cart_id`=?s", array($source_cart_id));
    $result = get_data($sql);
    if (!$result) {
        return;
    }

    $sql = prepare("SELECT * FROM cart_goods WHERE `cart_id`=?s", array($target_cart_id));
    $result = get_data($sql);

    $target_goods_ids = array();
    $target_data = array();
    foreach ($result as $r) {
        $target_goods_ids[] = $r['id'];
        $target_data[$r['goods_id']] = $r;
    }

    $source_goods_ids = array();
    $add_goods = array();
    $update_goods = array();
    foreach ($result as $r) {
        $source_goods_ids[] = $r['id'];
        if (array_key_exists($r['id'], $target_data)) {
            //$
            //$update_goods[$r['id']] = $r['num'] + ;
        } else {
            $add_goods[] = $r;
        }
    }


}

function save_cart($data)
{
    $sql = prepare("INSERT INTO cart(`id`,`user_id`,`createDate`) values(?s,?s,now())", $data);
    run_sql($sql);
}

function get_cart_id($userid)
{
    $sql = prepare("SELECT `id` FROM cart WHERE `user_id`=?s", array($userid));
    return get_var($sql);
}

function add_goods($data)
{

}