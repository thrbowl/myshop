<?php
if (!defined('IN')) die('bad request');

function get_tuser_by_userid($userid, $flag)
{
    $sql = prepare("SELECT * FROM third_connect WHERE `userid`=?s AND `flag`=?s", array($userid, $flag));
    return get_line($sql);
}

function get_tuser_by_openid($openid, $flag)
{
    $sql = prepare("SELECT * FROM third_connect WHERE `openid`=?s AND `flag`=?s", array($openid, $flag));
    return get_line($sql);
}

function update_tuser($userid, $nickname)
{
    $sql = prepare("UPDATE third_connect SET `nickname`=?s WHERE `userid`=?s", array($nickname, $userid));
    run_sql($sql);
}

function get_user($userid)
{
    $sql = prepare("SELECT * FROM users WHERE `userid`=?s", array($userid));
    return get_line($sql);
}

function save_user($data)
{
    $sql = "INSERT INTO users(`createDate`) values(now())";
    run_sql($sql);
    $userid = last_id();

    $data[] = $userid;
    $sql = prepare("INSERT INTO third_connect(`openid`,`nickname`,`flag`,`userid`,`createDate`)
                    values(?s,?s,?s,?s,now())", $data);
    run_sql($sql);
    return $userid;
}