create database sql_challenge;
use sql_challenge;
create table ads(
ad_id int,
user_id int,
action enum ('Clicked', 'Viewed', 'Ignored'),
primary key(ad_id,user_id)
);
insert into ads values
(1,1,'Clicked'),
(2,2,'Clicked'),
(3,3,'Viewed'),
(5,5,'Ignored'),
(1,7,'Ignored'),
(2,7,'Viewed'),
(3,5,'Clicked'),
(1,4,'Viewed'),
(2,11,'Viewed'),
(1,2,'Clicked');

select * from ads;

-- Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
-- Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a tie.

with cte as(
select ad_id,action,
case when action = 'Clicked' then 1
when action = 'Viewed' then 0 else null end as chk
from ads
)
select ad_id, ifnull(round(100*sum(chk),2),0) as ctr
from cte group by ad_id
order by ctr desc,ad_id asc;

