CREATE DATABASE IF NOT EXISTS homework;

use homework;
-- task 1
create table Users(
	ID INT auto_increment,
    NAME VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL Unique,
    PASSWORD VARCHAR(50) NOT NULL,
    DATACREATE datetime default NOW(),
    primary key(ID)
    );
 -- task 2
 create table Orders(
	ID INT auto_increment,
    IdUser int not null,
    DATACREATE datetime default NOW(),
    Status varchar(20) not null default 'new',
    primary key(ID)
    );
    
insert into Users(name, email, password) values ('dima','dima@dima.by','pass');
insert into Users(name, email, password) values('stas','stas@stas.by','pass');
insert into Users(name, email, password) values ('art','art@art.by','pass');
-- task 3
Select name, email, datacreate from users where datacreate like '2023-03-13%';
-- task 4
insert into Orders(IdUser) values (1),(1),(1),(1);
insert into Orders(IdUser) values (2),(2),(2),(2);
insert into Orders(IdUser) values (3),(3),(3),(3);
Select * from Orders where IdUser = 2;
-- task 5
create table Prodects(
	Idprod int auto_increment,
	NameProduct varchar(30) not null,
    description varchar(100) not null,
    Price double not null
    );
    
    
select * from users;





