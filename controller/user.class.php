<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'lib' . DS . 'qq.class.php');
include_once(AROOT . 'model' . DS . 'cart.function.php');
include_once(AROOT . 'model' . DS . 'user.function.php');


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
                $tuser = get_tuser_by_open_id($qq->openid, 1);
                if ($tuser) {
                    $user_id = $tuser['user_id'];
                    $data = array($user_info->nickname);
                    update_tuser($user_id, 1, $data);
                } else {
                    $data = array($qq->openid, 1, $user_info->nickname);
                    $user_id = save_user($data);

                    $data = array(get_uuid(), $user_id);
                    save_cart($data);
                }
                $_SESSION['userid'] = $user_id;
                $_SESSION['nickname'] = $user_info->nickname;

                $source_cart_id = $_COOKIE['cartid'];
                $target_cart_id = get_user_cart_id($user_id);

                if ($source_cart_id && $target_cart_id) {
                    sync_cart($source_cart_id, $target_cart_id);
                }
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
