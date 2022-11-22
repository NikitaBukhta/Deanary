USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE AddSubject

GO

CREATE PROCEDURE AddSubject
@subject_name nvarchar(32),
@error nvarchar(128) output
AS
BEGIN
	BEGIN TRY
		INSERT SUBJECTS VALUES
			(@subject_name)

		SET @error = NULL
	END TRY
	BEGIN CATCH
		SET @error = 'Subject ' + @subject_name + ' is exists!'
	END CATCH
END

GO

DECLARE @error nvarchar(128)
SET @error = NULL

EXEC AddSubject 'Some cool subject', @error output

IF @error IS NULL
	SELECT * FROM SUBJECTS
ELSE
	SELECT @error