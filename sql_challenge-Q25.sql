create table if not exists Activity(
  player_id int,
  device_id int,
  event_date date,
  games_played int,
  primary key(player_id,event_date));
  
  insert into Activity values
  (1,2,'2016-03-01',5),
  (1,2,'2016-05-02',6),
  (2,3,'2017-06-25',1),
  (3,1,'2016-03-02',0),
  (3,4,'2018-07-03',5);
  
 -- Write an SQL query to report the device that is first logged in for each player.

Select player_id,device_id from Activity a 
where event_date=(select min(event_date) from activity group by player_id having player_id=a.player_id);
