CREATE DATABASE IF NOT EXISTS studies;

use studies;

create table Car(
	Code int,
    `Name` varchar(20) not null,
    Color varchar(20) ,
	DateCreate DateTime, 
	`Type` varchar(20), 
	Mileage double  default   0
);

alter table Car add constraint Chek_HEXFormat check(Color like '0x');
alter table Car add constraint Chek_HEXlength check(length(Color) = 8);

