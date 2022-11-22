USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE AddStudent

GO

CREATE PROCEDURE AddStudent
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
		INSERT STUDENTS VALUES
			(@creditBookNumber, @firstName, @lastName, @middleName, @birthdate, @entryYear, @faculty)

		SET @error = NULL
	END TRY
	BEGIN CATCH
		SET @error = 'Student with creditBookNumber ' + STR(@creditBookNumber) + ' is exists!'
	END CATCH
END

GO

DECLARE @error nvarchar(128)
SET @error = NULL

EXEC AddStudent 19, 'Petro', 'Dubov', 'Denisovich', '09.03.2003', 2022, 'Software Engineer', @error output

IF @error IS NULL
	SELECT * FROM STUDENTS
ELSE
	SELECT @error