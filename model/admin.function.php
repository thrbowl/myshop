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
    return (bool)run_sql($sql);
}

function get_page_goods($rows_per_page, $links_per_page, $append = "")
{
    $conn = db();
    $sql = "SELECT * FROM goods WHERE `status`!=-1 ORDER BY createDate DESC";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}

function get_all_goods()
{
    $sql = "SELECT * FROM goods WHERE `status`!=-1 ORDER BY `createDate` DESC";
    return get_data($sql);
}

function has_goods($name)
{
    $sql = prepare("SELECT 1 FROM goods WHERE `status`!=-1 AND `name`=?s", array($name));
    return (bool)get_var($sql);
}

function save_goods($data)
{
    $sql = prepare("INSERT INTO goods(`name`,`picture`,`price`,`description`,`status`,`createDate`) values(?s,?s,?s,?s,?s,?s)", $data);
    return (bool)run_sql($sql);
}

function delete_goods($data)
{
    $sql = "UPDATE goods SET `status`=-1 WHERE `id` IN (" . implode(',', $data) . ")";
    return (bool)run_sql($sql);
}

function get_goods($id)
{
    $sql = prepare("SELECT * FROM goods WHERE `status`!=-1 AND `id`=?s", array($id));
    return get_line($sql);
}

function update_goods($id, $data)
{
    $data[] = $id;
    $sql = prepare("UPDATE goods SET `name`=?s,`picture`=?s,`price`=?s,`description`=?s,`status`=?s WHERE `id`=?s", $data);
    return (bool)run_sql($sql);
}

function get_page_category($rows_per_page, $links_per_page, $append = "")
{
    $conn = db();
    $sql = "SELECT * FROM category ORDER BY `order`,`createDate` DESC";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}

function has_category($name)
{
    $sql = prepare("SELECT 1 FROM category WHERE `name`=?s", array($name));
    return (bool)get_var($sql);
}

function save_category($data)
{
    $sql = prepare("INSERT INTO category(`name`,`order`,`createDate`) values(?s,?s,?s)", $data);
    run_sql($sql);
    return last_id($sql);
}

function add_goods_to_category($category_id, $goods_list)
{

}