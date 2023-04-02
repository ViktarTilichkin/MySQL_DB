CREATE DATABASE IF NOT EXISTS homework;

use homework;
create table Random(
	Id INT auto_increment,
    City VARCHAR(20) Not null,
    primary key(id)
    );
    
Alter Table Random ADD Name VARCHAR(20) not null;

ALter Table Random Drop column City;

create table TableTime(
	Cucumber varchar(20),
    time datetime
    );
Alter table TableTime add Name varchar(20), add Count int;

alter table TableTime drop Count;

drop table Tabletime;