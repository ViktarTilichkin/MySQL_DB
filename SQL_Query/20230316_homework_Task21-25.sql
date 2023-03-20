use universityDB;

-- 21. Найдите всех студентов, фамилия которых начинается на “П”
Select students.name, students.surname from students
	where surname like 'П%';
    
-- 22. Отобразите наибольший возраст внутри каждого из университетов

Select university.title, MAX(age) from students
	join university
    on university.id=students.university_id
    group by title;
    
-- 23. Добавьте с таблицу однофамильца и выведите все уникальные значения
-- фамилий из таблицы.

insert into students(name, surname, age, university_id, type_id) values
('Жанна', 'Петрова', 22, 1, 1);

Select distinct surname, name, age, university_id from students;

-- 24.Отобразите последнюю запись в таблице студенты. К выводу добавьте
-- университет каждого студента и его форму обучения

Select st.id, st.name, st.surname, un.title, t.type from students st 
	join university un
	on un.id = st.university_id
	join type t 
	on t.id = st.type_id
	order by id DESC
	limit 1;

-- 25. Очистите все таблицы полностью. Удалите таблицы. Удалите БД

truncate table students;
truncate table university;
truncate table type;

drop  table students;
drop table university;
drop table type;

drop database universitydb;
