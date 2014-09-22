<?php
if (!defined('IN')) die('bad request');
include_once(AROOT . 'controller' . DS . 'app.class.php');
include_once(AROOT . 'model' . DS . 'user.function.php');

class orderController extends appController
{
    function __construct()
    {
        parent::__construct();
    }

    function add_order()
    {
        $cart_id = v('cart_id');

        $data['cart_id'] = $cart_id;
        if (check_login()) {
            $data['user'] = get_user($_SESSION['userid']);
        }
        render_to_web('addorder', null, $data);
    }

    function save_order()
    {
        $name = v('name');
        $mobile = v('mobile');
        $address = v('address');
        $cart_id = v('cart_id');
        $is_sync = v('is_sync');

        if (check_login() && $is_sync == 1) {
            $data = array($name, $mobile, $address);
            update_user($_SESSION['userid'], $data);
        }


        AjaxMessage::simple(true);
    }
}
