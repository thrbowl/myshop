<?php

/*
 * @brief ErrorCase类，封闭异常
 * */

class ErrorCase
{
    private $errorMsg;

    public function __construct()
    {
        $this->errorMsg = array(
            "50001" => "<h2>可能是服务器无法请求https协议</h2>可能未开启curl支持,请尝试开启curl支持，重启web服务器，如果问题仍未解决，请联系我们"
        );
    }

    /**
     * showError
     * 显示错误信息
     * @param int $code 错误代码
     * @param string $description 描述信息（可选）
     */
    public function showError($code, $description = '$')
    {

        echo "<meta charset=\"UTF-8\">";
        if ($description == "$") {
            die($this->errorMsg[$code]);
        } else {
            echo "<h3>error:</h3>$code";
            echo "<h3>msg  :</h3>$description";
            exit();
        }
    }

    public function showTips($code, $description = '$')
    {
    }
}

/*
 * @brief url封装类，将常用的url请求操作封装在一起
 * */

class URL
{
    private $error;

    public function __construct()
    {
        $this->error = new ErrorCase();
    }

    /**
     * combineURL
     * 拼接url
     * @param string $baseURL 基于的url
     * @param array $keysArr 参数列表数组
     * @return string           返回拼接的url
     */
    public function combineURL($baseURL, $keysArr)
    {
        $combined = $baseURL . "?";
        $valueArr = array();

        foreach ($keysArr as $key => $val) {
            $valueArr[] = "$key=$val";
        }

        $keyStr = implode("&", $valueArr);
        $combined .= ($keyStr);

        return $combined;
    }

    /**
     * get_contents
     * 服务器通过get请求获得内容
     * @param string $url 请求的url,拼接后的
     * @return string           请求返回的内容
     */
    public function get_contents($url)
    {
        if (ini_get("allow_url_fopen") == "1") {
            $response = file_get_contents($url);
        } else {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($ch, CURLOPT_URL, $url);
            $response = curl_exec($ch);
            curl_close($ch);
        }

        //-------请求为空
        if (empty($response)) {
            $this->error->showError("50001");
        }

        return $response;
    }

    /**
     * get
     * get方式请求资源
     * @param string $url 基于的baseUrl
     * @param array $keysArr 参数列表数组
     * @return string         返回的资源内容
     */
    public function get($url, $keysArr)
    {
        $combined = $this->combineURL($url, $keysArr);
        return $this->get_contents($combined);
    }

    /**
     * post
     * post方式请求资源
     * @param string $url 基于的baseUrl
     * @param array $keysArr 请求的参数列表
     * @param int $flag 标志位
     * @return string           返回的资源内容
     */
    public function post($url, $keysArr, $flag = 0)
    {

        $ch = curl_init();
        if (!$flag) curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $keysArr);
        curl_setopt($ch, CURLOPT_URL, $url);
        $ret = curl_exec($ch);

        curl_close($ch);
        return $ret;
    }
}

class QQ
{

    const VERSION = "2.0";
    const GET_AUTH_CODE_URL = "https://graph.qq.com/oauth2.0/authorize";
    const GET_ACCESS_TOKEN_URL = "https://graph.qq.com/oauth2.0/token";
    const GET_OPENID_URL = "https://graph.qq.com/oauth2.0/me";

    public $urlUtils;
    protected $error;


    function __construct($code, $app_id, $app_key, $redirect_uri)
    {
        $this->code = $code;
        $this->app_id = $app_id;
        $this->app_key = $app_key;
        $this->redirect_uri = $redirect_uri;
        $this->urlUtils = new URL();
        $this->error = new ErrorCase();
        $this->access_token = null;
        $this->openid = null;
    }

    private function get_access_token()
    {
        if (!isset($this->access_token)) {
            //-------请求参数列表
            $keysArr = array(
                "grant_type" => "authorization_code",
                "client_id" => $this->app_id,
                "client_secret" => $this->app_key,
                "redirect_uri" => urlencode($this->redirect_uri),
                "code" => $this->code
            );

            //------构造请求access_token的url
            $token_url = $this->urlUtils->combineURL(self::GET_ACCESS_TOKEN_URL, $keysArr);
            $response = $this->urlUtils->get_contents($token_url);

            if (strpos($response, "callback") !== false) {

                $lpos = strpos($response, "(");
                $rpos = strrpos($response, ")");
                $response = substr($response, $lpos + 1, $rpos - $lpos - 1);
                $msg = json_decode($response);

                if (isset($msg->error)) {
                    $this->error->showError($msg->error, $msg->error_description);
                }
            }

            $params = array();
            parse_str($response, $params);

            $this->access_token = $params["access_token"];
        }

        return $this->access_token;
    }

    private function get_openid()
    {
        if (!isset($this->openid)) {
            //-------请求参数列表
            $keysArr = array(
                "access_token" => $this->get_access_token()
            );

            $graph_url = $this->urlUtils->combineURL(self::GET_OPENID_URL, $keysArr);
            $response = $this->urlUtils->get_contents($graph_url);

            //--------检测错误是否发生
            if (strpos($response, "callback") !== false) {

                $lpos = strpos($response, "(");
                $rpos = strrpos($response, ")");
                $response = substr($response, $lpos + 1, $rpos - $lpos - 1);
            }

            $data = json_decode($response);
            if (isset($data->error)) {
                $this->error->showError($data->error, $data->error_description);
            }

            $this->openid = $data->openid;
        }

        return $this->openid;
    }

    public function get_user_info()
    {

        //-------请求参数列表
        $keysArr = array(
            "oauth_consumer_key" => $this->app_id,
            "access_token" => $this->get_access_token(),
            "openid" => $this->get_openid()
        );

        $graph_url = $this->urlUtils->combineURL("https://graph.qq.com/user/get_user_info", $keysArr);
        $response = $this->urlUtils->get_contents($graph_url);

        //--------检测错误是否发生
        if (strpos($response, "callback") !== false) {

            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response = substr($response, $lpos + 1, $rpos - $lpos - 1);
        }

        $data = json_decode($response);
        //检查返回ret判断api是否成功调用
        if ($data->ret == 0) {
            return $data;
        } else {
            $this->error->showError($data->ret, $data->msg);
        }
    }
}
