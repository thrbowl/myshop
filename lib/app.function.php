<?php
include_once(AROOT . 'config' . DS . 'sms.config.php');
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

function check_login()
{
    if (!$_SESSION["userid"]) {
        return false;
    }
    return true;
}

function send_sms($mobile, $content)
{
    $sms_config = c('sms');
    $curl = curl_init($sms_config['api_url']);
    $request = array(
        'sms_type' => $sms_config['sflag'],
        'zh' => $sms_config['account'],
        'mm' => $sms_config['password'],
        'hm' => $mobile,
        'nr' => $content
    );
    var_dump($request);
    $options = array(
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_FOLLOWLOCATION => false,
        CURLOPT_MAXREDIRS => 3,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => $request,
    );
    curl_setopt_array($curl, $options);
    $response = curl_exec($curl);
    $status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    curl_close($curl);

    if ($status == 200) {
        $retAttrs = explode(':', $response);
        if ($retAttrs[0] == 0) {
            #Todo: real success
        }
    }
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

