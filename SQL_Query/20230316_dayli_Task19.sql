use universityDB;

insert into students(name, surname, age, university_id, type_id) values
('Ан', 'Петва', 25, 1, 1), ('Дая', 'Планова', 22, 1, 1), ('Никй', 'Никоев', 19, 3, 2),
('Авсгуа', 'Сенткая', 21, 2, 2), ('Есия', 'Грт', 18, 4, 1);
-- st.name, st.surname, st.age, un.title


Select st.name, st.surname, st.age, un.title, Count(un.title) from students st
join university un
on un.id = st.university_id
where st.age >19
group by un.title, st.id;
-- having Count(un.title) = MAX(count(un.title));

-- order by SUM(un.title) desc;
-- limit 1;

select st.* from students st 
join university un on un.id = st.university_id 
 where st.age > 19 and st.university_id  = (select un.id from university un
join students st on  st.university_id = un.id  group by un.id order by count(un.id) desc limit 1 )



-- Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'universitydb.st.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.000 sec
-- Error Code: 1235. This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'	0.000 sec
