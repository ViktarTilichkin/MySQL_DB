CREATE DATABASE IF NOT EXISTS studies;

USE STUDIES;

CREATE TABLE Animal (
	ID INT auto_increment not null,
    NAME VARCHAR(20) NOT NULL,
    TYPE VARCHAR(20),
    primary key(ID)
    );
rename table Animal to Animals;

insert into animals(name, type) values ('дятел', 'птица');
insert into animals(name, type) values ('собака', 'млекопетающие');
insert into animals(name, type) values ('лягушка', 'земноводная');
insert into animals(name, type) values ('лосось', 'рыба'), ('медведь', 'млекопетающие');
SELECT LAST_INSERT_ID();
select id, `name`, `type` from animals;

SELECT * FROM animals where `name` = 'дятел';