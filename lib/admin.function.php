<?php

function admin_check_login()
{
    if ($_SESSION['_id']) {
        return true;
    }
    return false;
}

function admin_login_required()
{
    if (!admin_check_login()) {
        return ajax_echo("<script>alert('登陆验证失败,请重新登陆');location.href='?c=admin'</script>");
    }
}

function admin_perm_required($perm)
{
    login_required();
    if (!($_SESSION['_is_super'] || in_array($perm, $_SESSION['_perms']))) {
        return ajax_echo("<script>alert('你没有访问该资源的权限');location.href='?c=admin'</script>");
    }
}
