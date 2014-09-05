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
    $sql = "SELECT * FROM category ORDER BY `order`,`createDate` ASC";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}

function get_all_category()
{
    $sql = "SELECT * FROM category ORDER BY `order`,`createDate` ASC";
    return get_data($sql);
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
    return last_id();
}

function delete_category($data)
{
    $sql = "DELETE FROM category WHERE `id` IN (" . implode(',', $data) . ")";
    run_sql($sql);

    $sql = "DELETE FROM goods_category WHERE `category_id` IN (" . implode(',', $data) . ")";
    run_sql($sql);

    return true;
}

function get_category($id)
{
    $sql = prepare("SELECT * FROM category WHERE `id`=?s", array($id));
    return get_line($sql);
}

function update_category($id, $data)
{
    $data[] = $id;
    $sql = prepare("UPDATE category SET `name`=?s,`order`=?s WHERE `id`=?s", $data);
    return (bool)run_sql($sql);
}

function get_goods_ids_by_category($id)
{
    $sql = prepare("SELECT goods_id FROM goods_category WHERE `category_id`=?s", array($id));
    $rs = get_data($sql);
    $goods_ids = array();
    foreach ($rs as $r) {
        $goods_ids[] = $r['goods_id'];
    }
    return $goods_ids;
}

function get_goods_by_category($id)
{
    $sql = prepare("SELECT A.* FROM goods AS A,goods_category AS B WHERE B.category_id=?s AND A.id=B.goods_id", array($id));
    return get_data($sql);
}

function add_category_goods($category_id, $goods_list)
{
    $v = "";
    foreach ($goods_list as $goods_id) {
        if ($v) {
            $v .= ",";
        }
        $v .= "(" . $category_id . "," . $goods_id . ")";
    }
    $sql = "INSERT INTO goods_category(`category_id`,`goods_id`) values" . $v;
    return (bool)run_sql($sql);
}

function delete_category_goods($category_id, $data)
{
    $sql = prepare("DELETE FROM goods_category WHERE `category_id`=%s AND `goods_id` IN (" . implode(',', $data) . ")", array($category_id));
    return (bool)run_sql($sql);
}

function update_category_goods($category_id, $data)
{
    $good_ids = get_goods_ids_by_category($category_id);
    $add_ids = array_diff($data, $good_ids);
    $delete_ids = array_diff($good_ids, $data);

    if ($delete_ids) {
        delete_category_goods($category_id, $delete_ids);
    }
    if ($add_ids) {
        add_category_goods($category_id, $add_ids);
    }

    return true;
}