<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'lib' . DS . 'pagination.class.php');

function get_category_page($rows_per_page, $links_per_page, $append = "")
{
    $conn = db();
    $sql = "SELECT * FROM category ORDER BY `order`,`createDate` DESC";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}

function get_category_list()
{
    $sql = "SELECT * FROM category ORDER BY `order`,`createDate` DESC";
    return get_data($sql);
}

function has_category($category_name)
{
    $sql = prepare("SELECT 1 FROM category WHERE `name`=?s", array($category_name));
    return (bool)get_var($sql);
}

function save_category($data)
{
    $sql = prepare("INSERT INTO category(`name`,`order`,`createDate`) values(?s,?s,now())", $data);
    run_sql($sql);
    return last_id();
}

function delete_category($data)
{
    $sql = "DELETE FROM category WHERE `id` IN (" . implode(',', $data) . ")";
    run_sql($sql);

    $sql = "DELETE FROM goods_category WHERE `category_id` IN (" . implode(',', $data) . ")";
    run_sql($sql);
}

function get_category($category_id)
{
    $sql = prepare("SELECT * FROM category WHERE `id`=?s", array($category_id));
    return get_line($sql);
}

function update_category($category_id, $data)
{
    $data[] = $category_id;
    $sql = prepare("UPDATE category SET `name`=?s,`order`=?s WHERE `id`=?s", $data);
    run_sql($sql);
}

function get_goods_ids_by_category($category_id)
{
    $sql = prepare("SELECT goods_id FROM goods_category WHERE `category_id`=?s", array($category_id));
    $result = get_data($sql);
    $goods_ids = array();
    foreach ($result as $r) {
        $goods_ids[] = $r['goods_id'];
    }
    return $goods_ids;
}

function get_category_goods($category_id)
{
    $sql = prepare("SELECT A.* FROM goods AS A,goods_category AS B WHERE B.category_id=?s
                    AND A.id=B.goods_id", array($category_id));
    return get_data($sql);
}

function add_category_goods($category_id, $goods_ids)
{
    $v = "";
    foreach ($goods_ids as $goods_id) {
        if ($v) {
            $v .= ",";
        }
        $v .= "(" . $category_id . "," . $goods_id . ")";
    }
    $sql = "INSERT INTO goods_category(`category_id`,`goods_id`) values" . $v;
    run_sql($sql);
}

function delete_category_goods($category_id, $goods_ids)
{
    $sql = prepare("DELETE FROM goods_category WHERE `category_id`=%s AND `goods_id` IN ("
        . implode(',', $goods_ids) . ")", array($category_id));
    run_sql($sql);
}

function update_category_goods($category_id, $goods_ids)
{
    $old_good_ids = get_goods_ids_by_category($category_id);
    $add_ids = array_diff($goods_ids, $old_good_ids);
    $delete_ids = array_diff($old_good_ids, $goods_ids);
    if ($delete_ids) {
        delete_category_goods($category_id, $delete_ids);
    }
    if ($add_ids) {
        add_category_goods($category_id, $add_ids);
    }
}
