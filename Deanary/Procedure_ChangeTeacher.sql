USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE ChangeTeacher

GO

CREATE PROCEDURE ChangeTeacher
@changed_teacher_id tinyint,
@identification_code nvarchar(9),
@firstName nvarchar(64),
@lastName nvarchar(128),
@middleName nvarchar(64),
@grade nvarchar(32),
@error nvarchar(128) output
AS
BEGIN
	BEGIN TRY
		
		IF (SELECT COUNT(*) FROM SUBJECTS WHERE id = @changed_teacher_id) = 0
			THROW 1, '', 1
		ELSE
			UPDATE TEACHERS SET identification_code = @identification_code,
				firstName = @firstName, lastName = @lastName, middleName = @middleName,
				grade = @grade
			WHERE id = @changed_teacher_id
			SET @error = NULL
	END TRY
	BEGIN CATCH
		SET @error = 'Teacher with ID ' + STR(@changed_teacher_id) + ' is not exists!'
	END CATCH
END

GO

-- Remove check --
DECLARE @id_student tinyint
DECLARE @error nvarchar(128)
SET @id_student = 2

EXEC ChangeTeacher 100, '235443287', 'Some', 'Good', 'Teacher', '', @error output

IF @error IS NULL
	SELECT * FROM SUBJECTS
ELSE
	SELECT @error