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
