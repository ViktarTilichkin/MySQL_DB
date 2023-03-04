CREATE DATABASE IF NOT EXISTS Library;

use Library;

create table test(
	id int auto_increment,
    Title varchar(100) not null,
    Author varchar(50) not null,
    Price decimal(8,2) not null,
    primary key(id)
    );

alter table test rename book;

alter table book add Amount INT not null;

insert into book(title, author, price, Amount) values 
('Мастер и Маргарита', 'Булгаков М. А.', 67.99, 3), ('Белая гвардия', 'Булгаков М. А.',
54.50, 5), ('Идиот', 'Достоевский Ф. М.', 46.00, 10), ('Братья Карамазовы', 'Достоевский
Ф. М.', 79.99, 2), ('Стихотворения и поэмы', 'Есенин С. А.', 65.99, 15);

Select * from book;

truncate table book;

insert into book(title, author, price, Amount) values 
('Мастер и Маргарита', 'Булгаков М. А.', 67.99, 3), ('Белая гвардия', 'Булгаков М. А.',
54.50, 5), ('Идиот', 'Достоевский Ф. М.', 46.00, 10), ('Братья Карамазовы', 'Достоевский
Ф. М.', 79.99, 2), ('Стихотворения и поэмы', 'Есенин С. А.', 65.99, 15);

Select title from book;

Select author as 'автор', title as 'книги', price as 'цена' from book;

Select  title as 'Название', author as 'Автор' from book;

Select  COUNT(*) from book;

Select Count(*) as 'count',
		Min(Price) as 'Min price',
        Max(Price) as 'Max price'
from Book;

select * from book order by Id desc Limit 1;

select * from book where price between 40 and 60 order by price Limit 3;

select * from book where (price between 60 and 70) and author Like 'Булгаков%';

Select author as 'автор', title as 'книги', price as 'цена' from book where Amount < 10;

Select author as 'автор', title as 'книги' from book where Amount between 2 and 14 order by author desc, title asc;

Select Author, Title, (Amount*1.65) as 'pack' from Book;

Select * from book where title like 'М%';
Select * from book where author like 'Булгаков%' and  title like 'М%' order by title asc;
Select * from book where price between 40 and 50;
Select * from book where price in (65.99,79.99, 2,5,46.0);