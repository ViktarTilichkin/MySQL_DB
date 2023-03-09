create database if not exists university;

use university;

create table students(
	ID INT auto_increment,
    `Name` VARCHAR(20) NOT NULL,
    SurName varchar(30) NOT NULL,
    AGE INT default 17,
    Email varchar(30) unique,
    primary key(id)
    );
alter table students add AvgGrade decimal(5,2);

insert into students(`name`, SurName, age, email,AvgGrade) values('Анна', 'Петрова', 20, 'anna@mail.ru', 10.0), ('Дарья', 'Платонова', 18, 'dasha@mail.ru',
9.1), ('Николай', 'Николаев', 19, 'kolya@mail.ru', 7.9), ('Авсгустна', 'Сентябрьская', 20,
'avg@mail.ru', 6.0), ('Есения', 'Грант', 18, 'yesgrant@mail.ru', 8.1);
 
 Select * from students;
truncate table students;
select Count(*) from students;

alter table students add groupInt Int;

update students set groupInt = 810101 where ID between 1 and 3;
update students set groupInt = 810102 where ID between 4 and 6;

Select groupInt, Count(*) as 'кол-во студентов'  from students group by groupInt;

Select groupInt, Round(Avg(avggrade), 2) as 'avg avggrade' from students group by groupInt order by Avg(avggrade);

Select groupInt, round( Avg(avggrade),2) from students group by groupInt having Avg(avggrade) > 8;

Select `name`, surname from students where surname Like('П%');

Select  groupInt, max(avggrade) from students group by groupInt;

update students set groupInt = 910101 where groupInt = 810101;

Select  Round(min(avggrade)*10, 0) 'минимальная оценка' , Round(max(avggrade)*10, 0) 'максимальная оценка' from students;

Select `name`, surname, email, age from students where age between 19 and 21 and `name` Like('А%') order by surname;

insert into students(`name`, SurName, age, email,AvgGrade) values('ЖАННА', 'Петрова', 22, 'janna@mail.ru', 5.5);

Select distinct surname from students;

Select surname, Count(*) as 'однофамильцы' from students group by surname;

select groupInt, min(age), max(age) from students where age > 19 group by groupInt;

select * from students;
delete from students where id = 3;
truncate table students;

drop database university;