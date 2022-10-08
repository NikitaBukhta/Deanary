USE DEANARYdb

GO

DROP TABLE TEACHERS

GO

CREATE TABLE TEACHERS(
	id int NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	identification_code nvarchar(9) NOT NULL UNIQUE,
	firstName nvarchar(64) NOT NULL,
	lastName nvarchar(64) NOT NULL,
	middleName nvarchar(64),
	grade nvarchar(32)
);