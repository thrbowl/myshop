<?php
if (!defined('IN')) die('bad request');

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

function sync_cart($source_cart_id, $target_cart_id)
{

}