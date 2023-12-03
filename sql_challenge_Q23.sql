use sql_challenge;
create table if not exists Prices(
product_id int,
start_date date,
end_date date,
price int,
primary key(product_id,start_date,end_date));

create table if not exists UnitsSold(
product_id int,
purchase_date date,
units int);

insert into Prices values
(1,'2019-02-17','2019-02-28',5),
(1,'2019-03-01','2019-03-22',20),
(2,'2019-02-01','2019-02-20',15),
(2,'2019-02-21','2019-03-31',30);

insert into UnitsSold values
(1,'2019-02-25',100),
(1,'2019-03-01',15),
(2,'2019-02-10',200),
(2,'2019-03-22',30);

select * from Prices;
select * from UnitsSold;

-- Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.
-- Return the result table in any order.

with cte as (
select p.product_id , round(avg(price)) as averageg_price
from Prices p join UnitsSold u
on p.product_id = u.product_id
group by product_id)
select * from cte;

with cte as (
select p.product_id,
sum(p.price *u.units) as total_price,
Sum(u.units) as total_units_sold
from Prices p join UnitsSold u
on p.product_id = u.product_id
group by p.product_id)
select    c.product_id,
    ROUND(c.total_price / c.total_units_sold, 2) AS average_selling_price
FROM cte c;

select p.product_id,round(sum(units*price)/sum(units),2) as average_price from
Prices p inner join UnitsSold u
on p.product_id=u.product_id and u.purchase_date between p.start_date and p.end_date
group by product_id;