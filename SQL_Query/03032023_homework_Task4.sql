CREATE DATABASE IF NOT EXISTS STUDIES;

USE STUDIES;

CREATE TABLE Market(
	ID INT auto_increment NOT NULL,
    `Name` VARCHAR(20) NOT NULL,
    Adress VARCHAR(20) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    CountPlace INT,
	TimeFrom DateTime,
    TimeTo DateTime,
    primary key(ID)
    );
alter table Market add constraint Chek_PhoneLength check(Phone like '+375');
alter table Market add constraint Chek_PhoneFormat check(length(Phone) = 13);