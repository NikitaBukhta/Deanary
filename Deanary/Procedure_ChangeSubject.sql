USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE ChangeSubject

GO

CREATE PROCEDURE ChangeSubject
@changed_subject_id tinyint,
@subject_name nvarchar(32),
@error nvarchar(128) output
AS
BEGIN
	BEGIN TRY
		
		IF (SELECT COUNT(*) FROM SUBJECTS WHERE id = @changed_subject_id) = 0
			THROW 1, '', 1
		ELSE
			UPDATE SUBJECTS SET name = @subject_name
			WHERE id = @changed_subject_id
			SET @error = NULL
	END TRY
	BEGIN CATCH
		SET @error = 'Subject with ID ' + STR(@changed_subject_id) + ' is not exists!'
	END CATCH
END

GO

-- Remove check --
DECLARE @id_student tinyint
DECLARE @error nvarchar(128)
SET @id_student = 2

EXEC ChangeSubject 5, 'fantastic subject', @error output

IF @error IS NULL
	SELECT * FROM SUBJECTS
ELSE
	SELECT @error