create database if not exists Company;

use company;

create table worker(
	id INT  AUTO_INCREMENT,
	Name VARCHAR(40) NOT NULL,
	Lastname VARCHAR(40) NOT NULL,
	Email VARCHAR(40) NOT NULL,
	Age INT NOT NULL,
    primary key(id)
    );
    
create table salary(
	id INT AUTO_INCREMENT,
	Worker_id INT NOT NULL,
	Month_id INT NOT NULL,
	Salary INT NOT NULL,
    primary key(id)
    );
    
create table month(
	id INT auto_increment,
    Title varchar(20) not null,
    primary key(id)
    );


alter table salary add constraint FK_Worker_id foreign key(Worker_id) references worker(id);
alter table salary add constraint FK_Month_id foreign key(Month_id) references month(id);

insert into month(title) values ('Январь'),('Февраль'),('Март'),('Апрель'),
('Май'),('Июнь'), ('Июль'), ('Август'), ('Сентябрь'),
('Октябрь'), ('Ноябрь'), ('Декабрь');
select * from month;

insert into worker(name, lastname,email, age) values ('Есения', 'Грант', 'yes@mail.ru', 21), 
('Анастасия', 'Павлова', 'test@mail.ru', 21),
('Мария','Гардон', 'qqq@mail.ru', 21),('Марта', 'Котикова', 'eee@mail.ru', 28),
('Борис', 'Юревич','zzz@mail.ru', 21),('Рыжик', 'Рыжий', 'eeezzz@mail.ru', 31), 
('Рейна', 'Собачкова','test2@mail.ru', 28),('Дарья', 'Плешко','dasha@mail.ru', 17);
insert into worker(name, lastname,email, age) values
('Константин','Константинов', 'konst@mail.ru', 31),('Максим', 'Ниолаев', 'hanna@mail.ru', 21),
('Иван','Иванов', 'iv@mail.ru', 31),('Николай', 'Николаев', 'nik@mail.ru', 24);


insert into salary (worker_id,Month_id, Salary) values (1, 1, 500), (1, 2, 600), (1, 3, 5600), (1, 4, 5100), (1, 5, 5400), (2, 1, 500), (2, 2, 5700), (2, 3, 500), (3,
1, 1500), (4, 1, 5200), (5, 6, 3500), (5, 7, 4500), (6, 4, 570), (7, 9, 5107), (8, 10, 6700);

select * from worker 
	where id in(3,4,5,6,10);
select * from worker 
	where id in(3,5,6,10) and (email like 'eee%' or email like 'zzz%' or email like 'ggg%');

select * from worker 
	FULL JOIN salary;
    -- on salary.Worker_id = worker.id;
    
-- Выведите сотрудников и их зарплаты.
    
select * , (Select Sum(salary) from salary where Worker_id = worker.id) as salary from worker;

-- 5. Выберите неповторяющиеся зарплаты

select distinct salary from salary;

-- 6. Выведите тех сотрудников, зарплаты которых > 1000

select * from worker w
	inner join salary s
    on s.Worker_id = w.id
    where s.Salary > 1000;

-- 7. Выведите сотрудников их зарплаты и месяцы

select w.*, s.Salary, m.Title from worker w
	inner join salary s
	on s.Worker_id = w.id
    inner join month m
    on m.Id = s.Month_id;
    
-- 8. Обновите имя у сотрудника id которого 1

update worker set Name = 'Борис бритва' where id = 1;

-- 9. Выведите полностью всех сотрудников и зарплаты которые имеются среднее 

select w.*, Round(AVG(Salary),1) as Ср_зарплата from worker w
	inner join salary s
    on s.Worker_id = w.id
    group by id;
    
-- 10. Выведите минимульную и максимальную прибыль сотрудника

select w.*, MAX(s.Salary), MIN(s.Salary)  from worker w
	inner join salary s
    on s.Worker_id = w.id
    group by w.id;
    
-- 11. Выведите количество всех сотрудников

Select COUNT(*) from worker;

-- 12. Выведите средний возраст среди всех сотрудников

select Round(AVG(AGE),1) as AVG_AGE from worker;

-- 13. Выведите суммарную прибыль каждого сотрудника

Select w.*, SUM(salary) from worker w
	left join salary s
    on s.Worker_id = w.id
    group by w.id;
    
-- 14. Выведите суммарную прибыль каждого сотрудника, где сумма > 2000

Select w.*, SUM(s.Salary) from worker w
	inner join salary s
    on s.Worker_id = w.Id
    group by w.id
    having SUM(s.Salary) > 2000;
    
--   15. При выборке создайте новое поле, которое состоит из конкатенации имени и
-- фамилии сотрудника разделенных пробелом
    
select CONCAT(w.Name , ' ' , w.Lastname) as Сотрудник from worker w;
    
-- 16. Найдите самые маленькие зарплаты по группам возрастов

select w.age, MIN(s.Salary) from worker w
	inner join salary s
    on s.Worker_id = w.id
    group by w.age;
    
-- 17. Подзапрос. Выберите сотрудников, возраст которых меньше среднего возраста,
-- деленного на 2 и умноженного на 3
    
Select * from worker
	where age < (select (AVG(AGE)/2)*3 from worker);
    
-- 18. Подзапрос. Выберите из таблицы workers записи с минимальной зарплатой.

select * from worker w
	inner join salary s
    on s.Worker_id = w.id
    where s.salary = ( select min(salary) from salary);
    
-- 19. Отобразите средние зарплаты сотрудников каждого месяца

select m.title, Round(AVG(s.Salary),0) as AVG_SALARY from worker w
	inner join salary s
    on s.Worker_id = w.id
    inner join month m
    on s.Month_id = m.id 
    group by m.title;
    
-- 20. Отобразите тех сотрудников, зарплата которых выше средней каждого месяца в
-- отсортированном порядке

select w.*, s.salary, s.month_id from worker w
	inner join salary s
    on s.Worker_id = w.id
    where s.salary > (select Round(AVG(sp.Salary),0) from worker w
	inner join salary sp
    on sp.Worker_id = w.id
    inner join month m
    on sp.Month_id = m.id 
    group by m.id
    having m.id = s.month_id)
    order by s.salary;


-- 21. Вычислите максимальную и минимальную зарплаты каждого сотрудника.
-- Отобразите те, которые выше 2000 в отсортированном порядке

select w.* , MIN(s.Salary), MAX(s.salary) from worker w
	inner join salary s 
    on s.Worker_id = w.id
    group by w.id
    having MIN(s.Salary) > 2000;

-- 22. Выведите месяц, в котором компания выдала наибольшую сумму зарплат за месяц

select m.title, avg(s.salary) from worker w
	inner join salary s
    on s.Worker_id = w.id
    inner join month m
    on s.Month_id = m.id 
    group by m.title
    order by avg(s.salary) DESC
    limit 1;

-- 23. Выведите 5 уникальных фамилий в алфавитном порядке

select distinct lastname from worker
	order by lastname asc
	limit 5;

-- 24.В каждом приведенном месяце выведите ту зарплату и сотрудника, зарплата
-- которого выше остальных. Учитывать только тех сотрудников, возраст которых
-- выше 20

select w.*, s.salary   from worker w
	inner join salary s
    on s.Worker_id = w.id
    inner join month m
    on s.Month_id = m.id;
    
select w.* , MAX(s.salary)  from worker w
	inner join salary s
    on s.Worker_id = w.id
    inner join month m
    on s.Month_id = m.id
    group by m.title
    having MAX(salary);

-- 25. Очистите и удалите все таблицы

truncate table salary;
truncate table month;
truncate table worker;

drop table saalry;
drop table month;
drop table worker;