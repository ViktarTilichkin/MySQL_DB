use universityDB;

Select university.title, ROUND(AVG(students.age),1) from students
	join university
	on university.id=students.university_id
    group by title;
    