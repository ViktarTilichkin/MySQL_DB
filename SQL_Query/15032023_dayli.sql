Create database universityDB;

use universityDB;

create table  university(
	id INT  AUTO_INCREMENT,
	title VARCHAR(10) NOT NULL,
	address VARCHAR(50) NOT NULL,
	primary key(id)
	);

alter table university add Phone VARCHAR(13) UNIQUE;

insert into university(title, address, phone) values ('БГУИР', 'ул. Петруся Бровки 6', "+375172938815"), ('БНТУ', 'пр. Независимости, 65',
"+375172927752"), ('БГУ', 'пр. Независимости, 4', "+375172095044"), ('БГТУ', 'ул.
Свердлова, 13а', "+375173439432");
Select * from university;
truncate table university;

insert into university(title, address, phone) values ('БГУИР', 'ул. Петруся Бровки 6', "+375172938815"), ('БНТУ', 'пр. Независимости, 65',
"+375172927752"), ('БГУ', 'пр. Независимости, 4', "+375172095044"), ('БГТУ', 'ул.
Свердлова, 13а', "+375173439432");
Select * from university;

create table type(
	id INT  AUTO_INCREMENT,
	type VARCHAR(10) DEFAULT 'offline',
    primary key(id)
    );
    
create table students(
	id INT  AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	surname VARCHAR(30) NOT NULL,
	age INT DEFAULT 17,
	university_id  INT NOT NULL,
	type_id  INT NOT NULL,
    primary key(id),
    foreign key (university_id) REFERENCES university (id),
    foreign key (type_id) REFERENCES type (id)
    );
    
insert into type(type) values('offline'), ('online'); 

insert into students(name, surname, age, university_id, type_id) values
('Анна', 'Петрова', 20, 1, 1), ('Дарья', 'Платонова', 18, 1, 1), ('Николай', 'Николаев', 19, 3, 2),
('Авсгустна', 'Сентябрьская', 20, 2, 2), ('Есения', 'Грант', 18, 4, 1);
 
 Select st.id, st.name, st.surname, st.age, un.title from students st 
 join university un
 on un.id = st.university_id
 where un.title = 'БГУИР';
 
 Select st.id, st.name, st.surname, st.age, t.type from students st
 join type t 
 on t.id = st.type_id
 where t.type = 'offline';
 
 Select count(*) as Количество_студентов from students st
 join type t
 on t.id = st.type_id
 where t.type = 'online';
 
 Select count(t.type) as count, t.type from students st
 join type t
 on t.id = st.type_id
 group by t.type;
   
Select st.name, st.surname, un.title from students st
join university un
on un.id = st.university_id
order by st.surname ASC;

Select MIN(st.Age), MAX(st.Age), un.title from students st
join university un
on un.id = st.university_id
group by un.id;
    
Select st.id, st.name, st.surname, un.title, t.type from students st
join university un
on un.id = st.university_id
join type t 
on t.id = st.type_id;

Select count(un.title), un.title from students st
join university un
on un.id = st.university_id
group by un.id
order by count(un.title) desc
limit 1;

Select st.id, st.name, st.surname, un.title, t.type from students st 
 join university un
 on un.id = st.university_id
join type t 
on t.id = st.type_id
where un.title = 'БГУИР' and t.type = 'offline';

Select st.id, st.name, st.surname, un.title, t.type from students st 
 join university un
 on un.id = st.university_id
join type t 
on t.id = st.type_id
where un.title Like '%Р' and t.type = 'offline';

Select st.name, st.surname , st.age, un.title from students st
join university un
 on un.id = st.university_id
 where st.age > 19 && un.title = 'БНТУ';
 
 -- next task 19
