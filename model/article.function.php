<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'lib' . DS . 'pagination.class.php');

function get_article_page($rows_per_page, $links_per_page, $append = "")
{
    $conn = db();
    $sql = "SELECT * FROM article ORDER BY createDate DESC";
    $pager = new PS_Pagination($conn, $sql, $rows_per_page, $links_per_page, $append);
    return $pager;
}

function has_article($article_alias)
{
    $sql = prepare("SELECT 1 FROM article WHERE `alias`=?s", array($article_alias));
    return (bool)get_var($sql);
}

function save_article($data)
{
    $sql = prepare("INSERT INTO article(`type`,`flag`,`alias`,`title`,`content`,`createDate`,`updateDate`)
                    values(?s,?s,?s,?s,?s,now(),now())", $data);
    run_sql($sql);
    return last_id();
}

function delete_article($data)
{
    $sql = "DELETE FROM article WHERE `id` IN (" . implode(',', $data) . ")";
    run_sql($sql);
}

function get_article($article_id)
{
    $sql = prepare("SELECT * FROM article WHERE `id`=?s", array($article_id));
    return get_line($sql);
}

function update_article($article_id, $data)
{
    $data[] = $article_id;
    $sql = prepare("UPDATE article SET `type`=?s,`flag`=?s,`alias`=?s,`title`=?s,
                    `content`=?s,`updateDate`=now() WHERE `id`=?s", $data);
    run_sql($sql);
}
