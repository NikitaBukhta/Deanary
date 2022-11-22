USE DEANARYdb

GO
-- Remove procedure if exists --
-- That was made for updating procedure --
DROP PROCEDURE AddTeacher

GO

CREATE PROCEDURE AddTeacher
@identification_code nvarchar(9),
@firstName nvarchar(64),
@lastName nvarchar(128),
@middleName nvarchar(64),
@grade nvarchar(32),
@error nvarchar(128) output
AS
BEGIN
	BEGIN TRY
		INSERT TEACHERS VALUES
			(@identification_code, @firstName, @lastName, @middleName, @grade)

		SET @error = NULL
	END TRY
	BEGIN CATCH
		SET @error = 'Teacher with identification code ' + STR(@identification_code) + ' is exists!'
	END CATCH
END

GO

DECLARE @error nvarchar(128)
SET @error = NULL

EXEC AddTeacher '543521342', 'Petro', 'Dubov', 'Denisovich', '', @error output

IF @error IS NULL
	SELECT * FROM TEACHERS
ELSE
	SELECT @error