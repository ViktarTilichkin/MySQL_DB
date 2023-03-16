-- use hschool;

-- CREATE TABLE User (
-- Id INT, 
-- FirstName VARCHAR(20),
-- LastName VARCHAR(20),
-- Age INT,
-- Email VARCHAR(20)
-- );

-- rename table account to User закоменчено

alter table User add City VARCHAR(20);

alter table user add Name VARCHAR(20), Drop Column FirstName, Drop Column LastName;
 
Insert INTO User (Id, Age, Email, City, Name) values(1,23, 'test@test.by', 'Minsk', 'Test');
insert INTO User (Id) Values(3);

