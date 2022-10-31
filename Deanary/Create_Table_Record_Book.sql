USE DEANARYdb

GO

DROP TABLE RECORD_BOOK

GO

CREATE TABLE RECORD_BOOK(
	id int NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	semester tinyint NOT NULL,
	mark tinyint,	-- the grade could be not set, because the student didn't pass the exam
	id_student int references STUDENTS NOT NULL,
	id_subject tinyint references SUBJECTS NOT NULL,
	id_teacher int references TEACHERS NOT NULL,
	pass_date date NOT NULL,
	differentiated bit
	unique(id_student, id_subject, semester)
);