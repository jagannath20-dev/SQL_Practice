Use sql_challenge;
create table if not exists Views(
article_id int,
author_id int,
viewer_id int,
view_date date);
insert into Views values
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2,7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');

-- Write an SQL query to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.
select distinct v1.author_id
from Views v1
join Views v2 on v1.author_id = v2.viewer_id and v1.article_id = v2.article_id
order by v1.author_id;

