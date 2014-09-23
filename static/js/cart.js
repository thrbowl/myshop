function Cart(id, dom_id) {
    this.id = id;
    this.jqCart = $("#" + dom_id);
}

Cart.prototype.reload = function() {
    var cart = this;
    this.jqCart.load("?c=cart&id=" + cart.id, function() {
        if (!cart.id) {
            cart.id = getCookie("cartid");
        }
    });
};

Cart.prototype.clear = function () {
    var cart = this;
    var data = {
        id: cart.id
    };
    $.post("?c=cart&a=clear", data, function (message) {
        if (message.type == "success") {
            cart.reload();
        }
    });
};

Cart.prototype.add_goods = function (goods_id, num) {
    var cart = this;
    var data = {
        id: cart.id,
        goods_id: goods_id,
        num: num
    };
    $.post("?c=cart&a=add_goods", data, function (message) {
        if (message.type == "success") {
            cart.reload();
        }
    });
};

Cart.prototype.delete_goods = function (goods_id) {
    var cart = this;
    var data = {
        id: cart.id,
        goods_id: goods_id
    };
    $.post("?c=cart&a=delete_goods", data, function (message) {
        if (message.type == "success") {
            cart.reload();
        }
    });
};

Cart.prototype.update_goods_num = function (goods_id, num) {
    var cart = this;
    var data = {
        id: cart.id,
        goods_id: goods_id,
        num: num
    };
    $.post("?c=cart&a=update_goods_num", data, function (message) {
        if (message.type == "success") {
            cart.reload();
        }
    });
};
