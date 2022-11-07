alter table "PHARMNETWORK"."GROUP"
alter column "Name" set not null;

alter table "PHARMNETWORK"."AVIABILITY"
add column "DateStart" DATE not null;

alter table "PHARMNETWORK"."AVIABILITY"
add column "Mart" varchar(3);

alter table "PHARMNETWORK"."DEFICIT"
alter column "DateStart" set not null;

alter table "PHARMNETWORK"."EMPLOYEE"
add column "LName" varchar(40) not null;

alter table "PHARMNETWORK"."BUYING"
add column "Date" DATE;