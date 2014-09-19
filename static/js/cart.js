function Goods(id, name, price, num) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.num = num;
}

function Cart(id, goods_list) {
    if (!goods_list) {
        goods_list = [];
    }
    this.id = id;
    this.goods_list = goods_list;
}

Cart.prototype.tipEmpty = function() {
    if (this.goods_list.length == 0) {
        $("#shopCart #emptyTip").show();
    }
};

Cart.prototype.init = function() {
    for (var i = 0; i < this.goods_list.length; i++) {
        var goods = this.goods_list[i];
        var c = '<tr class="goods" id="cart_goods' + goods.id + '">' +
            '<td class="removeBtn" title="移除[' + goods.name + ']" onclick="remove_goods(' + goods.id + ')">' + goods.name + '</td>' +
            '<td>' + goods.num + '</td>' +
            '<td></td>' +
            '<td>' + goods.price + '</td>' +
            '</tr>';
        $("#shopCart table").append(c);
    }
    this.tipEmpty();
};

Cart.prototype.clear = function () {
    var cart = this;
    var data = {
        cart_id: cart.id
    };
    $.post("?c=cart&a=clear", data, function (message) {
        if (message.type == "success") {
            cart.goods_list = [];

            $("#shopCart table tr.goods").remove();
            cart.tipEmpty();
        }
    });
};

Cart.prototype.find = function (goods_id) {
    for (var i = 0; i < this.goods_list.length; i++) {
        if (goods_id == this.goods_list[i].id) {
            return i;
        }
    }
    return -1;
};

Cart.prototype.add_goods = function (goods) {
    var cart = this;
    var data = {
        cart_id: goods.cart_id,
        goods_id: goods.goods_id,
        num: goods.num
    };
    var index = this.find(goods.id);
    if (index != -1) {
        $.post("?c=cart&a=add_goods&flag=1", data, function (message) {
            if (message.type == "success") {
                cart.update_goods_num(goods.id, num);
            }
        });
    }
    else {
        $.post("?c=cart&a=add_goods&flag=2", data, function (message) {
            if (message.type == "success") {
                cart.goods_list.push(goods);
            }
        });
    }
    this.tipEmpty();
};

Cart.prototype.remove_goods = function (goods_id) {
    var cart = this;
    var index = this.find(goods_id);
    if (index != -1) {
        var data = {
            cart_id: cart.cart_id,
            goods_id: goods_id
        };
        $.post("?c=cart&a=add_goods", data, function (message) {
            if (message.type == "success") {
                cart.goods_list.splice(index, 1);
                cart.tipEmpty();
            }
        });
    }
};

Cart.prototype.update_goods_num = function (goods_id, num) {
    var cart = this;
    var index = this.find(goods_id);
    if (index != -1) {
        var data = {
            cart_id: cart.cart_id,
            goods_id: goods_id,
            num: num
        };
        $.post("?c=cart&a=update_goods_num", data, function (message) {
            if (message.type == "success") {
                cart.goods_list[index]['num'] += num;
            }
        });
    }
};
