USE windowFunction;
GO

/* Drop procedures if they exist*/

IF OBJECT_ID('retrive_data', 'P') IS NOT NULL
    DROP PROCEDURE retrive_data;
GO

IF OBJECT_ID('check_emp_salary', 'P') IS NOT NULL
    DROP PROCEDURE check_emp_salary;
GO

/* retrive_data */
CREATE PROCEDURE retrive_data
    @employee_id INT
AS
BEGIN
    SELECT *
    FROM employees
    WHERE emp_id = @employee_id OR emp_id <= @employee_id;
END;
GO

-- Test retrive_data
EXEC retrive_data @employee_id = 104;
EXEC retrive_data @employee_id = 101;
GO


UPDATE employees SET salary = 100000 WHERE emp_id = 100;
UPDATE employees SET salary = 200000 WHERE emp_id = 101;
UPDATE employees SET salary = 300000 WHERE emp_id = 102;
UPDATE employees SET salary = 400000 WHERE emp_id = 103;
UPDATE employees SET salary = 500000 WHERE emp_id = 104;
GO

/* check_emp_salary*/

CREATE PROCEDURE check_emp_salary
    @id INT
AS
BEGIN
    DECLARE @salary INT;

    SELECT @salary = salary
    FROM employees
    WHERE emp_id = @id;

    IF @salary >= 400000
        PRINT 'High salary employee';
    ELSE IF @salary >= 200000
        PRINT 'Medium salary employee';
    ELSE
        PRINT 'Low salary employee';
END;
GO

-- Check Emp salary
EXEC check_emp_salary @id = 100;
EXEC check_emp_salary @id = 101;
EXEC check_emp_salary @id = 104;
----------------------------------------------


USE windowFunction;
GO

-- Drop old procedure if exists
IF OBJECT_ID('check_emp_salary_exception', 'P') IS NOT NULL
    DROP PROCEDURE check_emp_salary_exception;
GO

-- Create procedure with exception handling
CREATE PROCEDURE check_emp_salary_exception
    @id INT
AS
BEGIN
    BEGIN TRY
        DECLARE @salary CHAR;

        SELECT @salary = salary
        FROM employees
        WHERE emp_id = @id;

        

        IF @salary >= 400000
            PRINT 'High salary employee';
        ELSE IF @salary >= 200000
            PRINT 'Medium salary employee';
        ELSE
            PRINT 'Low salary employee';
    END TRY
    BEGIN CATCH
        PRINT CONCAT('Error message: ', ERROR_MESSAGE());
    END CATCH
END;
GO

-- Test the procedure
EXEC check_emp_salary_exception @id = 1;  -- existing employee
EXEC check_emp_salary_exception @id = 999;  -- non-existing employee

