USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE DeleteTeachers

GO

CREATE PROCEDURE DeleteTeachers
@id_teacher tinyint,
@is_cascade_delete bit,
@error nvarchar(128) output
AS
BEGIN
	IF @is_cascade_delete = 1 BEGIN
		DELETE FROM RECORD_BOOK WHERE id_teacher = @id_teacher
		DELETE FROM SUBJECTS WHERE id = @id_teacher
		SET @error = NULL
	END
	ELSE BEGIN
		DECLARE @occurence tinyint
		SET @occurence = (SELECT occurence=COUNT(*) FROM RECORD_BOOK WHERE id_teacher = @id_teacher)

		IF (@occurence = 0) BEGIN
			DELETE FROM SUBJECTS WHERE id = @id_teacher
			SET @error = NULL
		END
		ELSE BEGIN
			SET @error = 'Count of occurences in record book: ' + STR(@occurence)
		END

		SELECT @error
	END
END

GO

-- Remove check --
DECLARE @id_teacher tinyint
DECLARE @error nvarchar(128)
SET @id_teacher = 0

EXEC DeleteTeachers @id_teacher, 0, @error output

SELECT @error

--SELECT * FROM STUDENTS