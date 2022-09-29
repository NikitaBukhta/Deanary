USE DEANARYdb

GO

CREATE TABLE RECORD_BOOK(
	id int NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	semester tinyint NOT NULL,
	mark tinyint,
	id_student int NOT NULL,
	id_subject int NOT NULL,
	id_teacher int NOT NULL,
	pass_date date NOT NULL,

);