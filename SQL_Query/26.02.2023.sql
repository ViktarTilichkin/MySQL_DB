create table homework.Table1(
	Car varchar(20),
    Model VARCHAR(20) Not null,
	Engine varchar(20)
    );
    
create table IF NOT EXISTS homework.Table2(
	Cycle varchar(20),
    Name VARCHAR(20) Not null,
	NameRider varchar(20)
    );
    
create table homework.Table3(
	Flower varchar(20),
    Name VARCHAR(20) Not null,
	grade varchar(20)
    );

use homework;
alter table Table1 add DrivingWheels varchar(10) not null;
alter table Table1 modify column Car varchar(10) not null;

rename table Table2 to CycleTable;
rename table Table1 to CarTable;


drop table Table3;