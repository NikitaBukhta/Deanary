USE DEANARYdb

GO

TRUNCATE TABLE RECORD_BOOK

GO

-- Date entry: mm-dd-yyyy;
INSERT INTO RECORD_BOOK VALUES
	(1, 60, 1, 1, 1, '12/31/2021'),
	(2, 80, 1, 2, 2, '05/31/2022'),
	(1, 95, 1, 3, 3, '12/31/2021'),
	(2, 30, 1, 4, 4, '05/31/2022'),
	(1, 54, 1, 1, 5, '12/31/2021'),
	(2, 65, 1, 3, 6, '05/31/2022'),
	(1, 87, 2, 1, 1, '12/31/2021'),
	(2, 68, 2, 2, 2, '05/31/2022'),
	(1, 95, 2, 3, 3, '12/31/2021'),
	(2, 66, 2, 4, 4, '05/31/2022'),
	(1, 94, 2, 1, 5, '12/31/2021'),
	(2, 83, 2, 3, 6, '05/31/2022'),
	(1, 65, 3, 1, 1, '12/31/2021'),
	(2, 23, 3, 2, 2, '05/31/2022'),
	(1, 78, 3, 3, 3, '12/31/2021'),
	(2, 74, 3, 4, 4, '05/31/2022'),
	(1, 79, 3, 1, 5, '12/31/2021'),
	(2, 83, 3, 3, 6, '05/31/2022'),
	(1, 82, 4, 1, 1, '12/31/2021'),
	(2, 12, 4, 2, 2, '05/31/2022'),
	(1, 98, 4, 3, 3, '12/31/2021'),
	(2, 32, 4, 4, 4, '05/31/2022'),
	(1, 76, 4, 1, 5, '12/31/2021'),
	(2, 76, 4, 3, 6, '05/31/2022'),
	(1, 74, 5, 1, 1, '12/31/2021'),
	(2, 99, 5, 2, 2, '05/31/2022'),
	(1, 100, 5, 3, 3, '12/31/2021'),
	(2, 98, 5, 4, 4, '05/31/2022'),
	(1, 24, 5, 1, 5, '12/31/2021'),
	(2, 65, 5, 3, 6, '05/31/2022')

GO

SELECT 
	student.lastName + ' ' + student.firstName + ' ' + student.middleName AS 'student',
	semester,  subjects.name as 'subject', mark, marks.grade AS 'grade type',
	teacher.lastName + ' ' + teacher.firstName + ' ' + teacher.middleName AS 'teacher'
FROM
	RECORD_BOOK
INNER JOIN 
	STUDENTS AS student ON id_student = student.id
INNER JOIN
	SUBJECTS AS subjects
		ON id_subject = subjects.id
INNER JOIN
	MARKS as marks
		ON  marks.min_mark_number <= mark
		and mark <= marks.max_mark_number
INNER JOIN 
	TEACHERS AS teacher 
		ON teacher.id = id_teacher
ORDER BY 
	student.lastName, 
	student.firstName, 
	student.middleName, 
	semester, 
	id_student