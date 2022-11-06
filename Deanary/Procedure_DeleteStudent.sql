USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE DeleteStudent

GO

CREATE PROCEDURE DeleteStudent
@id_student tinyint,
@is_cascade_delete bit,
@error nvarchar(128) output
AS
BEGIN
	IF @is_cascade_delete = 1 BEGIN
		DELETE FROM RECORD_BOOK WHERE id_student = @id_student
		DELETE FROM STUDENTS WHERE id = @id_student
		SET @error = 'Successfull'
	END
	ELSE BEGIN
		DECLARE @occurence tinyint
		SET @occurence = (SELECT occurence=COUNT(*) FROM RECORD_BOOK WHERE id = @id_student)

		IF (@occurence = 0) BEGIN
			DELETE FROM STUDENTS WHERE id = @id_student
			SET @error = 'Successfull'
		END
		ELSE BEGIN
			SET @error = 'Count of occurences in record book: ' + STR(@occurence)
		END

		SELECT @error
	END
END

GO

-- Remove check --
DECLARE @id_student tinyint
DECLARE @error nvarchar(128)
SET @id_student = 0

EXEC DeleteStudent @id_student, 0, @error

SELECT @error

--SELECT * FROM STUDENTS