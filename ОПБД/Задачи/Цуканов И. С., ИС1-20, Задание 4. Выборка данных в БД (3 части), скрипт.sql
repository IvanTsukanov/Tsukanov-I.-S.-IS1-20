
--Часть1
--Задача 1 Произвести выборку всех даных из таблицы products
select * from "Products";

--Задача 2 Произвести выборку всех данных из столбца prod_name таблицы products
select p.prod_name 
from "Products" p; 

--Задача 3 произвести выборку данных из столбцов prod_id prod_name pron_price таблицы products
select p."prod_id", p."prod_name", p."prod_price"
from "Products" p; 

-- Задача 4 Произвести выборку уникальных данных из столбца vend_id таблицы products
select distinct p.vend_id 
from "Products" p; 

-- Задача 5 Произвести выборку первые 5 строк из столбца prod_name таблицы products
select p.prod_name 
from "Products" p limit 5;

-- Задача 6 Произвести выборку первых 5 строк из столбца prod_name таблицы products начиная с 3 позиции
select p.prod_name 
from "Products" p limit 5 offset 2;

-- Задача 7 Произвести выборку всех строк из  столбца prod_name таблицы products начиная с 5 позиции
select p.prod_name 
from "Products" p limit all offset 4;

-- Задача 8 Произвести выборку данных из столбца prod_name таблицы products и осуществить сортировку по возрастанию
select p.prod_name 
from "Products" p order by p.prod_name;

-- Задача 9 Произвести выборку данных из столбцов код продукта, имя продукта, цена продукта из таблицы products
-- и осуществить сортировку по возрастанию, по имени и цене
select p.prod_id, p.prod_name, p.prod_price 
from "Products" p order by p.prod_name, prod_price;

-- Задача 10 Произвести выборку данных из столбцов код продукта, имя продукта, цена продукта из таблицы products
-- осуществить сортировку по убыванию по цене
select p.prod_id, p.prod_name, p.prod_price 
from "Products" p order by p.prod_price desc;

-- Задача 11 Произвести выборку данных из столбцов код продукта, имя продукта, цена продукта из таблицы products
-- осуществить сортировку по убыванию по цене и по возрастанию по имени
select p.prod_id, p.prod_name, p.prod_price 
from "Products" p order by p.prod_price desc, p.prod_name asc;

-- Задача 12 Произвести выборку данных из таблицы vendors, в результате которой информация
-- vend_name и vend_counrty выводится в одном поле. Решить двумя сопособами.

-- Способ 1
select concat 
(v.vend_name, ' ', v.vend_country)
from "Vendors" v;

-- Способ 2
select 
v.vend_name || ' ' || v.vend_country
from "Vendors" v;

-- -- Задача 13 Произвести выборку данных из таблицы vendors, в результате которой информация
-- vend_name(поставщики) и vend_counrty(страна поставщиков) выводится в одном поле. Столбцу выборки присвоить имя "Наименование (место нахождения)".
-- Решить двумя способами.

-- Способ 1
select concat
(v.vend_name, ' ', v.vend_country)
as "Наименование (место нахождения)"
from "Vendors" v;

-- Способ 2
select
v.vend_name || ' ' || v.vend_country
as "Наименование (место нахождения)"
from "Vendors" v;

-- Задача 14 Произвести выборку данных из столбцов prod_id, quantity, item_price таблицы orderitems
select o."prod_id", o."quantity", o."item_price"  
from "Orderitems" o;

-- Задача 15 Произвести выборку данных из столбцов prod_id, quantity, item_price таблицы orderitems,
-- рассчитать итоговую цену, умножив цену за штуку на заказанное количество каждого товара. Присвоить
-- вычисляемому столбцу имя "expanded_price"
select
o."prod_id", o."item_price", o."quantity",
o."item_price" * o."quantity" as "expanded_price"  
from "Orderitems" o;

-- Задача 16 Произвести выборку данных из таблицы vendors, в результате которой информация
-- vend_name(поставщики) и vend_counrty(страна поставщиков) выводится в одном поле. Столбцу выборки присвоить имя "Наименование (место нахождения)".
-- В отдельном столбце с названием "кол-во символов" вывести количество символов в строке в столбце "Наименование (место нахождения)
-- Решить тремя способами.


-- Способ 1
select v.vend_name || ' ' || v.vend_country as "Наименование (место нахождения)",
char_length(v.vend_name || ' ' || v.vend_country) as "Кол-во символов" 
from "Vendors" v;

-- Способ 2
select v.vend_name || ' ' || v.vend_country as "Наименование (место нахождения)",
length(v.vend_name || ' ' || v.vend_country) as "Кол-во символов" 
from "Vendors" v;

-- Способ 3
select v.vend_name || ' ' || v.vend_country as "Наименование (место нахождения)",
character_length(v.vend_name || ' ' || v.vend_country) as "Кол-во символов" 
from "Vendors" v;

-- Задача 17
-- Произвести выборку данных из таблицы Productnotes
-- в результате которой в столбце note_text
-- первая буква каждого слова приведена к верхнему регистру
select initcap(p.note_text)
from "Productnotes" p;

-- Задача 18
-- Произвести выборку данных из таблицы products
-- в результате которой в столбце prod_id
-- все слова приведены к нижнему регистру
select lower(p.prod_id)
from "Productnotes" p;

-- Задача 19 Произвести выборку данных из таблицы vendors, в результате которой информация
-- vend_name(поставщики) и vend_counrty(страна поставщиков) выводится в одном поле. 
-- Столбцу выборки присвоить имя "Наименование (место нахождения)".
-- В отдельном столбце с названием "Регистр" вывести информацию vend_name(поставщики)
-- и vend_counrty(страна поставщиков) в одном поле в верхнем регистре

-- Способ 1
select v.vend_name || ' ' || v.vend_country as "Наименование (место нахождения)",
upper(v.vend_name || ' ' || v.vend_country) as "Регистр"
from "Vendors" v;

-- Способ 2
select concat(v.vend_name, ' ', v.vend_country) as "Наименование (место нахождения)",
upper(concat(v.vend_name, ' ', v.vend_country)) as "Регистр"
from "Vendors" v;

-- Задача 20.
-- Предусловие
insert into "Products"
(prod_id, vend_id, prod_name, prod_price, prod_desc)
values 
('TNT3', 1003, 'TNT (5 sticks)', 11.0000, '                   TNT, red, pack of 10 sticks');

-- Способ 1
select p.prod_desc,
ltrim(p.prod_desc) as "Результат"
from "Products" p;

-- Способ 2
select p.prod_desc,
trim(leading p.prod_desc) as "Результат"
from "Products" p;


-- Задача 21.

-- Способ 1
select p.prod_desc,
rtrim(p.prod_desc) as "Результат"
from "Products" p;

-- Способ 2
select p.prod_desc,
trim(trailing p.prod_desc) as "Результат"
from "Products" p;

-- Часть 2
-- Задача 22
select p.prod_desc,
ltrim(p.prod_desc, 'T') as "Результат"
from "Products" p;

-- Задача 23

-- Способ 1
select p.prod_desc,
ltrim(p.prod_desc, 'Jet') as "Результат"
from "Products" p;

-- Способ 2
select p.prod_desc,
trim(leading p.prod_desc, 'Jet') as "Результат"
from "Products" p;

-- Задача 24

-- Способ 1
select p.prod_desc,
ltrim(p.prod_desc, 'Jet' || 't' || 'S' || '.') as "Результат"
from "Products" p;

-- Способ 2
select p.prod_desc,
trim(leading p.prod_desc, 'Jet' || 't' || 'S' || '.') as "Результат"
from "Products" p;

-- Задача 25

-- Способ 1
select p.prod_desc,
rtrim(p.prod_desc, 'e') as "Результат"
from "Products" p;

-- Способ 2
select p.prod_desc,
trim(trailing p.prod_desc, 'e') as "Результат"
from "Products" p;

-- Задача 26

-- Способ 1
select p.prod_desc,
rtrim(p.prod_desc, 'ook') as "Результат"
from "Products" p;

-- Способ 2
select p.prod_desc,
trim(trailing p.prod_desc, 'ook') as "Результат"
from "Products" p;

-- Задача 27

-- Способ 1
select p.prod_desc,
rtrim(p.prod_desc, 'e' || 'l' || 'k' || 'g') as "Результат"
from "Products" p;

-- Способ 2
select p.prod_desc,
trim(trailing p.prod_desc, 'e' || 'l' || 'k' || 'g') as "Результат"
from "Products" p;

-- Задача 28
select
overlay (p.prod_desc placing 'YYY' from 4 for 6) as "Результат"
from "Products" p; 

-- Задача 29

-- Способ 1
select 
v.vend_city,
position('A' in v.vend_city) as "Позиция"
from "Vendors" v;

-- Способ 2
select
v.vend_city,
strpos(v.vend_city, 'A') as "Позиция"
from "Vendors" v;

-- Задача 30

-- Способ 1
select v.vend_address,
position ('Str' in v.vend_address) as "Позиция"
from "Vendors" v order by "Позиция";

-- Способ 2
select v.vend_address,
strpos(v.vend_address, 'Str') as "Позиция"
from "Vendors" v order by "Позиция";

-- Задача 31

-- Способ 1
select
substring(p.note_text from 13 for 22) as "Результат" 
from "Productnotes" p;

-- Способ 2
select
substr(p.note_text, 13, 22) as "Результат" 
from "Productnotes" p;

-- Задача 32
select
left(p.note_text, 22) as "Результат" 
from "Productnotes" p;

-- Задача 33
select
left(p.note_text, -22) as "Результат" 
from "Productnotes" p;

-- Задача 34
select
right(p.note_text, 14) as "Результат" 
from "Productnotes" p;

-- Задача 35
select
right(p.note_text, -17) as "Результат" 
from "Productnotes" p;

-- Задача 36
select 
v.vend_name,
repeat(v.vend_name, 3) as "Повтор" 
from "Vendors" v;

-- Задача 37
select 
v.vend_name,
reverse(v.vend_name) as "Ревёрс" 
from "Vendors" v;

-- Задача 38
select
c.cust_email,
split_part(c.cust_email, '@', 1) as "Часть 1",
split_part(c.cust_email, '@', 2) as "Часть 2" 
from "Customers" c;

-- Задача 39
select
c.cust_name,
split_part(c.cust_name, ' ', 1) as "Часть 1",
split_part(c.cust_name, ' ', 2) as "Часть 2" 
from "Customers" c;

-- Задача 40
select age(timestamp '2022-10-23', timestamp '1812-08-03');

-- Задача 41
select
o.order_date,
age(current_date, o.order_date) as "Интервал"
from "Orders" o;

-- Задача 42

-- Способ 1
select current_date;

-- Способ 2
select current_timestamp;

-- Задача 43
select current_time;

-- Часть 3

-- Задача 44
select now();

-- Задача 45
select o.order_date,
date_part('year', order_date) as "Год" 
from "Orders" o;

-- Задача 46
select o.order_date,
date_part('month', order_date) as "Месяц" 
from "Orders" o;

-- Задача 47
select o.order_date,
date_part('day', order_date) as "Месяц" 
from "Orders" o;

-- Задача 48
select date_part('hour',timestamp '2020-06-30 02:36:24');

-- Задача 49
select date_part('minute',timestamp '2020-06-30 02:36:24');

-- Задача 50
select date_part('second',timestamp '2020-06-30 02:36:24');

-- Задача 51
select 
date_part('year',timestamp '2021-12-31 12:48:17') as "Год",
date_part('month',timestamp '2021-12-31 12:48:17') as "Месяц",
date_part('day',timestamp '2021-12-31 12:48:17') as "День",
date_part('hour',timestamp '2021-12-31 12:48:17') as "Часы",
date_part('minute',timestamp '2021-12-31 12:48:17') as "Минуты",
date_part('second',timestamp '2021-12-31 12:48:17') as "Секунды";

-- Задача 52
select 
order_date,
age(o.order_date) as "Интервал",
date_part('year', age(o.order_date)) as "Года"
from "Orders" o; 

-- Задача 53
select 
order_date,
age(o.order_date) as "Интервал",
date_part('month', age(o.order_date)) as "Месяца"
from "Orders" o; 

-- Задача 54
select 
order_date,
age(o.order_date) as "Интервал",
date_part('day', age(o.order_date)) as "Дни"
from "Orders" o; 

-- Задача 55
select
age(timestamp '1856-04-25 09:56:34') as "Интервал",
date_part('hour', age(timestamp '1856-04-25 09:56:34')) as "Часы",
date_part('minute',age(timestamp '1856-04-25 09:56:34')) as "Минуты",
date_part('second',age(timestamp '1856-04-25 09:56:34')) as "Секунды";

-- Задача 56
select
o.order_date,
date_trunc('year', o.order_date) as "Результат" 
from "Orders" o; 

-- Задача 57
select
o.order_date,
date_trunc('month', o.order_date) as "Результат" 
from "Orders" o;

-- Задача 58
select
o.order_date,
date_trunc('day', o.order_date) as "Результат" 
from "Orders" o;

-- Задача 59
select 
date_trunc('hour',timestamp '2015-05-26 16:36:42.258') as "Результат"; 

-- Задача 60
select 
date_trunc('minute',timestamp '2015-05-26 16:36:42.258') as "Результат"; 

-- Задача 61
select 
date_trunc('second',timestamp '2015-05-26 16:36:42.258') as "Результат"; 

-- Задача 62

-- Способ 1
select
concat(cast(note_id as varchar), '/', cast(prod_id as varchar), '/', cast(note_date as varchar)) as "Результат"
from "Productnotes" p;

-- Способ 2
select
cast(note_id as varchar) || '/' || cast(prod_id as varchar) || '/' || cast(note_date as varchar) as "Результат"
from "Productnotes" p;