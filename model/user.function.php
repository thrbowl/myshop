<?php
if (!defined('IN')) die('bad request');

function get_tuser_by_user_id($user_id, $flag)
{
    $sql = prepare("SELECT * FROM third_connect WHERE `user_id`=?s AND `flag`=?s", array($user_id, $flag));
    return get_line($sql);
}

function get_tuser_by_open_id($open_id, $flag)
{
    $sql = prepare("SELECT * FROM third_connect WHERE `open_id`=?s AND `flag`=?s", array($open_id, $flag));
    return get_line($sql);
}

function update_tuser($user_id, $flag, $data)
{
    $data[] = $user_id;
    $data[] = $flag;
    $sql = prepare("UPDATE third_connect SET `nickname`=?s WHERE `user_id`=?s AND `flag`=?s", $data);
    run_sql($sql);
}

function get_user($user_id)
{
    $sql = prepare("SELECT * FROM users WHERE `id`=?s", array($user_id));
    return get_line($sql);
}

function update_user($user_id, $data)
{
    $data[] = $user_id;
    $sql = prepare("UPDATE users SET `name`=?s,`mobile`=?s,`address`=?s WHERE `id`=?s", $data);
    run_sql($sql);
}

function save_user($data)
{
    $sql = "INSERT INTO users(`createDate`) VALUES(now())";
    run_sql($sql);
    $user_id = last_id();

    $data[] = $user_id;
    $sql = prepare("INSERT INTO third_connect(`open_id`,`flag`,`nickname`,`user_id`,`createDate`)
                    VALUES(?s,?s,?s,?s,now())", $data);
    run_sql($sql);
    return $user_id;
}
