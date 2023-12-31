create database ineuron_sql_practice;
Use ineuron_sql_practice;

create table if not exists station(
ID int,
City varchar(60),
State varchar(60),
Lat_N int,
Long_w int);

Load data infile
"D:\stationdata - Sheet1.csv"
into table station
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
### Problem with dataset

insert into station values(794, 'Kissee Mills', 'MO', 139, 73);
insert into station values(824, 'Loma Mar' ,'CA', 48, 130);
insert into station values(603, 'Sandy Hook', 'CT', 72, 148);
insert into station values(478, 'Tipton' ,'IN', 33, 97);
insert into station values(619, 'Arlington', 'CO' ,75, 92);
insert into station values(711, 'Turner', 'AR' ,50, 101);
insert into station values(839, 'Slidell', 'LA' ,85, 151);
insert into station values(411, 'Negreet', 'LA', 98 ,105);
insert into station values(588, 'Glencoe', 'KY' ,46 ,136);
insert into station values(665, 'Chelsea', 'IA' ,98, 59);
insert into station values(342, 'Chignik Lagoon', 'AK' ,103, 153 );
insert into station values(733, 'Pelahatchie' ,'MS' ,38, 28);
insert into station values(441, 'Hanna City','IL' ,50, 136);
insert into station values(811, 'Dorrance', 'KS', 102, 121);
insert into station values(698, 'Albany' ,'CA' ,49, 80);
insert into station values(325, 'Monument','KS', 70, 141);
insert into station values(414, 'Manchester', 'MD' ,73, 37);
insert into station values(113, 'Prescott', 'IA' ,39 ,65);
insert into station values(971, 'Graettinger', 'IA', 94, 150);
insert into station values(266, 'Cahone', 'CO',116 ,127);

select * from station;

-- Q7. Query a list of CITY and STATE from the STATION table.

select City ,State from station;

-- Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results
-- in any order, but exclude duplicates from the answer.

select City from station where (ID % 2) = 0;

-- Q9. Find the difference between the total number of CITY entries in the table and the number of
-- distinct CITY entries in the table

select count(City) - count(distinct City) as diff from station;

select (count(city)-count(distinct city)) as diff from station;


-- Q10.Query the two cities in STATION with the shortest and longest CITY names, as well as their
-- respective lengths (i.e.: number of characters in the name). If there is more than one smallest or
-- largest city, choose the one that comes first when ordered alphabetically

select City,char_length(City) as length from station where char_length(City) = (select max(char_length(City)) from station) order by City limit 1;
select City,char_length(City) as length from station where char_length(City) = (select min(char_length(City)) from station) order by City limit 1;

-- Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

select distinct(City) from Station where lower(substr(City,1,1)) in ('a','e','i','o','u');
select distinct city from station where lower(substr(city,1,1)) in ('a','e','i','o','u');

-- Q12.Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct City from station where lower(substr(City,-1,1)) in ('a','e','i','o','u');
select distinct city from station where lower(substr(city,-1,1)) in ('a','e','i','o','u');

 -- Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
Select distinct City from station where lower(substr(City,1,1)) not in ('a','e','i','o','u');

-- Q14.Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
select distinct City from station where lower(substr(City,-1,1)) not in ('a','e','i','o','u');
select distinct city from station where lower(substr(city,-1,1)) not in ('a','e','i','o','u');

-- Q15.Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
Select distinct City from station where lower(substr(City,1,1)) not in ('a','e','i','o','u') or lower(substr(City,-1,1)) not in ('a','e','i','o','u');
select distinct city from station where lower(substr(city,1,1)) not in ('a','e','i','o','u') or lower(substr(city,-1,1)) NOT in ('a','e','i','o','u');

-- Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
Select distinct City from station where lower(substr(City,1,1)) not in ('a','e','i','o','u') and lower(substr(City,-1,1)) not in ('a','e','i','o','u');

Select * from station;