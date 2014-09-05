<?php
if( !defined('IN') ) die('bad request');
include_once( AROOT . 'controller'.DS.'app.class.php' );
include_once( AROOT . 'model'.DS.'admin.function.php' );

class defaultController extends appController
{
	function __construct()
	{
		parent::__construct();
	}
	
	function index()
	{
        $category_id = v('cid');

		$data['system'] = get_system();
        $data['category_list'] = get_all_category();
        if (!$category_id) {
            $category_id = $data['category_list'][0]['id'];
        }
        $data['category_id'] = $category_id;
        $data['goods_list'] = get_goods_by_category($category_id);
		render( $data );
	}
}
