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
		$data['system'] = get_system();
		render( $data );
	}
}
	