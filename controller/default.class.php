<?php
if( !defined('IN') ) die('bad request');
include_once( AROOT . 'controller'.DS.'app.class.php' );
include_once(AROOT . 'model' . DS . 'sysconfig.function.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');
include_once(AROOT . 'model' . DS . 'category.function.php');
include_once(AROOT . 'model' . DS . 'order.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');
include_once(AROOT . 'model' . DS . 'article.function.php');

class defaultController extends appController
{
	function __construct()
	{
		parent::__construct();
	}
	
	function index()
	{
        $category_id = v('cid');
        $order_by = v('order');

        $data['category_list'] = get_category_list();
        if (!$category_id && $data['category_list']) {
            $category_id = $data['category_list'][0]['id'];
        }
        $data['category_id'] = $category_id;
        $data['order_by'] = $order_by;
        $data['category_goods_list'] = get_category_goods($category_id, $order_by);
        $this->render_to_web('base', 'home', $data);
	}
}
