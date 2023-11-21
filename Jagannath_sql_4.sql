create database win_fun;
Use win_fun;
create table ineuron_students(
student_id int,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int,
students_mail_id varchar(60));

insert into ineuron_students values(102,'FSDS','Shiva','B.SC',80,'shiva8@gmail.com');
insert into ineuron_students values(103,'FSDS','sreenath','MBA',88,'sreenathreddy8@gmail.com');
insert into ineuron_students values(104,'FSDS','Deepthi','B.SC',82,'deepthi.com');
insert into ineuron_students values(105,'FSDS','Jaidev','BBA',89,'jaidev@gmail.com');
insert into ineuron_students values(106,'FSDS','Hari','M.SC',68,'hari@gmail.com');
insert into ineuron_students values(107,'FSDS','Pavan','B.SC',65,'pavan@gmail.com');
insert into ineuron_students values(108,'FSDS','Ajay','B.SC',56,'ajay@gmail.com');
insert into ineuron_students values(109,'FSDS','Janaki','M.SC',94,'Janaki@gmail.com');
insert into ineuron_students values(111,'FSDS','Ramu','B.SC',97,'Ramu@gmail.com');
insert into ineuron_students values(113,'FSDS','Vijay','M.Tech',96,'vijay@gmail.com');
insert into ineuron_students values(115,'FSDS','Abi','B.Com',70,'abi@gmail.com');
insert into ineuron_students values(116,'FSDS','Sai','M.SC',84,'sai@gmail.com');
insert into ineuron_students values(117,'FSDS','Samarasimha reddy','B.SC',72,'samara8@gmail.com');
insert into ineuron_students values(118,'FSDS','Yamini','M.Tech',66,'mahesh@gmail.com');
insert into ineuron_students values(120,'FSDS','Naresh','B.Tech',66,'naresh@gmail.com');
select * from ineuron_students;

SET SQL_SAFE_UPDATES = 0;

UPDATE ineuron_students
SET student_stream = 'M.SC'
WHERE student_id = 106;

select * from ineuron_students;

Update ineuron_students
SET student_batch = 'FSDA'
where student_id = 106;

Update ineuron_students
SET student_batch = 'FSDA'
where student_id = 113;

Update ineuron_students
SET student_batch = 'Blockchain'
where student_id = 109;

Update ineuron_students
SET student_batch = 'Blockchain'
where student_id = 108;

Update ineuron_students
SET student_batch = 'Cyber security'
where student_id = 119;

Update ineuron_students
SET student_batch = 'Cyber security'
where student_id = 120;

Update ineuron_students
SET student_batch = 'Java Developper'
where student_id = 104;

Update ineuron_students
SET student_batch = 'Java Developper'
where student_id = 107;

Update ineuron_students
SET student_batch = 'web development'
where student_id = 115;

Update ineuron_students
SET student_batch = 'web development'
where student_id = 117;

Update ineuron_students
SET student_batch = 'web development'
where student_id = 102;

Update ineuron_students
SET student_batch = 'Big Data'
where student_id = 111;

Update ineuron_students
SET student_batch = 'Big Data'
where student_id = 114;

Update ineuron_students
SET student_batch = 'Cyber security'
where student_id = 103;

select * from ineuron_students;

select student_batch, sum(students_marks) from ineuron_students group by student_batch;

select student_batch, min(students_marks) from ineuron_students group by student_batch;

select student_batch, max(students_marks) from ineuron_students group by student_batch;

select student_batch, avg(students_marks) from ineuron_students group by student_batch;

select  count(students_marks) from ineuron_students ;

select count(distinct student_batch) from ineuron_students;

select student_batch, count(*) from ineuron_students group by student_batch;

select * from ineuron_students;

select student_name, students_marks from ineuron_students where students_marks in
(select max(students_marks) from ineuron_students where student_batch = 'fsda');

select * from ineuron_Students where student_batch = 'fsda' order by students_marks desc limit 1,1;

select * from ineuron_Students where student_batch = 'fsda' order by students_marks;

select * from ineuron_Students where student_batch = 'fsda';

select * from ineuron_Students where student_batch = 'fsda' order by students_marks desc limit 1,1;

select * from ineuron_Students;

select student_id, student_batch, student_stream, students_marks,
row_number() over(order by students_marks) as 'row_number' from ineuron_students;

select student_id, student_batch, student_name ,student_stream, students_marks,
row_number() over(partition by student_batch order by students_marks) as 'row_num' from ineuron_students;

select * from (select student_id, student_batch, student_name, student_stream, students_marks,
row_number() over(partition by student_batch order by students_marks) as 'row_num' from ineuron_students) as test where row_num = 1;


select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc ) as 'row_num' 
from ineuron_students;

select student_id , student_batch , student_stream,students_marks ,
row_number() over(order by students_marks desc) as 'row_number',
rank() over(order by students_marks desc ) as 'row_rank' 
from ineuron_students;

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank' 
from ineuron_students ) as test where row_rank = 1;

select * from (select student_id , student_batch , student_stream,students_marks ,
row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
rank() over(partition by student_batch order by students_marks desc ) as 'row_rank',
dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
from ineuron_students ) as test where `dense_rank` = 3;
