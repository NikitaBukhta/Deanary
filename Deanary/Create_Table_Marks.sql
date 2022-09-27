USE DEANARYdb

GO

CREATE TABLE MARKS(
	id int NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	grade nvarchar(16),
	min_mark_number int NOT NULL,
	max_mark_number int NOT NULL,
	differentiated bit
);

GO

SELECT * FROM MARKS;