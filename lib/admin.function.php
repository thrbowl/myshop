<?php

function _check_login()
{
    if ($_SESSION['_userid']) {
        return true;
    }
    return false;
}

function _login_required()
{
    if (!_check_login()) {
        return ajax_echo("<script>alert('登陆验证失败,请重新登陆');location.href='?c=admin'</script>");
    }
}

function _perm_required($perm)
{
    _login_required();
    if (!($_SESSION['_is_super'] || in_array($perm, $_SESSION['_perms']))) {
        return ajax_echo("<script>alert('你没有访问该资源的权限');location.href='?c=admin'</script>");
    }
}
