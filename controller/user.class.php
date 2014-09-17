<?php
if( !defined('IN') ) die('bad request');
include_once( AROOT . 'controller'.DS.'app.class.php' );
include_once(AROOT . 'lib' . DS . 'qq.class.php');
include_once(AROOT . 'model' . DS . 'sysconfig.function.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');
include_once(AROOT . 'model' . DS . 'category.function.php');
include_once(AROOT . 'model' . DS . 'order.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');
include_once(AROOT . 'model' . DS . 'article.function.php');


class userController extends appController
{
    function __construct()
    {
        parent::__construct();
    }

    function auth()
    {
        $code = v('code');
        $from = v('from');
        if ($from == 'qq') {
            $qq = new QQ($code, c('qq_app_id'), c('qq_app_key'), c('qq_redirect_uri'));
            $user_info = $qq->get_user_info();
            var_dump($user_info);
            exit();
        }

        $this->render_to_web('base', 'article', null);
    }
}
