use soft_uni;

select * from `departments` order by 'id';

select `name` from `departments`;

select `first_name` , `last_name`, `salary` from employees order by 'id';

select 
concat(`first_name`, '.', `last_name`, '@softuni.bg') 
as 'full_email_address'
from employees;

select distinct `salary` from employees;

select * from `employees` where `job_title` = 'Sales Representative';

select `first_name`, `last_name`, `job_title`
from `employees`
where `salary` >= 20000 and `salary` <= 30000;

select concat(`first_name`, ' ', `middle_name`, ' ', `last_name`) as 'Full Name'
from `employees`
where `salary` = 25000
or `salary` = 14000
or `salary` = 12500
or `salary` = 23600;


select `first_name`, `last_name`
 from employees
 where `manager_id` is null;

select `first_name`, `last_name`, `salary`
 from employees
 where `salary` > 50000 order by `salary` desc;

select `first_name`, `last_name`
 from employees order by `salary` desc limit 5;

select `first_name`, `last_name`
 from employees where `department_id` != 4;

select * from `employees`
 order by `salary` desc, `first_name` asc,`last_name` desc, `middle_name` asc;


create view `v_employees_salaries` as
 select `first_name`, `last_name`, `salary`
 from `employees`;

create view `v_employees_job_titles` as
 select concat(`first_name`, ' ', `middle_name`, ' ', `last_name`) as 'full_name' , `job_title`
 from `employees`;
 
 select distinct `job_title`
 from `employees`
 order by `job_title` asc;
 
 select * from `projects`
 order by `start_date`, `name`
 limit 10;
 
 select `first_name` , `last_name`, `hire_date`
 from `employees`
 order by `hire_date` desc
 limit 7;
 
update `employees`
set `salary` = `salary` * 1.12
where `department_id` in (11,4,2,1);
select `salary`
 from `employees`;
 
 
--  next database 
 
 
 select `peak_name`
 from `peaks`
 order by `peak_name` asc;
 
 

SELECT c.country_name, c.population
FROM countries AS c
WHERE c.continent_code = 'EU'
ORDER BY c.population DESC, c.country_name
LIMIT 30;
 

 
CREATE TABLE `country_currencies` AS 
 SELECT 
	`country_name`, 
	`country_code`, 
	`currency_code` 
 FROM
    `countries`;
    
ALTER TABLE `country_currencies`
MODIFY COLUMN `currency_code` VARCHAR(20);
    
UPDATE `country_currencies`
SET `currency_code` = 'Not Euro'
WHERE `currency_code` != 'EUR';
    
UPDATE `country_currencies`
SET `currency_code` = 'Euro'
WHERE `currency_code` = 'EUR';
    
SELECT * FROM `country_currencies`
ORDER BY `country_name` ASC;

select `name` 
from `characters`
order by `name` asc;
