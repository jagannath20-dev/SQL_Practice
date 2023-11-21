Use sql_challenge;
create table if not exists product(
product_id int,
product_name varchar(40),
unit_price int,
primary key(product_id));

create table if not exists sales(
seller_id int,
product_id int,
buyer_id int,
sales_date date,
quantity int,
price int,
foreign key(product_id) references product(product_id));

select * from sales;
select * from product;


insert into product values
(1,'S8',1000),
(2,'G4',800),
(3,'IPhone',1400);

insert into sales values
(1,1,1,'2019-01-21',2,2000),
(1,2,2,'2019-02-17',1,800),
(2,2,3,'2019-06-02',1,800),
(3,3,4,'2019-05-13',2,2800);

-- Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
-- between 2019-01-01 and 2019-03-31 inclusive.
-- Return the result table in any order.

with cte as(
select s.product_id,p.product_name,s.sales_date
from sales s inner join product p 
on s.product_id = p.product_id
where sales_date between '2019-01-01' and '2019-03-31')
select product_id,product_name from cte c
where sales_date = (select max(sales_date) from sales group by product_id having product_id = c.product_id);