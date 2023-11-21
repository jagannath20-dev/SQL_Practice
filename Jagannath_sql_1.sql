create database ineuron;
Show Databases;
Use ineuron;
create table if not exists employee
(
    emp_name varchar(30),
    emp_no varchar(30),
    emp_salary varchar(30)
);
Insert Into employee values('janaki', '16Ao1232', '12Lakhs');
select * from employee;
drop table employee;
CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

set session sql_mode = ' ';
load data infile
"D:\sales_data_final.csv"
into table sales1
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from sales1;

select str_to_date(order_date, '%m %d %Y') from sales1;

alter table sales1
add column order_date_new date after order_date;

select * from sales1;

Set SQL_SAFE_UPDATES = 0;

update sales1
set order_date_new = str_to_date(order_date,'%m/%d/%Y');

alter table sales1
add column ship_date_new date after ship_date;

Update sales1
set ship_date_new = str_to_date(ship_date, '%m/%d/%Y');

Select * from sales1 where ship_date_new = '2014-12-16';
select * from sales1 where ship_date_new > '2011-10-20';
select * from sales1 where ship_date_new < '2011-9-20';
select * from sales1 where ship_date_new between '2011-01-01' and '2011-12-31';
select * from sales1 where ship_date_new between '2012-01-01' and '2012-12-31';
select * from sales1 where ship_date_new between '2013-01-01' and '2013-12-31';
select * from sales1 where ship_date_new between '2013-01-01' and '2013-12-31';
select * from sales1 where ship_date_new between '2014-01-01' and '2014-12-31';

select now();
select curdate();
select curtime();

select * from sales1 where ship_date_new < date_sub(now(), interval 1 week);

select date_sub(now(), interval 1 week);
select date_sub(now(), interval 31 day);
select date_sub(now(), interval 26 year);

select year(now());
select dayname('1997-07-20');

alter table sales1
add column flag date after order_id;

select * from sales1;

SET SQL_SAFE_UPDATES = 0;

update sales1
set flag = now();

alter table sales1
add column Year_New date after order_date;

alter table sales1
add column Month_new date after Year_New;

alter table sales1
add column Date_New date after Month_new;

alter table sales1
modify column  Year_New int;

alter table sales1
modify column Month_new int;

alter table sales1
modify column Date_New int;

select * from sales1;

update sales1
set Year_New = year(order_date_new);

update sales1
set Month_new = month(order_date_new);

update sales1
set Date_New = day(order_date_new);

select * from sales1;

select * from sales1 limit 5;

select month(order_date_new) from sales1;

select Year_New, avg(sales) from sales1 group by Year_New;
select Year_New , sum(sales) from sales1 group by Year_New;
select Year_New , min(sales) from sales1 group by Year_New;
select Year_New , max(sales) from sales1 group by Year_New;
select Year_New, sum(quantity) from sales1 group by Year_New;

select (discount+shipping_cost) as CTC from sales1;

select (sales*discount+shipping_cost) as CTC from sales1;

select order_id,discount, if (discount > 0, 'Yes', 'No') as discount_flag from sales1;
 
ALTER TABLE sales1
ADD COLUMN discount_flag VARCHAR(30) AFTER discount;

alter table sales1
modify column discount_flag varchar(20) after discount;

select * from sales1;

select discount_flag, count(*) from sales1 group by discount_flag;
select * from sales1 where discount > 0;

Update sales1
set discount_flag = if(discount > 0, 'Yes','No');

SET SQL_SAFE_UPDATES = 0;