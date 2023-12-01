use sql_challenge;
create table if not exists Employee(
employee_id int,
team_id int,
primary key(employee_id));

select * from Employee; 

insert into Employee values
(1,8),
(2,8),
(3,8),
(4,7),
(5,9),
(6,9);

-- Write an SQL query to find the team size of each of the employees.
-- Return result table in any order

select e1.employee_id, count(e1.employee_id) as team_size
from Employee e1 inner join Employee e2
on e1.team_id = e2.team_id
group by e1.employee_id
order by employee_id;
