USE DEANARYdb

GO

CREATE TABLE MARKS(
	id int NOT NULL IDENTITY (1, 1)	PRIMARY KEY,
	grade ENUM('????????', '?????', '??????????', '??????????') NOT NULL,
	min_mark_number
	max_mark_number
);