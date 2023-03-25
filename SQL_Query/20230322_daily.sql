create database if not exists cinema_db;

use cinema_db;

create table kinoteatr(
	id int primary key auto_increment not null,
    name varchar(20) not null,
    adress varchar(50) not null,
    count_place int not null
    );

create table film(
	id int primary key auto_increment not null,
    name varchar(20) not null
	);

create table seans(
	id int primary key auto_increment not null,
    id_kinateatr int not null,
    id_film int not null,
    cost int not null
    );

alter table seans add constraint FK_id_kinateatr foreign key (id_kinateatr) references kinoteatr(id);
alter table seans add constraint FK_id_film foreign key (id_film) references film(id);

insert into kinoteatr(name, adress, count_place) values('орбита', 'пушкина', 50), ('мир', 'козлова', 20),
('дом кино', ' талбухина', 90);

insert into film(name) values('шазам 2'),('звуздные войны'),('чужой'),('не чужой'),('не звёздные');

insert into seans(id_kinateatr, id_film, cost) values
(1,1,3),
(1,2,6),
(1,3,7),
(1,4,2),
(1,5,5);
insert into seans(id_kinateatr, id_film, cost) values
(2,1,4),
(2,2,10),
(2,3,1),
(2,4,12),
(2,5,44);
insert into seans(id_kinateatr, id_film, cost) values
(3,1,31),
(3,2,15),
(3,3,17),
(3,4,22),
(3,5,41);

Select f.*, k.*, s.cost from seans s
	inner join kinoteatr k
    on k.id = s.id_kinateatr
    inner join film f
    on f.id = s.id_film;

Select f.name,  SUM(s.cost*k.count_place) from seans s
	inner join kinoteatr k
    on k.id = s.id_kinateatr
    inner join film f
    on f.id = s.id_film
    group by f.id;
    
Select f.name,  SUM(s.cost*s.seats_sold) as Продано,SUM(s.cost*k.count_place) as Могли_заработать,
SUM(s.cost*k.count_place)- SUM(s.cost*s.seats_sold) as разница  from seans s
	inner join kinoteatr k
    on k.id = s.id_kinateatr
    inner join film f
    on f.id = s.id_film
    group by f.id;
    
Select f.name,  SUM(s.cost*s.seats_sold) as Продано,SUM(s.cost*k.count_place) as Могли_заработать,
SUM(s.cost*k.count_place)- SUM(s.cost*s.seats_sold) as разница  from seans s
	inner join kinoteatr k
    on k.id = s.id_kinateatr
    inner join film f
    on f.id = s.id_film
    group by f.id
    having SUM(s.cost*s.seats_sold) > 1400;
    
    
    
alter table seans add seats_sold int not null;

update seans set seats_sold = 18 - id
where id_kinateatr = 2;
update seans set seats_sold = 39 - id
where id_kinateatr = 1;
update seans set seats_sold = 66 - id
where id_kinateatr = 3;