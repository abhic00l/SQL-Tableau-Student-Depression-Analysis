SET SQL_SAFE_UPDATES = 0;

SELECT * FROM depression_student_dataset;
-- Setting Male as 'M'
UPDATE depression_student_dataset
SET Gender = 'M'
WHERE Gender = 'Male';
-- Setting Female as 'F'
UPDATE depression_student_dataset
SET Gender = 'F'
WHERE Gender = 'Female';

SELECT * FROM depression_student_dataset;
-- Checking of any null values
SELECT * FROM depression_student_dataset
WHERE Gender IS NULL;

-- Checking for any empty strings
SELECT * FROM depression_student_dataset
WHERE Gender ='';

-- Adding a new column named 'Age_group'
ALTER TABLE depression_student_dataset
ADD Age_group VARCHAR(50);

-- Adding values to the column 'Age_group'
UPDATE depression_student_dataset
SET Age_group =
	CASE WHEN Age BETWEEN 18 AND 24 THEN 'A1'
    ELSE CASE WHEN Age BETWEEN 25 AND 30 THEN 'A2'
    ELSE 'A3' END END ;
    
-- Viewing how many students lies in each 'Age_group'
SELECT Age_group,COUNT(*) FROM depression_student_dataset
GROUP BY Age_group;

-- Evaluating Each Coumns of the table
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'depression_student_dataset';

SELECT Gender,COUNT(*) FROM depression_student_dataset
GROUP BY Gender;

SELECT `Academic Pressure`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Academic Pressure`;

SELECT `Study Satisfaction`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Study Satisfaction`;

SELECT `Sleep Duration`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Sleep Duration`;

SELECT `Dietary Habits`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Dietary Habits`;

SELECT `Have you ever had suicidal thoughts ?`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Have you ever had suicidal thoughts ?`;

SELECT `Study Hours`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Study Hours`;

SELECT `Financial Stress`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Financial Stress`;

SELECT `Family History of Mental Illness`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Family History of Mental Illness`;

SELECT `Depression`, COUNT(*) 
FROM depression_student_dataset
GROUP BY `Depression`;

-- Adding an Index column
ALTER TABLE depression_student_dataset
ADD Index_column INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

DELIMITER $$

CREATE PROCEDURE SHFH(X INT,Y INT)
BEGIN
    SELECT Depression,`Sleep Duration`
    FROM depression_student_dataset
    WHERE `Study Hours` = X
      AND `Financial Stress` = Y;
END $$

DELIMITER ;

CALL SHFH(0,4);










