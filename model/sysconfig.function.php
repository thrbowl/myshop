<?php
if (!defined('IN')) die('bad request');

function get_sysconfig()
{
    $sql = "SELECT * FROM sysconfig";
    $result = get_line($sql);
    return $result;
}

function update_sysconfig($data)
{
    $sql = prepare("UPDATE sysconfig SET `name`=?s,`status`=?i,`start_time`=?s,`end_time`=?s,
                    `phone`=?s,`comments`=?s", $data);
    run_sql($sql);
}
