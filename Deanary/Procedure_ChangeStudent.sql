USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE ChangeStudent

GO

CREATE PROCEDURE ChangeStudent
@changed_student_id int,
@creditBookNumber int,
@firstName nvarchar(64),
@lastName nvarchar(128),
@middleName nvarchar(64),
@birthdate date,
@entryYear smallint,
@faculty nvarchar(64),
@error nvarchar(128) output
AS
BEGIN
	BEGIN TRY
		
		IF (SELECT COUNT(*) FROM STUDENTS WHERE id = @changed_student_id) = 0
			THROW 1, '', 1
		ELSE
			UPDATE STUDENTS SET creditBookNumber = @creditBookNumber,
				firstName = @firstName, lastName = @lastName, middleName = @middleName,
				birthday = @birthdate, entryYear = @entryYear, faculty = @faculty
			WHERE id = @changed_student_id
			SET @error = NULL
	END TRY
	BEGIN CATCH
		SET @error = 'Student with ID ' + STR(@changed_student_id) + ' is not exists!'
	END CATCH
END

GO

-- Remove check --
DECLARE @id_student tinyint
DECLARE @error nvarchar(128)
SET @id_student = 2

EXEC ChangeStudent 100, 20, 'Petro', 'Dubov', 'Denisovich', '09.03.2003', 2022, 'Software Engineer', @error output

IF @error IS NULL
	SELECT * FROM STUDENTS
ELSE
	SELECT @error