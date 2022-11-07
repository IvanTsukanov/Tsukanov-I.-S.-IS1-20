-- Задача 1
select p.prod_id, p.prod_name, p.prod_price 
from "Products" p
where p.prod_price = 2.50;

-- Задача 2
select p.prod_id, p.prod_name, p.prod_price 
from "Products" p
where p.prod_name = 'Fuses';

-- Задача 3
insert into "Products"
(prod_id, vend_id, prod_name, prod_price, prod_desc)
values
('TNT 4', 1003, 'fuses', 3.42, null);

select p.prod_id, p.prod_name, prod_price
from "Products" p 
where lower(p.prod_name) = 'fuses';

-- Задача 4
select p.prod_id, p.prod_name, p.prod_price 
from "Products" p
where p.prod_price < 10;

-- Задача 5
select p.prod_id, p.prod_name, p.prod_price 
from "Products" p
where p.prod_price <= 10;

-- Задача 6
select p.vend_id, p.prod_name, p.prod_price
from "Products" p
where vend_id != 1003;

-- Задача 7
-- 1 способ
select p.prod_id, p.prod_name, p.prod_price
from "Products" p
where (p.prod_price >= 5) and (p.prod_price <= 10);

-- 2 способ
select p.prod_id, p.prod_name, p.prod_price
from "Products" p
where p.prod_price between 5 and 10;

-- Задача 8
select 
cust_name, cust_state, cust_email, cust_zip, cust_city,
(c.cust_zip || ' ' || c.cust_country || ' ' || c.cust_state || ' ' || c.cust_city || ' '  || c.cust_address) as "Полный адрес"
from "Customers" c 
where c.cust_email is null; 

-- Задача 9
select 
cust_name, cust_state, cust_email, cust_zip, cust_city,
(c.cust_zip || ' ' || c.cust_country || ' ' || c.cust_state || ' ' || c.cust_city || ' '  || c.cust_address) as "Полный адрес"
from "Customers" c 
where c.cust_email is not null; 

-- Задача 10
select p.prod_id, p.prod_name, p.prod_price
from "Products" p 
where p.vend_id = 1003 and p.prod_price <= 10;

-- Задача 11
-- 1 способ
select p.prod_id, p.prod_name, p.prod_price
from "Products" p 
where p.vend_id = 1002 or p.vend_id = 1003;

-- 2 способ
select p.prod_id, p.prod_name, p.prod_price
from "Products" p 
where p.vend_id between 1002 and 1003;

-- Задача 12
-- 1 способ
select p.prod_id, p.prod_name, p.prod_price
from "Products" p 
where (p.vend_id = 1002 or p.vend_id = 1003) and p.prod_price >= 10;

-- 2 способ
select p.prod_id, p.prod_name, p.prod_price
from "Products" p 
where (p.vend_id between 1002 and 1003) and p.prod_price >= 10;

-- Задача 13
select p.vend_id, p.prod_id, p.prod_name, p.prod_price
from "Products" p
where p.vend_id = 1002 or p.vend_id = 1005 order by p.prod_name;

-- Задача 14
select p.vend_id, p.prod_id, p.prod_name, p.prod_price
from "Products" p
where (p.vend_id = 1002 or p.vend_id = 1005) and char_length(p.prod_name) > 5 order by p.prod_name;

-- Задача 15
-- 1 способ
select p.prod_id, prod_name, prod_price, upper(p.prod_name)  
from "Products" p
where (p.vend_id != 1002 and p.vend_id != 1003)
order by prod_id;

-- 2 способ
select p.prod_id, prod_name, prod_price, upper(p.prod_name)  
from "Products" p
where p.vend_id < 1002 or p.vend_id > 1003
order by prod_id;

-- Задача 16
select p.prod_name 
from "Products" p
where lower(p.prod_name) like 'jet%';

-- Задача 17
select p.prod_name 
from "Products" p
where lower(p.prod_name) like '%anvil%';

-- Задача 18
select p.prod_name 
from "Products" p
where lower(p.prod_name) like '_ ton anvil%';

-- Задаяа 19
 select p.prod_name 
from "Products" p
where lower(p.prod_name) like '%ton%';

-- Задача 20
select c.cust_name
from "Customers" c
where c.cust_name like 'E%' or c.cust_name like 'J%';

-- Задача 21
select c.cust_name, c.cust_zip || ' ' || c.cust_city || ' ' || c.cust_address || ' ' || c.cust_country || ' ' || c.cust_state as "Полный адрес"
from "Customers" c
where c.cust_name not like 'E%' and c.cust_name not like 'J%'
order by c.cust_contact desc;

-- Задача 22
-- 1 способ
select v.vend_name, position('Inc' in v.vend_name) as "Позиция"
from "Vendors" v
where vend_id = 1004;

-- 2 способ
select v.vend_name, strpos(v.vend_name, 'Inc') as "Позиция"
from "Vendors" v
where vend_id = 1004;

-- Задача 23
update "Productnotes"
set note_date = '2016-08-23 12:20:56.569'
where note_id = 114;

update "Productnotes"
set note_date = '2016-08-19 12:20:56.569'
where note_id = 109;

-- 1 способ
select p.note_id
from "Productnotes" p
where note_date >= '2016-08-18' and note_date < '2016-08-24';

-- 2 способ
select p.note_id
from "Productnotes" p
where note_date between '2016-08-18' and '2016-08-24';


