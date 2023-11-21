create database key_prim;
Use key_prim;

create table ineuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
no_of_enrollment int,
primary key(course_id));

insert into ineuron values(01,'FSDA','active',100);
insert into ineuron values(02,'FSDS','non-actve',100);
select * from ineuron;

create table ineuron_students(
students_id int,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id int,
foreign key(course_id1) references ineuron(course_id));

insert into ineuron_students values(101, 'fsda','test@gmail.com','active',05);

select * from ineuron_students;

insert into ineuron_students values(101, 'fsda','test@gmail.com','active',01);
insert into ineuron_students values(101, 'fsda','test@gmail.com','active',01);
insert into ineuron_students values(101, 'fsda','test@gmail.com','active',01);

create table payment(
course_name varchar(60),
course_id int,
course_live_status varchar(60),
course__launch_date varchar(60),
foreign key(course_id) references ineuron(course_id));

insert into payment values('fsda',01,'non-active','7th Aug');
insert into payment values('fsda',01,'non-active','7th Aug');
insert into payment values('fsda',02,'non-active','7th Aug');

select * from payment;

create table class(
course_id int,
course_name varchar(60),
course_topic varchar(60),
class_duration int,
primary key(course_id),
foreign key(course_id) references ineuron(course_id));

alter table ineuron drop primary key;

alter table class drop primary key;

alter table ineuron add constraint test_prim primary key(course_id,course_name);

drop table ineuron;

drop table class;

create table test(
id int not null,
name varchar(60),
mail_id varchar(60),
mobile_no varchar(9),
address varchar(50));

alter table test add primary key(id); 

alter table test drop primary key;

alter table test add constraint test_prim primary key(id, mail_id);

create table parent(
id int not null,
primary key(id));

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id));

insert into parent values(1);

insert into parent values(2);

insert into child values(1,1);

select * from child;

insert into child values(2,2);

delete from parent where id = 1;

SET SQL_SAFE_UPDATES = 0;

delete from child where id = 1;

drop table child;

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id) on delete cascade);

insert into child values(1,1),(1,2),(3,2),(2,2);

select * from child;

select * from parent;

delete from parent where id = 1;

update parent set id = 3 where id = 2;

drop table child;

create table child(
id int,
parent_id int,
foreign key(parent_id) references parent(id) on update cascade);

select * from child;

update parent set id = 3 where id = 2;

select * from parent;