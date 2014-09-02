<?php
include_once(AROOT . 'lib' . DS . 'uuid.class.php');
session_start();

function get_uuid()
{
    return UUID::v4();
}

function getDBDate()
{
    return date('Y-m-d H:i:s');
}

function render_to_web($sharp, $component = NULL, $data = NULL)
{
    $GLOBALS['component'] = $component;
    render($data, 'web', $sharp);
}

function forward($url)
{
    header("Location: " . $url);
}

function jsforword($url)
{
    return '<script>location="' . $url . '"</script>';
}

class AjaxMessage
{
    public static function __callStatic($name, $arguments)
    {
        self::info($name, $arguments[0], $arguments[1]);
    }

    public static function info($type, $content, $data)
    {
        $res = array();
        $res['type'] = $type;
        $res['content'] = $content;
        $res['data'] = $data;

        ajax_echo(json_encode($res), 'json');
    }

    public static function simple($flag)
    {
        if ($flag) {
            self::success("操作成功");
        } else {
            self::error("操作失败");
        }
    }
}

