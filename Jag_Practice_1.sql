create database dress
use dress
create table if not exists dress_table(
test_id int auto_increment,
 test_name varchar(30),	
test_mail_id	varchar(50),	
test_address	varchar(30),	
primary key	(test_id))

select * from dress
insert into dress_table values(1,'jagannath','devarakonda6378@gmail.com','Anantapur'),
(2,'Shiva','kumar4380@gmail.com','Anantapur')
select * from dress_table
insert into dress_table values(3,'Devarakonda','krishna@gmail.com','Kurnool')
select * from dress_table
insert into dress_table (test_name,test_mail_id,test_address) values('Devarakonda','krishna@gmail.com','Kurnool'),
('jagannath','devarakonda6378@gmail.com','Anantapur'),
('Shiva','kumar4380@gmail.com','Anantapur')


create table if not exists dress_table1(
test_id int ,
test_name varchar(30),	
testmailid	varchar(50),	
test_address	varchar(30),	
test_salary int check(test_salary > 10000))

insert into dress_table1 values(1,'jagannath','devarakonda6378@gmail.com','Anantapur', 20000),
(2,'Shiva','kumar4380@gmail.com','Anantapur',30000)
select * from dress_table1
insert into dress_table1 values(1,'jagannath','devarakonda6378@gmail.com','Anantapur', 2000)


create table if not exists test5( 
test_id int NOT NULL,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30) check (teast_adress= 'bengalore'),
test_salary int check(test_salary > 10000))

select * from test5
select * from test5
insert into test5 ( test_name , test_mailid , teast_adress,test_salary) values ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000)
create table if not exists test4 ( 
test_id int ,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30) check (teast_adress= 'bengalore'),
test_salary int check(test_salary > 10000))

insert into test4 values (1,'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 5000)
