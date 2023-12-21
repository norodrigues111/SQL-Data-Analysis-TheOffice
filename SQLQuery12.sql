-------------------------------- CREATE TABLE -----------------------------------

CREATE TABLE EmployeeDemographics
(EmployeeId int, 
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeId int,
JobTitle varchar(50),
Salary int)


Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

-------------------------------- INSERT INTO TABLES VALUES-----------------------------------

INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male')

INSERT INTO EmployeeDemographics VALUES
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

INSERT INTO EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(1010,NULL,47000),
(NULL,'Salesman', 43000)


-------------------------------- SELECT AND FROM CLAUSES -----------------------------------

SELECT TOP 5 *
FROM EmployeeDemographics

SELECT *
FROM EmployeeDemographics

SELECT DISTINCT (Gender)
FROM EmployeeDemographics

-------------------------------- | COUNT | DISTINCT | MAX,MIN,AVG -----------------------------------

SELECT COUNT (LastName) AS LastNameCount
FROM EmployeeDemographics

SELECT MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary, AVG(Salary) AS AvgSalary
FROM EmployeeSalary

 To see the table from different database vision
SELECT MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary, AVG(Salary) AS AvgSalary
FROM SQLTutorial.dbo.EmployeeSalary


--------------------------------  WHERE CLAUSE AND | OR | LIKE | % | Null | Not Null | In -----------------------------------

SELECT *
FROM EmployeeDemographics
WHERE Age >= 30

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%' 

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%' 

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%ott%' -

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%ott%c%' 

SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim' OR FirstName = 'Michael'

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim','Michael')

-------------------------------- GROUP BY | ORDER BY -----------------------------------

SELECT Gender, COUNT(Gender) as GenderCount
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, Age, COUNT(Gender) as GenderCount  
FROM EmployeeDemographics
GROUP BY Gender, Age  

SELECT Gender, COUNT(Gender) as GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount

SELECT Gender, COUNT(Gender) as GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age 

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC

-------------------------------- JOINS | INNER | LEFT | RIGHT | FULL| OUTER -----------------------------------

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.EmployeeSalary

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary --Everthing that overlaps in both tables
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary 
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary 
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId

-- Find out who has the highest salary after Michael
SELECT EmployeeDemographics.EmployeeId, FirstName, LastName, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC


-- Find out the average salesman salary
SELECT Jobtitle, Avg(Salary) as AvgSalaryByJobTitle
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId
WHERE Jobtitle = 'Salesman'
GROUP BY Jobtitle

-------------------------------- JOINS VS UNION -----------------------------------
 JOIN PUT INFO TOGETHER BY ID
 UNION PUT ALL TOGETHER DOES NOT MATTER IF THEY HAVE SAME COLUMNS IF THE TYPE IS THE SAME IT WILL DO THE UNION

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeId = WareHouseEmployeeDemographics.EmployeeId


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeId

-------------------------------- CASE STATEMENT -----------------------------------

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT FirstName, LastName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age >30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age >30 THEN 'Old'
	WHEN Age = 38 THEN 'Oldest'   -- Age 38 Staley still as Old because the Old condition was met frist. the order matters.
	ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Jobtitle, Salary,
CASE
	WHEN Jobtitle = 'Salesman' THEN Salary + (Salary * 0.10)
	WHEN Jobtitle = 'Accountant' THEN Salary + (Salary * 0.05)
	WHEN Jobtitle = 'HR' THEN Salary + (Salary * 0.000001)
	ELSE Salary + (Salary * 0.03)
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId

	-------------------------------- HAVING CLAUSE -----------------------------------

SELECT Jobtitle, COUNT(Jobtitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId
GROUP BY Jobtitle

SELECT Jobtitle, COUNT(Jobtitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId
GROUP BY Jobtitle
HAVING COUNT(Jobtitle) > 1 -- Aggregated information needs to be filtered using having not where

SELECT Jobtitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeId = EmployeeSalary.EmployeeId
GROUP BY Jobtitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

-------------------------------- UPDATE VS INSERT INTO | DELETING -----------------------------------
INSERT INTO WILL ADD VALUES
UPDATE WILL ALTER A PRE EXISTING ROW
DELETE WILL REMOVE ROWS

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeId = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE EmployeeId = 1012

DELETE FROM SQLTutorial.dbo.EmployeeDemographics  -- BE CAREFULL! This line will delete all table

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics  -- SAFER to use select to visualize what will be deleted first
WHERE EmployeeId = 1005

DELETE SQLTutorial.dbo.EmployeeDemographics 
WHERE EmployeeId = 1005

-------------------------------- ALIASING -----------------------------------
SELECT FirstName AS Fname
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT FirstName + ' ' + LastName AS FullName
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT FirstName + ' ' + LastName AS FullName
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT AVG(Age) AS AverageAge
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT Demo.EmployeeId, Sal.Salary
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeId = Sal.EmployeeId

SELECT a.EmployeeId, a.FirstName, a.LastName, b.Jobtitle, a.Age
FROM SQLTutorial.dbo.EmployeeDemographics a
LEFT JOIN SQLTutorial.dbo.EmployeeSalary b
	ON a.EmployeeId = b.EmployeeId
LEFT JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics c
	ON a.EmployeeId = c.EmployeeId

-------------------------------- PARTITION BY -----------------------------------
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.EmployeeSalary 

SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM SQLTutorial.dbo.EmployeeDemographics dem
JOIN SQLTutorial.dbo.EmployeeSalary sal
	ON dem.EmployeeId = sal.EmployeeId

SELECT Gender, COUNT(Gender) 
FROM SQLTutorial.dbo.EmployeeDemographics dem
JOIN SQLTutorial.dbo.EmployeeSalary sal
	ON dem.EmployeeId = sal.EmployeeId
GROUP BY Gender

--------- CTE: COMMON TABLE EXPRESSION | WITH QUERY ---------------------

 WITH CTE_Employee AS (
SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM SQLTutorial.dbo.EmployeeDemographics emp
JOIN SQLTutorial.dbo.EmployeeSalary sal
	ON emp.EmployeeId = sal.EmployeeId
WHERE Salary > '45000'
)

SELECT *
FROM CTE_Employee

------------------------ TEMP TABLE ----------------------------

CAN BE USED MULTIPLE TIMES, DIFFERENT OF CTE OR SUBQUERIES

CREATE TABLE #temp_Employee(
EmployeeId int,
JobTitle varchar(100),
Salary int)

INSERT INTO #temp_Employee VALUES(
'1001', 'HR', '45000')

INSERT INTO #temp_Employee 
SELECT *
FROM SQLTutorial.dbo.EmployeeSalary

SELECT *
FROM #temp_Employee

DROP TABLE IF EXISTS #Temp_Employee2 -- iT's not save on the databse but it is sabe somewhere. so it is important to drop in case you run more tha once. 
CREATE TABLE #Temp_Employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), Avg(Age), AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics emp
JOIN   SQLTutorial.dbo.EmployeeSalary sal
	ON emp.EmployeeId = sal.EmployeeId
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2

------------------------ STRING FUNCTIONS + USE CASES ----------------------------

 String Functions: TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower --

Drop Table EmployeeErrors;

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

----------------- String Functions: TRIM, LTRIM, RTRIM ---------------------------

SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

---------------- String Functions: Replace----------------------------

SELECT LastName, REPLACE(LastName, '- Fired','') AS LastNameFixed
FROM EmployeeErrors

---------------- String Functions: Substring ----------------------

SELECT SUBSTRING(FirstName,1,3)
FROM EmployeeErrors

SELECT SUBSTRING(FirstName,3,3)
FROM EmployeeErrors

SELECT err.FirstName, dem.FirstName
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	ON err.FirstName = dem.FirstName

--TIP: USEFULL FOR MATCHING PEOPLE CROSS TABLE USING GENDER, AGE, DOB AND GENDER
SELECT err.FirstName, dem.FirstName, SUBSTRING(err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

---------------- String Functions: UPPER, Lower ----------------------

SELECT FirstName, LOWER(FirstName), UPPER(FirstName)
FROM EmployeeErrors

--------------------------- STORE PROCEDURES ----------------------------

group of procedures stored on the database and can used by several users. 

CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
CREATE TABLE #temp_employee(
JobTitle varchar(100),
EmployeePerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeId = sal.EmployeeId
GROUP BY JobTitle

SELECT * 
FROM #temp_employee

EXEC Temp_Employee @JobTitle = 'Salesman'

--------------------------- SUBQUERY ----------------------------

SELECT *
FROM EmployeeSalary

-- Subquery in Select

SELECT EmployeeId, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

-- How to do it with Partition By

SELECT EmployeeId, Salary, AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary

-- Why Group By doesn't work

SELECT EmployeeId, Salary, AVG(Salary) AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeId, Salary
ORDER BY 1,2

-- Subquery in From

SELECT a.EmployeeID, AllAvgSalary
FROM 
	(SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
	 FROM EmployeeSalary) a
ORDER BY a.EmployeeID

-- Subquery in Where

SELECT EmployeeId, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeId IN (
		SELECT EmployeeId
		FROM EmployeeDemographics
		WHERE Age > 30)
	
