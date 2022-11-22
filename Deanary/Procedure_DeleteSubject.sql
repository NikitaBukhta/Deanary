USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE DeleteSubject

GO

CREATE PROCEDURE DeleteSubject
@id_subject tinyint,
@is_cascade_delete bit,
@error nvarchar(128) output
AS
BEGIN
	IF @is_cascade_delete = 1 BEGIN
		DELETE FROM RECORD_BOOK WHERE id_subject = @id_subject
		DELETE FROM SUBJECTS WHERE id = @id_subject
		SET @error = NULL
	END
	ELSE BEGIN
		DECLARE @occurence tinyint
		SET @occurence = (SELECT occurence=COUNT(*) FROM RECORD_BOOK WHERE id_subject = @id_subject)

		IF (@occurence = 0) BEGIN
			DELETE FROM SUBJECTS WHERE id = @id_subject
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
DECLARE @id_subject tinyint
DECLARE @error nvarchar(128)
SET @id_subject = 1

EXEC DeleteSubject @id_subject, 0, @error output

SELECT @error

--SELECT * FROM STUDENTS