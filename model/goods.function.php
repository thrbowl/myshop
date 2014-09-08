<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'lib' . DS . 'pagination.class.php');

function get_goods_page($rows_per_page, $links_per_page, $append = "")
{
    $conn = db();
    $sql = "SELECT * FROM goods WHERE `status`!=-1 ORDER BY createDate DESC";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}

function get_goods_list()
{
    $sql = "SELECT * FROM goods WHERE `status`!=-1 ORDER BY `createDate` DESC";
    return get_data($sql);
}

function has_goods($goods_name)
{
    $sql = prepare("SELECT 1 FROM goods WHERE `status`!=-1 AND `name`=?s", array($goods_name));
    return (bool)get_var($sql);
}

function save_goods($data)
{
    $sql = prepare("INSERT INTO goods(`name`,`picture`,`price`,`description`,`status`,`createDate`)
                    values(?s,?s,?s,?s,?s,?s)", $data);
    run_sql($sql);
    return last_id();
}

function delete_goods($data)
{
    $sql = "UPDATE goods SET `status`=-1 WHERE `id` IN (" . implode(',', $data) . ")";
    run_sql($sql);

    $sql = "DELETE FROM goods_category WHERE `goods_id` IN (" . implode(',', $data) . ")";
    run_sql($sql);
}

function get_goods($goods_id)
{
    $sql = prepare("SELECT * FROM goods WHERE `status`!=-1 AND `id`=?s", array($goods_id));
    return get_line($sql);
}

function update_goods($goods_id, $data)
{
    $data[] = $goods_id;
    $sql = prepare("UPDATE goods SET `name`=?s,`picture`=?s,`price`=?s,`description`=?s,
                    `status`=?s WHERE `id`=?s", $data);
    run_sql($sql);
}

function get_category_ids_by_goods($goods_id)
{
    $sql = prepare("SELECT category_id FROM goods_category WHERE `goods_id`=?s", array($goods_id));
    $result = get_data($sql);
    $category_ids = array();
    foreach ($result as $r) {
        $category_ids[] = $r['category_id'];
    }
    return $category_ids;
}

function add_goods_category($goods_id, $category_ids)
{
    $v = "";
    foreach ($category_ids as $category_id) {
        if ($v) {
            $v .= ",";
        }
        $v .= "(" . $category_id . "," . $goods_id . ")";
    }
    $sql = "INSERT INTO goods_category(`category_id`,`goods_id`) values" . $v;
    run_sql($sql);
}

function delete_goods_category($goods_id, $category_ids)
{
    $sql = prepare("DELETE FROM goods_category WHERE `goods_id`=%s AND `category_id` IN ("
        . implode(',', $category_ids) . ")", array($goods_id));
    run_sql($sql);
}

function update_goods_category($goods_id, $category_ids)
{
    $old_category_ids = get_category_ids_by_goods($goods_id);
    $add_ids = array_diff($category_ids, $old_category_ids);
    $delete_ids = array_diff($old_category_ids, $category_ids);
    if ($delete_ids) {
        delete_goods_category($goods_id, $delete_ids);
    }
    if ($add_ids) {
        add_goods_category($goods_id, $add_ids);
    }
}