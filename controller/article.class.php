<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');

class articleController extends appController
{
    function __construct()
    {
        parent::__construct();
    }

    function view1()
    {
        $article_id = v('id');

        $data['article'] = get_article_by_id($article_id);
        $this->render_to_web('base', 'article', $data);
    }

    function view2()
    {
        $article_alias = v('alias');

        $data['article'] = get_article_by_alias($article_alias);
        $this->render_to_web('base', 'article', $data);
    }
}
