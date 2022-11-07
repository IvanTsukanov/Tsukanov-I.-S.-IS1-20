create schema "PHARMNETWORK";
create table "PHARMNETWORK"."PHARMACY"
(
	"PH_ID" serial primary key,
	"Address" varchar(40)
);
create table "PHARMNETWORK"."GROUP"
(
	"GR_ID" serial primary key,
	"Name" varchar(40)
);
create table "PHARMNETWORK"."PREPARATION"
(
	"PR_ID" serial primary key,
	"GR_ID" int2 references  "PHARMNETWORK"."GROUP"("GR_ID"),
	"Name" varchar(40)
);
create table "PHARMNETWORK"."AVIABILITY"
(
	"A_ID" serial primary key,
	"PH_ID" int2 references "PHARMNETWORK"."PHARMACY"("PH_ID"),
	"PR_ID" int2 references "PHARMNETWORK"."PREPARATION"("PR_ID"),
	"Quantity" int2,
	"DateEnd" DATE
);
create table "PHARMNETWORK"."DEFICIT"
(
	"D_ID" serial primary key,
	"PH_ID" int2 references "PHARMNETWORK"."PHARMACY"("PH_ID"),
	"PR_ID" int2 references "PHARMNETWORK"."PREPARATION"("PR_ID"),
	"Solution" varchar(40),
	"DateStart" DATE,
	"DateEnd" DATE not null
);
create table "PHARMNETWORK"."EMPLOYEE"
(
	"E_ID" serial primary key,
	"PH_ID" int2 references "PHARMNETWORK"."PHARMACY"("PH_ID"),
	"FName" varchar(40),
	"Post" varchar(40)
);
create table "PHARMNETWORK"."CLIENT"
(
	"C_ID" serial primary key,
	"FName" varchar(40),
	"LName" varchar(40),
	"DateReg" DATE not null
);
create table "PHARMNETWORK"."BASKET"
(
	"BS_ID" serial primary key,
	"E_ID" int2 references "PHARMNETWORK"."EMPLOYEE"("E_ID"),
	"C_ID" int2 references "PHARMNETWORK"."CLIENT"("C_ID") 
);
create table "PHARMNETWORK"."BUYING"
(
	"B_ID" serial primary key,
	"PH_ID" int2 references "PHARMNETWORK"."PHARMACY"("PH_ID"),
	"PR_ID" int2 references "PHARMNETWORK"."PREPARATION"("PR_ID"),
	"BS_ID" int2 references "PHARMNETWORK"."BASKET"("BS_ID"),
	"Price" money
);