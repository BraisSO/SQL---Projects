select * from store limit 10;

SELECT COUNT(DISTINCT(order_id)) 
FROM store;

SELECT COUNT(DISTINCT(customer_id)) 
FROM store;

select customer_id, customer_email, customer_phone 
from store where customer_id=1;

select item_1_id, item_1_name, item_1_price f
rom store where item_1_id=4;

create table customer as
select distinct customer_id, customer_phone, customer_email
from store;

alter table customer
add primary key (customer_id);

create table items as 
select distinct item_1_id as item_id, 
item_1_name as name, 
item_1_price as price 
from store
union
select distinct item_2_id as item_id, 
item_2_name as name, 
item_2_price as price
from store 
where (item_1_id, item_2_id) is not null
union
select distinct item_3_id as item_id, item_3_name as name, 
item_3_price as price from store
where (item_3_id) is not null;
alter table items
add primary key (item_id);
select * from items order by item_id;

create table orders_items as
select order_id, item_1_id as item_id
from store
union all
select order_id, item_2_id as item_id
from store
where item_2_id is not null
union all
select order_id, item_3_id as item_id
from store
where item_3_id is not null;

create table orders as
select distinct order_id, order_date, customer_id
from store;

alter table orders
add primary key (order_id);

alter table orders
add foreign key (customer_id)
references customer(customer_id);

alter table orders_items
add foreign key (item_id)
references items(item_id);
alter table orders_items
add foreign key (order_id)
references orders(order_id);

select customer_email, order_date from store
where order_date > '2019-07-25'
limit 10;

select customer_email
from customer, orders, items, orders_items
where customer.customer_id = orders.customer_id
and
order_date > '2019-07-25'
limit 10;

with all_items as (
select item_1_id as item_id
from store
union all
select item_2_id as item_id
from store
where item_2_id is not null
union all
select item_3_id as item_id
from store
where item_3_id is not null
)
select item_id, count(*)
from all_items
group by item_id
limit 10;

select item_id, count(order_id)
from orders_items
group by item_id
limit 10;

select count(distinct(customer_id))
from store
where order_id > 1;
with all_items as (
select item_1_name as item_name
from store
union all
select item_2_name as item_name
from store
where item_2_name is not null
union all
select item_3_name as item_name
from store
where item_3_name is not null
)

select item_name, count(*)
from all_items
where item_name = 'lamp'
group by item_name limit 10;
with all_items as (
select item_1_name as item_name
from store
union all
select item_2_name as item_name
from store
where item_2_name is not null
union all
select item_3_name as item_name
from store
where item_3_name is not null
)

select item_name, count(*)
from all_items
where item_name = 'chair'
group by item_name
limit 10;