USE DEANARYdb

GO

DROP TABLE MARKS

GO

CREATE TABLE MARKS(
	id tinyint NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	mark_type nvarchar(16) NOT NULL UNIQUE,
	min_mark_number tinyint NOT NULL,
	max_mark_number tinyint NOT NULL,
	differentiated bit
);