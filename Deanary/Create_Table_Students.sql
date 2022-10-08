USE DEANARYdb

GO
DROP TABLE STUDENTS

GO

CREATE TABLE STUDENTS(
    id int NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	creditBookNumber int NOT NULL UNIQUE,
    firstName nvarchar(64) NOT NULL,
	lastName nvarchar(64) NOT NULL,
	middleName nvarchar(64),
	birthday date NOT NULL,
	entryYear smallint NOT NULL,
	faculty nvarchar(64) NOT NULL
);