drop database if exists minions;
create database minions;
use minions;

create table minions (
`id` int,
name varchar(25),
`age` int,
constraint pk_minions primary key (id)
);

create table towns(
`id` int,
`name` varchar(25) not null,
constraint pk_town primary key (id)
);

alter table minions
add town_id int;

alter table minions
add constraint fk_minions_town foreign key (town_id)
references towns (id);

insert into towns (`id`,`name`)
values (1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna');

insert into minions(`id`,`name`,`age`,`town_id`)
values (1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Steward',NULL,2);

drop tables minions, towns;
