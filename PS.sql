select * from salary;
DELIMITER $$

CREATE PROCEDURE AnalyzeSalary (
    IN mode VARCHAR(50),          -- Operation type
    IN param DECIMAL(10,2)        -- Used only for high salary filter
)
BEGIN
    -- Average salary by job title
    IF mode = 'avg_salary' THEN
        SELECT 
            `Job Role`, 
            ROUND(AVG(`Salary (Annual)`), 2) AS Avg_Salary
        FROM Salary
        GROUP BY `Job Role`;

    -- Count of remote employees per industry
    ELSEIF mode = 'remote_count' THEN
        SELECT 
            Industry, 
            COUNT(*) AS Remote_Employees
        FROM Salary
        WHERE `Remote Flexibility` = 'Remote'
        GROUP BY Industry;

    -- High earners above threshold
    ELSEIF mode = 'high_earners' THEN
        SELECT 
            `Employment Type`, 
            `Job Role`, 
            `Salary (Annual)`
        FROM Salary
        WHERE `Salary (Annual)` > param;

    -- Employees using Python
    ELSEIF mode = 'python_users' THEN
        SELECT 
            `Employment Type`, 
            `Job Role`, 
            `Tech Stack`
        FROM Salary
        WHERE `Tech Stack` = 'Python';

    ELSE
        SELECT 'Invalid mode selected' AS Message;
    END IF;
END $$

DELIMITER ;

CALL AnalyzeSalary('avg_salary', 0);
