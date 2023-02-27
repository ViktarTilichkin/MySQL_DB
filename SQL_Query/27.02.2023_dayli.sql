CREATE DATABASE IF NOT EXISTS HSCHOOL;

USE HSCHOOL;

CREATE TABLE STUDENTS(
	StudentName varchar(60),
    StudentGroup int
    );
drop table Students;
INSERT INTO STUDENTS (StudentName, StudentGroup) valueS ('viktor',3);

INSERT INTO STUDENTS (StudentName, StudentGroup) valueS ('Dima',2),('Artem',5),('ArtemE',5);
INSERT INTO STUDENTS (StudentName, StudentGroup) valueS ('test',1);

SELECT * FROM students;

SELECT * FROM students where StudentGroup in (3,2, 5);
UPDATE STUDENTS set StudentName = 'Stan' where StudentGroup = 1;

UPDATE STUDENTS set StudentName = concat( 'A', ' ' , StudentName) where StudentGroup > 2;
truncate table Students;