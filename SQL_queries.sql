CREATE DATABASE HR_project;

CREATE TABLE hr_data ( Employee_ID INT,
                         Department VARCHAR(50),
                         Gender VARCHAR(50),
                         Age INT,
                         Educational_Level VARCHAR(50),
                         Job_Role VARCHAR(50),
                         Monthly_Income DECIMAL(7, 1),
                         Years_At_Company INT,
                         Years_In_Current_Role INT,
                         Job_Satisfaction INT,
                         Performance_Rating INT,
                         Work_Life_Balance INT, 
                         Training_Hours_Last_Year INT,
                         Last_Promotion_Years_Ago INT,
                         Distance_From_Home INT,
                         Overtime VARCHAR (5),
                         Attrition VARCHAR (5),
                         Marital_Status VARCHAR (50),
                         Number_Of_Companies_Worked INT,
                         Stock_Option_Level INT
                             
);

SELECT *
FROM hr_data;

-- How many employees are in each department, broken down down by job role --

SELECT Department,
       Job_Role,
       COUNT(*) AS Total_Employee
FROM hr_data
GROUP BY Department, Job_Role
ORDER BY Department, Total_Employee DESC;

-- HOW MANY EMPLOYEES ARE AGE => 59 --
SELECT Department, 
	 COUNT(*) AS Employees_Aged_59_AND_Above
FROM hr_data
WHERE Age >= 59
GROUP BY Department
ORDER BY Employees_Aged_59_And_Above DESC;

-- Compare Statifaction and Performance_Rating --

SELECT Performance_Rating,
	Job_Satisfaction, 
    COUNT(*) Emplomyee_Count
FROM hr_data
GROUP BY Performance_Rating, Job_Satisfaction
ORDER BY Performance_Rating DESC, Job_Satisfaction DESC;

-- Which departments have the highest overtime percentage --
SELECT Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) AS Overtime_Employees,
    ROUND( 100.0 * SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2 ) AS Overtime_Percentage
FROM hr_data
GROUP BY Department
ORDER BY Overtime_Percentage DESC;

-- Which departments have the highest employee attrition rates ---
SELECT Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND (100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) , 2) AS Attrition_Rate
FROM hr_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;

SELECT
    Department,
    COUNT(*) AS Active_Employees
FROM hr_data
WHERE Attrition = 'No'
GROUP BY Department
ORDER BY Active_Employees DESC;

-- Attrition by job role and job satisfaction rating ---
SELECT Job_Role,
	 Job_Satisfaction,
     COUNT(*) AS Employees_Left
FROM hr_data
WHERE Attrition = 'YES'
GROUP BY Job_Role, Job_Satisfaction
ORDER BY Job_Role, Job_Satisfaction;

-- How does average monthly income differ across job roles --
SELECT Job_Role, 
       COUNT(*) AS Employee_Count,
       AVG(Monthly_Income) AS Average_Monthly_Income
FROM hr_data
GROUP BY Job_Role
ORDER BY Average_Monthly_Income;

