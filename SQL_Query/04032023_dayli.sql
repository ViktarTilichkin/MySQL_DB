use homework;

create table Market(
	ID INT not null,
    `Name` VARCHAR(20) not null ,
    age double not null
       );
    
insert into market(id, `name`, age) values (67, 'name23', 22.2),
(45, 'name31', 29.9),(90, 'name311', 25.5),(13, 'name41312', 26.7);
insert into market(id, `name`, age) values (22, 'name22', 55.0),
(15, 'name15', 43),(10, 'name10', 21),(7, 'name7', 15);
insert into market(id, `name`, age) values (23, 'name22', 55.0),
(16, 'name15', 43),(11, 'name10', 21),(8, 'name7', 15);
select count(*) as 'count',
		Sum(age) as 'сумма age',
        Min(age) as 'min age',
        Max(age) as 'max age',
        AVG(age) as 'avg age'
from Market;

Select * from market where age <= 29.9;
Select * from market where age like'2%';
Select * from market where age between 25 and 29 limit 5;

select* from market order by AGE desc, id desc limit 5;

