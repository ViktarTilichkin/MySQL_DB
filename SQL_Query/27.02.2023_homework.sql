create database if not exists university;

use university;

create table if not exists students(
	id INT AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    SurName VARCHAR(40) NOT NULL,
    Age Int NOT NULL default  1,
    Course Int NOT NULL,
    primary key(id)
    );
    drop table students;
    
alter table students add Phone VARCHAR(13) NOT NULL UNIQUE;

alter table students add constraint Chek_Length Check(length(Phone) = 13);
alter table students add constraint Chek_375 check(Phone like '+375%');

insert into students (Name, SurName, Age, Course, Phone)  values 
('Maria', 'Grant', 22, 5, '+375291111111'), ('Martha', 'Mausoleum', 21, 4, '+375291111122'), 
('Konstantin', 'Konstantinov', 20, 3, '+375291231361'), ('Kirill', 'Anisimov', 21, 4, '+375291181111'), 
('Yana', 'Zolotova', 22, 5, '+375291149011');

insert into students (Name, SurName, Age, Course, Phone)  values 
('Mariana', 'Granata', 22, 5, '+111291111111');

truncate table students;

select * from students;

select Name , SurName, Phone  from students;
select Name as Имя, SurName as Фамилия, Phone as Телефон from students;

select distinct SurName as Фамилия from students;

update students set Name = 'Hello' , SurName = 'Hellohello' where id = 1;

delete from students where id = 1;

select distinct Course as Фамилия from students;