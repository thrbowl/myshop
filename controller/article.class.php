<?php
if( !defined('IN') ) die('bad request');
include_once( AROOT . 'controller'.DS.'app.class.php' );
include_once(AROOT . 'model' . DS . 'sysconfig.function.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');
include_once(AROOT . 'model' . DS . 'category.function.php');
include_once(AROOT . 'model' . DS . 'order.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');
include_once(AROOT . 'model' . DS . 'article.function.php');

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
        render_to_web('base', 'article', $data);
    }

    function view2()
    {
        $article_alias = v('alias');

        $data['article'] = get_article_by_alias($article_alias);
        render_to_web('base', 'article', $data);
    }
}
