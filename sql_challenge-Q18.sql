create database sql_challenge;
Use sql_challenge;
create table if not exists Views(
article_id int,
author_id int,
viewer_id int,
view_date date);
select * from Views;
insert into Views values
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2,7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');
select * from Views;

select distinct a.author_id as id
from Views a inner join Views v on a.author_id = v.viewer_id and a.article_id = v.article_id
order by a.author_id;

SELECT DISTINCT a.author_id AS id
FROM Views a
WHERE EXISTS (
    SELECT 1
    FROM Views v
    WHERE a.author_id = v.viewer_id
      AND a.article_id = v.article_id
)
ORDER BY a.author_id;
