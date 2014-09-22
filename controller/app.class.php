<?php
if (!defined('IN')) die('bad request');
include_once(CROOT . 'controller' . DS . 'core.class.php');
include_once(AROOT . 'model' . DS . 'article.function.php');
include_once(AROOT . 'model' . DS . 'sysconfig.function.php');

class appController extends coreController
{
    function __construct()
    {
        // 载入默认的
        parent::__construct();
    }

    // login check or something

    protected function render_to_web($sharp, $component = NULL, $data = NULL)
    {
        $data['sysconfig'] = get_sysconfig();
        $data['notice'] = get_article_by_alias('notice');
        $GLOBALS['component'] = $component;
        render($data, 'web', $sharp);
    }
}
