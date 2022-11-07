create schema "OrderTable";
create table "OrderTable"."Customers"
(
	"cust_id" int generated always as identity (start with 10001 increment by 1) primary key,
	"cust_name" varchar(30) not null,
	"cust_address" varchar(30) not null,
	"cust_city" varchar(30) not null,
	"cust_state" varchar(5),
	"cust_zip" varchar(20) not null,
	"cust_country" varchar(30) not null,
	"cust_contact" varchar(30) not null,
	"cust_email" varchar(40) 
);
create table "OrderTable"."Orders"
(
	"order_num" int generated always as identity (start with 20005 increment by 1) primary key,
	"order_date" date not null,
	"cust_id" int not null references "OrderTable"."Customers"("cust_id")
);


create table "OrderTable"."Vendors"
(
	"vend_id" int generated always as identity (start with 1001 increment by 1) primary key,
	"vend_name" varchar(50) not null,
	"vend_address" varchar(50) not null,
	"vend_city" varchar(50) not null,
	"vend_state" varchar(5),
	"vend_zip" varchar(20) not null,
	"vend_country" varchar(30) not null
);

create table "OrderTable"."Products"
(
	"prod_id" varchar(15) primary key unique,
	"vend_id" int not null references "OrderTable"."Vendors"("vend_id"),
	"prod_name" varchar(30) not null,
	"prod_price" decimal not null,
	"prod_desc" text
);

create table "OrderTable"."Productnotes"
(
	"note_id" int generated always as identity (start with 109 increment by 1) primary key,
	"prod_id" varchar(15) not null references  "OrderTable"."Products"("prod_id"),
	"note_date" timestamp not null,
	"note_text" text
);

create table "OrderTable"."Orderitems"
(
	"order_num" int not null references "OrderTable"."Orders"("order_num"),
	"order_item" int not null,
	"prod_id" varchar(15) not null references "OrderTable"."Products"("prod_id"),
	"quantity" int not null,
	"item_price" decimal not null,
	primary key("order_num", "order_item")
);

insert into "OrderTable"."Customers" 
("cust_name", "cust_address", "cust_city", "cust_state", "cust_zip", "cust_country", "cust_contact", "cust_email")
values
('Coy ote Inc.', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'Y Lee', 'ylee@coyote.com'),
('Mouse House',	'333 Fromage Lane',	'Columbus',	'OH',	'43333',	'USA',	'Jerry Mouse',	null),
('Wascals',	'1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'rabbit@wascally.com'),
('Yosemite Place', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Y Sam', 'sam@yosemite.com'),
('E Fudd', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'E Fudd', null);

insert into "OrderTable"."Orders"
("order_date", "cust_id")
values
('2016-01-09', 10001),
('2016-12-09', 10003),
('2016-12-10', 10004),
('2016-03-10', 10005),
('2016-08-10', 10001);

insert into "OrderTable"."Vendors"
("vend_name", "vend_address", "vend_city", "vend_state", "vend_zip", "vend_country")
values
('Anvils R Us', '123 Main Street', 'Southfield', 'MI', '48075', 'USA'),
('LT Supplies', '500 Park Street', 'Anytown', 'OH', '44333', 'USA'),
('ACME', '555 High Street', 'Los Angeles', 'CA', '90046', 'USA'),
('Furball Inc.', '1000 5th Avenue', 'New York', 'NY', '11111', 'USA'),
('Jet Set', '42 Galaxy Road', 'London', null, 'N16 6PS', 'England'),
('Jouets Et Ours', '1 Rue Amusement', 'Paris', null, '45678', 'France')

insert into "OrderTable"."Products"
("prod_id", "vend_id", "prod_name", "prod_price", "prod_desc")
values
('ANV01', 1001, '5 ton anvil', 5.9900, '5 ton anvil, black, complete with handy hook'),
('ANV02', 1001, '1 ton anvil', 9.9900, '1 ton anvil, black, complete with handy hook and carrying case'),
('ANV03', 1001, '2 ton anvil', 14.9900, '1 ton anvil, black, complete with handy hook and carrying case'),
('DTNTR', 1003, 'Detonator', 13.0000, 'Detonator (plunger powered), fuses not included'),
('FB', 1003, 'Bird seed', 10.0000, 'Large bag (situable for road runners'),
('FC', 1003, 'Carrots', 2.5000, 'Carrots (rabbit hunting season only'),
('FU1', 1002, 'Fuses', 3.4200, '1 dozen, extra long'),
('JP1000', 1005, 'JetPack1000', 35.0000, 'JetPack 1000, intended for single use'),
('JP2000', 1005, 'JetPack2000', 55.0000, 'JetPack 2000, multi-use'),
('OL1', 1002, 'Oil can', 8.9900, 'Oil can, red'),
('SAFE', 1003, 'Safe', 50.0000, 'Safe with combination lock'),
('SLING', 1003, 'Sling', 4.4900, 'Sling, one size fits all'),
('TNT1', 1003, 'TNT (1 stick)', 2.5000, 'TNT, red. simngle stick'),
('TNT2', 1003, 'TNT (5 sticks)', 10.0000, 'TNT, red, pack of 10 sticks');

insert into "OrderTable"."Productnotes"
("prod_id", "note_date", "note_text")
values
('ANV03', '2016-01-09 00:00:00.000', 'Item is extremely heavy. Designed for dropping, not recommended for use with slings, ropes, pulleys, or tightropes.'),
('FC', '2016-01-09 00:00:00.000', 'Customer complaint: rabbit has been able to detect trap, food apparently less effective now.'),
('SLING', '2016-02-09 00:00:00.000', 'Shipped unassembled, requires common tools (including oversized hammer).'),
('SAFE', '2016-02-09 00:00:00.000', 'Customer complaint: Circular hole in safe floor can apparently be easily cut with handsaw.'),
('ANV01', '2016-05-09 00:00:00.000', 'Customer complaint: Not heavy enough to generate flying stars around head of victim. If being purchased for dropping, recommend ANV02 or ANV03 instead.'),
('SAFE', '2016-07-09 00:00:00.000', 'Call from individual trapped in safe plummeting to the ground, suggests an escape hatch be added. Comment forwarded to vendor.');

insert into "OrderTable"."Orderitems"
("order_num", "order_item", "prod_id", "quantity", "item_price")
values
(20005, 1, 'ANV01', 10, 5.9900),
(20005, 2, 'ANV02', 3, 9.9900),
(20005, 3, 'TNT2', 5, 10.0000),
(20005, 4, 'FB', 1, 10.0000),
(20006, 1, 'JP2000', 1, 10.0000),
(20008, 1, 'FC', 50, 2.5000),
(20009, 1, 'FB', 1, 10.0000),
(20009, 2, 'OL1', 1, 8.9900),
(20009, 3, 'SLING', 1, 4.4900),
(20009, 4, 'ANV03', 1, 14.9900);

