USE DEANARYdb

GO

DROP VIEW RECORD_BOOK_VIEW

GO

CREATE VIEW RECORD_BOOK_VIEW AS
SELECT 
	student.lastName + ' ' + student.firstName + ' ' + student.middleName AS 'student',
	semester,  subjects.name as 'subject', mark, marks.mark_type AS 'grade type',
	teacher.lastName + ' ' + teacher.firstName + ' ' + teacher.middleName AS 'teacher',
	pass_date
FROM
	RECORD_BOOK
INNER JOIN 
	STUDENTS AS student ON id_student = student.id
INNER JOIN
	SUBJECTS AS subjects
		ON id_subject = subjects.id
INNER JOIN
	MARKS as marks
		ON MARKS.differentiated = RECORD_BOOK.differentiated
		AND marks.min_mark_number <= mark
		AND mark <= marks.max_mark_number
INNER JOIN 
	TEACHERS AS teacher
		ON teacher.id = id_teacher

GO

SELECT * FROM RECORD_BOOK_VIEW
ORDER BY
	student,
	semester,
	subject