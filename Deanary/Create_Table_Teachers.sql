USE DEANARYdb

GO

CREATE TABLE TEACHERS(
	id int NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	firstName nvarchar(64) NOT NULL,
	lastName nvarchar(64) NOT NULL,
	middleName nvarchar(64) NULL,
	grade nvarchar(32) NULL
);

GO

SELECT * FROM TEACHERS