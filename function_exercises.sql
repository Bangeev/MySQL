
use soft_uni;


select `first_name`, `last_name`
from `employees`
where `first_name` like 'Sa%';


select `first_name`, `last_name`
from `employees`
where `last_name` like '%ei%';

select `first_name`
from `employees`
where `department_id` in (3, 10)
and extract(year from `hire_date`) between 1995 and 2005
order by `department_id` desc;


select `first_name`, `last_name`
from `employees`
where `job_title` not like '%engineer%';


select `name`
from `towns`
where char_length(`name`) <= 6
order by `name` asc;

select `town_id`, `name`
from `towns`
where `name` like 'M%' or `name` like 'K%' or `name` like 'B%' or `name` like 'E%' 
order by `name` asc;

select `town_id`, `name`
from `towns`
where left(`name`, 1) not in ('R', 'D', 'B')
order by `name`;

create view `v_employees_hired_after_2000` as
select `first_name`, `last_name`
from `employees`
where extract(year from `hire_date`) > 2000;

SELECT `first_name`, `last_name`
FROM `employees`
where char_length(`last_name`) = 5;

select `country_name`, `iso_code`
from `countries`
where `country_name` like '%a%a%a%'
order by `iso_code`;

select p.peak_name, r.river_name, lower(concat(p.peak_name, substring(r.river_name, 2))) as `mix`
from `peaks` as `p` , `rivers` as `r`
where right(p.peak_name, 1) = left(r.river_name, 1)
order by `mix`;

select `name` , date_format(`start`, '%Y-%m-%d') as `date`
from `games`
where extract(year from `start`) between 2011 and 2012
order by `date`, `name`
limit 50;

select `user_name`, substring(`email`, locate('@','email') + 1) as 'Email Provider'
from `users`
order by `Email Provider` , `user_name`;

select `user_name`, `ip_address`
from `users`
where `ip_address` like '___.1%.%.___'
order by `user_name`;

CREATE TABLE `game_duration` AS 
SELECT 
    `name`,
    HOUR(`start`) AS `hours`,
    `duration`
FROM
    `games`;
    
ALTER TABLE `game_duration` 
ADD COLUMN `part_of_the_day` VARCHAR(50);

ALTER TABLE `game_duration`
ADD COLUMN `game_length` VARCHAR(20);
    
UPDATE `game_duration` 
SET 
    `part_of_the_day` = 'Morning'
WHERE
    `hours` >= 0
        AND `hours` < 12;
        
UPDATE `game_duration` 
SET 
    `part_of_the_day` = 'Afternoon'
WHERE
    `hours` >= 12
        AND `hours` < 18;
        
UPDATE `game_duration` 
SET 
    `part_of_the_day` = 'Evening'
WHERE
    `hours` >= 18
        AND `hours` < 24;
        
UPDATE `game_duration` 
SET 
    `game_length` = 'Extra Short'
WHERE
    `duration` <= 3;

UPDATE `game_duration` 
SET 
    `game_length` = 'Short'
WHERE
    `duration` > 3 AND `duration` <= 6;
    
UPDATE `game_duration` 
SET 
    `game_length` = 'Long'
WHERE
    `duration` > 6 AND `duration` <= 10;
    
UPDATE `game_duration` 
SET 
    `game_length` = 'Extra Long'
WHERE
    `duration` > 10 OR `duration` IS NULL;
    
SELECT 
    `name` AS 'game',
    `part_of_the_day` AS 'Part of the Day',
    `game_length` AS 'Duration'
FROM
    `game_duration`
ORDER BY `name`;

SELECT 
    `product_name`,
    `order_date`,
    DATE_ADD(`order_date`, INTERVAL 3 DAY) AS `pay_due`,
    DATE_ADD(`order_date`, INTERVAL 1 MONTH) AS `deliver_due`
FROM
    `orders`;
