create database if not exists cinema;

use cinema;

create table movies(
	id INT AUTO_INCREMENT,
	title VARCHAR(40) NOT NULL,
	director VARCHAR(40) NOT NULL,
	year INT NOT NULL,
	length_minutes INT NOT NULL,
    primary key(id)
	);
    
insert into movies(title, director, year, length_minutes) values
("История игрушек", "John Lasseter", 1995, 81), ("Жизнь жуков", "John Lasseter", 1998,
95), ("История игрушек 2", "John Lasseter", 1999, 93), ("Корпорация монстров", "Pete
Docter", 2001, 92), ("В поисках немо", "Andrew Stanton", 2003, 107), ("Суперсемейка",
"Brad Bird", 2004, 116), ("Тачки", "John Lasseter", 2006, 117), ("Рататуй", "Brad Bird", 2007,
115), ("ВАЛЛ-И", "Andrew Stanton", 2008, 104), ("Вверх", "Pete Docter", 2009, 101),
("История игрушек 3", "Lee Unkrich", 2010, 103), ("Тачки 2", "John Lasseter", 2011, 120),
("Храбрая сердцем", "Brenda Chapman", 2012, 102), ("Университет монстров", "Dan
Scanlon", 2013, 110);

Select * from mOvies;

select title as название from movies;

Select title as Название_фильма, director as Продюсер from movies;

Select title as Название_фильма from movies
where title like '%сто%';

-- 6. Вывести всю информацию о каждом фильме
-- 7. Выведите количество фильмов выпущенных в каждом году
-- 8. Найдите фильмы, не выпущенные в период year с 2000 по 2010 год

Select * from movies;

Select year, Count(title) as количество from movies
	group by year;

Select title, director, year length_minutes from movies
	where year NOT between 2000 and 2010;

-- 9. Найдите первые 5 фильмов и их выпуск year
-- 10. Найти среднее время фильмов у каждого рефиссера
-- 11. Найти все фильмы режиссера начинающегося на “Джон”

Select title, year from movies
	limit 5;

Select director, Round(AVG(length_minutes),2) from movies
	group by director;

Select * from movies 
	order by director ASC;
    
Select title, director from movies 
	where director like 'John%';

-- 12. Найти 3 первых фильма начинающиеся на “В” в отсортированном порядке
-- 13. Отобразите общее количество всех фильмов существующих в БД, а также
-- максимальный и минимальный по длительности фильм
-- 14. Перечислите список всех режиссеров фильмов (в алфавитном порядке) без
-- дубликатов 

Select * from movies 
	where title like 'В%'
    order by title ASC;
    
Select Count(title), min(length_minutes), Max(length_minutes) from movies;

Select distinct director from movies
order by director ASC;

-- 15. Перечислите всех режиссеров, выпустивших минимум 2 фильма
-- 16. Перечислите первые пять фильмов в алфавитном порядке. Учитывать фильмы
-- только с 2000 года
-- 18. Сформулируйте SQL запрос для создания таблицы boxoffice. Структура таблицы
-- boxoffice:

Select director, count(title) from movies 
	group by director
    having count(title) > 1;
    
Select * from movies 
	where year >= 2000
    order by title ASC
    limit 5;

create table boxoffice(
	id INT AUTO_INCREMENT,
	movie_id  INT NOT NULL,
	rating DECIMAL(5, 2) NOT NULL,
	domestic_sales INT NOT NULL,
	internation_sales INT NOT NULL,
	primary key(id)
    );

alter table boxoffice add foreign key(movie_id) REFERENCES movies(id); -- так лучше не делать 
alter table boxoffice add constraint FK_Movies_BOXoffice foreign key(movie_id) REFERENCES movies(id); -- надо так
drop table boxoffice;
-- 19. Заполните таблицу boxoffice

insert into boxoffice(movie_id, rating, domestic_sales, internation_sales) values
	(5, 8.2, 380843261, 555900000), (14, 7.4, 268492764, 475066843), (8, 8, 206445654,
	417277164), (12, 6.4, 191452396, 368400000), (3, 7.9, 245852179, 239163000), (6, 8,
	261441092, 370001000), (9, 8.5, 223808164, 297503696), (11, 8.4, 415004880, 648167031), (1,
	8.3, 191796233, 170162503), (7, 7.2, 244082982, 217900167), (10, 8.3, 293004164, 438338580),
	(4, 8.1, 289916256, 272900000), (2, 7.2, 162798565, 200600000), (13, 7.2, 237283207,
	301700000);
select * from boxoffice;

delete from movies where id = 1;


-- 20.Найдите domestic and international sales для каждого фильма 

Select title, domestic_sales, internation_sales from movies 
	inner join boxoffice 
    on boxoffice.movie_id = movies.id;
    
Select title, domestic_sales, internation_sales from movies 
	full join boxoffice ;

-- 21. Покажите цифры продаж для каждого фильма, где international sales больше чем
-- на domestic sales

Select title, domestic_sales, internation_sales from movies 
	inner join boxoffice 
    on boxoffice.movie_id = movies.id
    where internation_sales > domestic_sales;

-- 22. Отобразите список всех фильмов по рейтингу в порядке убывания

Select title, rating from movies 
	inner join boxoffice 
    on boxoffice.movie_id = movies.id
    order by rating DESC;
    
-- 23. Перечислите все фильмы и их совокупные продажи

Select title, boxoffice.domestic_sales + boxoffice.internation_sales as Сумма from movies
	join boxoffice
    on boxoffice.movie_id = movies.id
	order by domestic_sales + internation_sales DESC;
    
-- 24.Отобразите список всех фильмов и их рейтинги в процентах

Select title, round(rating*10, 0) as рэйтинг from movies
	join boxoffice 
    on boxoffice.movie_id = movies.id;
    
--     25. Перечислите все фильмы, выпущенные в четные годы
-- 26. Посчитайте количество фильмов выпущенных одним режиссером и выведите
-- только те, количество которых четное
-- 27. Выведите название фильма, режиссера, сумму domestic and international sales, где
-- режиссер поставил только 1 фильм

select title, year from movies
where year % 2 = 0;

Select director, COUNT(title) from movies
	group by director
    having Count(title) % 2 = 0
    order by director;

Select count(title), director, SUM(boxoffice.domestic_sales), SUM(boxoffice.internation_sales) from movies 
	inner join boxoffice
    on boxoffice.movie_id = movies.id
    group by director
    having count(title) = 1;




