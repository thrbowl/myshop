<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'lib' . DS . 'qq.class.php');
include_once(AROOT . 'model' . DS . 'goods.function.php');
include_once(AROOT . 'model' . DS . 'category.function.php');
include_once(AROOT . 'model' . DS . 'order.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');
include_once(AROOT . 'model' . DS . 'cart.function.php');


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
            if ($user_info->nickname) {
                $tuser = get_tuser_by_openid($qq->openid, 1);
                if ($tuser) {
                    $userid = $tuser['userid'];
                    update_tuser($userid, $user_info->nickname);
                } else {
                    $data = array($qq->openid, $user_info->nickname, 1);
                    $userid = save_user($data);

                    $data = array(get_uuid(), $userid);
                    save_cart($data);
                }
                $_SESSION['userid'] = $userid;
                $_SESSION['nickname'] = $user_info->nickname;

                sync_cart();
            }
        }

        forward("?");
    }

    function logout()
    {
        session_unset();
        session_destroy();
        forward("?");
    }
}
