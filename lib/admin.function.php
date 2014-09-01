<?php

function check_login()
{
    if ($_SESSION['_id']) {
        return true;
    }
    return false;
}

function login_required()
{
    if (!check_login()) {
        return ajax_echo("<script>alert('登陆验证失败,请重新登陆');location.href='?c=admin'</script>");
    }
}

function perm_required($perm)
{
    login_required();
    $admin = c('admin');
    if (!($perm == $admin['index'] || $_SESSION['_is_super'] || in_array($perm, $_SESSION['_perms']))) {
        return ajax_echo("<script>alert('你没有访问该资源的权限');location.href='?c=admin'</script>");
    }
}
