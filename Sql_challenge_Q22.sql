use sql_challenge;
create table if not exists Countries(
country_id int,
country_name varchar(50),
primary key(country_id));

create table if not exists Weather(
country_id int,
weather_state int,
day date,
primary key(country_id,day));

insert into Countries values
(2,'USA'),
(3,'Australia'),
(7,'Peru'),
(5,'China'),
(8,'Morocco'),
(9,'Spain');

insert into Weather values
(2,15,'2019-11-01'),
(2,12,'2019-10-28'),
(2,12,'2019-10-27'),
(3,-2, '2019-11-10'),
(3,0,'2019-11-11'),
(3,3,'2019-11-12'),
(5,16,'2019-11-07'),
(5,18,'2019-11-09'),
(5,21,'2019-11-23'),
(7,25,'2019-11-28'),
(7,22,'2019-12-01'),
(7,20,'2019-12-02'),
(8,25,'2019-11-05'),
(8,27,'2019-11-15'),
(8,31,'2019-11-25'),
(9,7,'2019-10-23'),
(9,3,'2019-12-23');

-- Write an SQL query to find the type of weather in each country for November 2019. The type of weather is:
-- Cold if the average weather_state is less than or equal 15,
-- Hot if the average weather_state is greater than or equal to 25, and
-- Warm otherwise.
-- Return result table in any order.

select * from Weather;
select * from Countries;
                         
with cte as(
select c.country_name, round(avg(weather_state)) as avg_weather
from Countries c inner join Weather w
on c.country_id = w.country_id
where year(day) = 2019 and month(day) = 11
group by country_name)
select country_name,
case when avg_weather <= 15 then 'cold'
when avg_weather >= 25 then 'Hot'
else 'warm'end as 'weather_type'
from cte;
