USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE DeleteDataBase

GO

CREATE PROCEDURE DeleteDataBase
AS
BEGIN
	DROP TABLE RECORD_BOOK
	DROP TABLE MARKS
	DROP TABLE STUDENTS
	DROP TABLE TEACHERS
	DROP TABLE SUBJECTS
END

GO

-- Remove check --
EXEC DeleteDataBase