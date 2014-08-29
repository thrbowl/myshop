/*
 * JavaScript - Common
 */

/* JS扩展 *************************************************************************************************************/
Date.prototype.format = function (format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
};

/* Jquery扩展 *********************************************************************************************************/
(function ($) {
    var zIndex = 100002;

    // 跳转登录
    $.redirectLogin = function (redirectUrl, message) {
        var href = BaseURL + "/login.jhtml";
        if (redirectUrl != null) {
            href += "?redirectUrl=" + encodeURIComponent(redirectUrl);
        }
        if (message != null) {
            $.message("warn", message);
            setTimeout(function () {
                location.href = href;
            }, 1000);
        } else {
            location.href = href;
        }
    };

    // 消息框
    var $message;
    var messageTimer;
    $.message = function () {
        var message = {};
        if ($.isPlainObject(arguments[0])) {
            message = arguments[0];
        } else if (typeof arguments[0] === "string" && typeof arguments[1] === "string") {
            message.type = arguments[0];
            message.content = arguments[1];
        } else {
            return false;
        }

        if (message.type == null || message.content == null) {
            return false;
        }

        if ($message == null) {
            $message = $('<div class="xxMessage"><div class="messageContent message' + message.type + 'Icon"><\/div><\/div>');
            if (!window.XMLHttpRequest) {
                $message.append('<iframe class="messageIframe"><\/iframe>');
            }
            $message.appendTo("body");
        }

        $message.children("div").removeClass("messagewarnIcon messageerrorIcon messagesuccessIcon").addClass("message" + message.type + "Icon").html(message.content);
        $message.css({"margin-left": -parseInt($message.outerWidth() / 2), "z-index": zIndex++}).show();

        clearTimeout(messageTimer);
        messageTimer = setTimeout(function () {
            $message.hide();
        }, 3000);
        return $message;
    };

    // 通用验证对象初始化函数
    if (typeof $.formValidator != "undefined") {
        $.formValidator.commInitConfig = function (formID, ajaxFailCallback, options) {
            var defaults = {
                formID: formID,
                //submitOnce: true,
                onError: function (msg) {
                    alert(msg)
                },
                onSuccess: function () {
                    var $form = $("#" + this.formID);
                    $.post($form.attr("action"), $form.serialize(), function (message) {
                        commMsgHandler(message);
                        if (message.type == "error") {
                            if (typeof ajaxFailCallback != "undefined" && $.isFunction(ajaxFailCallback)) {
                                ajaxFailCallback();
                            }
                        }
                    });
                    return false;
                }
            };
            options = $.extend(defaults, options);
            $.formValidator.initConfig(options);
        }
    }

})(jQuery);

// 添加Cookie
function addCookie(name, value, options) {
    if (arguments.length > 1 && name != null) {
        if (options == null) {
            options = {};
        }
        if (value == null) {
            options.expires = -1;
        }
        if (typeof options.expires == "number") {
            var time = options.expires;
            var expires = options.expires = new Date();
            expires.setTime(expires.getTime() + time * 1000);
        }
        document.cookie = encodeURIComponent(String(name)) + "=" + encodeURIComponent(String(value))
            + (options.expires ? "; expires=" + options.expires.toUTCString() : "")
            + (options.path ? "; path=" + options.path : "")
            + (options.domain ? "; domain=" + options.domain : ""), (options.secure ? "; secure" : "");
    }
}

// 获取Cookie
function getCookie(name) {
    if (name != null) {
        var value = new RegExp("(?:^|; )" + encodeURIComponent(String(name)) + "=([^;]*)").exec(document.cookie);
        return value ? decodeURIComponent(value[1]) : null;
    }
}

// 移除Cookie
function removeCookie(name, options) {
    addCookie(name, null, options);
}

//获取当前时间
function getCurrentUtime() {
    var now = new Date();
    return now.getTime();
}

//获取当前时间
function getCurrentDtime() {
    var now = new Date();
    return now.format("yyyy-MM-dd hh:mm:ss");
}

// 检查是否登录，否则页面正中显示登录框
function checkLogin() {
    if (!IsLogin) {
        var h = window.screen.availHeight;
        //var w = window.screen.availWidth;
        var w = document.body.clientWidth;
        var $loginbox = $("#loginbox");
        $loginbox.css('top', (h / 2 - $loginbox.height()) + 'px');
        $loginbox.css('left', (w - $loginbox.width()) / 2 + 'px');
        $loginbox.css('display', 'block');
        $('#overloy').show();
        $("#loginbox #FAccount").focus();
        return false;
    }
    return true;
}

// 跳转URL
function go(url) {
    location.href = url;
}

// 通用message处理函数
function commMsgHandler(message) {
    $.message(message);
    if (message.type == "success") {
        go(RedirectUrl);
    }
}

// 重新渲染iframe尺寸
function resizeIframe(frame) {
    var height = $(frame).contents().find("body").height();
    //+60 to fixed the safari comment cover issue
    $(frame).height(height > 600 ? height + 60 : 600 + 60);
}

// 申请领队
function applyCaptain() {
    $.post(BaseURL + "/account/applyCaptain.jhtml", function (message) {
        commMsgHandler(message);
        if (message.type == "error") {
            go(BaseURL + "/account/checkApplyCaptainAuth.jhtml");
        }
    });
}

/* 通用验证函数 ********************************************************************************************************/
function isEmptyContent(text) {
    return ($.trim(text) == "") || ($.trim(text).replace(/(<br>|<p>|<\/p>|&nbsp;|\n)/gi, '') == "");
}

function isEmptyField(text) {
    return $.trim(text) == "";
}

function isNonEmptyContent(text) {
    return !isEmptyContent(text);
}

function isNonEmptyField(text) {
    return !isEmptyField(text);
}

/* 页面初始化 ******************************************************************************************************/
$(function () {
    // 不缓存ajax请求, (fuck IE8)
    $.ajaxSetup({cache: false});

    // 令牌
    $("form").submit(function () {
        var $this = $(this);
        if ($this.attr("method") != null && $this.attr("method").toLowerCase() == "post" && $this.find("input[name='token']").size() == 0) {
            var token = getCookie("token");
            if (token != null) {
                $this.append('<input type="hidden" name="token" value="' + token + '" \/>');
            }
        }
    });

    // 令牌
    $(document).ajaxSend(function (event, request, settings) {
        if (!settings.crossDomain && settings.type != null && settings.type.toLowerCase() == "post") {
            var token = getCookie("token");
            if (token != null) {
                request.setRequestHeader("token", token);
            }
        }
    });

    // Ajax登陆验证
    $(document).ajaxComplete(function (event, request, settings) {
        var loginStatus = request.getResponseHeader("loginStatus");
        var tokenStatus = request.getResponseHeader("tokenStatus");

        if (loginStatus == "accessDenied") {
            $.redirectLogin(location.href, "请登录后再进行操作");
        } else if (tokenStatus == "accessDenied") {
            var token = getCookie("token");
            if (token != null) {
                $.extend(settings, {
                    global: false,
                    headers: {token: token}
                });
                $.ajax(settings);
            }
        }
    });

    // 登陆表单验证
    $.formValidator.commInitConfig("FLoginForm", null, {validatorGroup: "999"});
    $("#FAccount").formValidator({validatorGroup: "999", onShow: "", onFocus: "", onCorrect: "", defaultValue: ""})
        .functionValidator({fun: isNonEmptyField, onError: "请输入手机/邮箱/用户名"});
    $("#FPassword").formValidator({validatorGroup: "999", onShow: "", onFocus: "", onCorrect: "", defaultValue: ""})
        .functionValidator({fun: isNonEmptyField, onError: "请输入密码"});

    // 初始化日期控件
    if (typeof $.datepicker != "undefined") {
        $(".datepicker").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: "yy-mm-dd",
            monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
            beforeShow: function (input) {
                $(input).css({
                    "position": "relative",
                    "z-index": 99999
                });
            }
        });
    }
});
