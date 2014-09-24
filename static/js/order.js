;
$(function () {
    // 订单表单验证
    $.formValidator.initConfig({
        formID: "orderForm",
        onError: function (msg) {
            alert(msg)
        },
        onSuccess: function () {
            var $form = $("#" + this.formID);
            $.post($form.attr("action"), $form.serialize(), function (message) {
                $.message(message);
                if (message.type == "success") {
                    $.facebox.close();
                    if (typeof cart != 'undefined') {
                        cart.reload();
                    }
                }
            });
            return false;
        }
    });
    $("#name").formValidator({onShow: "请填写收货人姓名", onFocus: "", onCorrect: "", defaultValue: ""})
        .functionValidator({fun: isNonEmptyField, onError: "收货人姓名不能为空"});
    $("#mobile").formValidator({onShow: "请填写收货人手机号码", onFocus: "", onCorrect: "", defaultValue: ""})
        .functionValidator({fun: isNonEmptyField, onError: "收货人手机号码不能为空"})
        .regexValidator({regExp: "^(13|15|18|17)[0-9]{9}$", onError: "请填写正确的手机号码"});
    $("#address").formValidator({onShow: "请填写收货地址", onFocus: "", onCorrect: "", defaultValue: ""})
        .functionValidator({fun: isNonEmptyField, onError: "收货地址不能为空"});
});
