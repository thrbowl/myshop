.users
id
nickname
createDate

.category
id
name
createDate

.goods
id
name
price
description
status
createDate

.goods_category
id
goods_id
category_id
order

.orders
id
user_id
total
name
mobile
address
status
comments
createDate

.order_goods
id
order_id
goods_id
num
price

.system
name
phone
start_time
end_time
status
comments

.cart
id
user_id
createDate
updateDate

.cart_goods
id
cart_id
goods_id
num
price