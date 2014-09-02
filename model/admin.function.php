<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'lib' . DS . 'pagination.class.php');

function get_system()
{
    $sql = "SELECT * FROM system";
    $system = get_line($sql);
    return $system;
}

function update_system($data)
{
    $sql = prepare("UPDATE system SET `name`=?s,`status`=?i,`start_time`=?s,`end_time`=?s,`phone`=?s,`comments`=?s", $data);
    return run_sql($sql);
}

function get_menu($rows_per_page, $links_per_page, $append = "")
{
    $conn = db();
    $sql = "SELECT * FROM goods";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}
