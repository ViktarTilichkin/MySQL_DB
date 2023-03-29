CREATE DATABASE IF NOT EXISTS Market;
use Market;

create table Orders(
	id int auto_increment,
    user_id int not null,
    prod_id int not null,
    Count int not null,
    Adress varchar(50) not null,
    DateDelivery date ,
    Status varchar(50) not null default 'New',
    primary key(id),
    foreign key(user_id) references user(id),
    foreign key(prod_id) references products(id)
	);
    
create table products(
	id int auto_increment,
    Name varchar(255) not null,
    Atribut varchar(255) not null,
    Catg_id int not null,
    Price int not null,
    Count int not null,
    primary key(id),
    foreign key(Catg_id) references categories(id)
	);
    
create table User(
	id int auto_increment,
    Name varchar(50) not null,
    Login varchar(255) not null,
    Password varchar(255) not null,
    DateRegistr datetime default NOW(),
    LastLogin datetime default NOW(),
    primary key(id)
    );
    
create table catalog(
	id int auto_increment,
    User_id int not null,
    Prod_id int not null,
    primary key(id),
    foreign key(User_id) references User(id),
    foreign key(Prod_id) references products(id)
	);
    
create table categories(
	id int auto_increment,
    Categoria varchar(50) not null,
    primary key(id)
	);
    
insert into categories(Categoria) values('Еда'),('Спорт'),('Техника'),('инструмент');

insert into user(Name, Loguserin, Password) values('Ян','jan@mail.ru','pass1'),('Си','si@mail.ru','pass2'),('Володя','volody@mail.ru','pass3'),('Саша','san9@mail.ru','pass4');

insert into products(Name, Atribut, Catg_id, price, Count) values('Молоко','жирность 3.6 %',1,100,20),('ЧЫПСИКИ','Со вкусом сыра',1,150,50),
('гантеля','5 кг',2,200,10),('гиря','16 кг',2,400,20),
('телевизор','большой',3,1000,10),('кофемашинка',' варит ',3,500,5),
('плоскогубцы','кривые',4,133,20),('молоток',' дурацкий',4,144,20);

insert into catalog(User_id, prod_id) values(1,1),(1,2),(1,3),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4),(4,1),(4,3);


