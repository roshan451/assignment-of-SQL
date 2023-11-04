CREATE DATABASE HR ;

USE HR ;

CREATE table EMPLOYEES
(
EMP_ID INT PRIMARY KEY ,
EMP_FIRSTNAME VARCHAR(40) ,
EMP_LASTNAME VARCHAR(40) ,
EMP_EMAIL VARCHAR(90) ,
EMP_PHONE INT ,
EMP_GENDER VARCHAR(30) ,
EMP_AGE INT ,
EMP_JOBTITLE VARCHAR(40) ,
EMP_YEARSOFEXP INT ,
EMP_DEPT VARCHAR(30) ,
EMP_HIREDATE DATETIME ,
EMP_ADDRESS VARCHAR(95) ,
EMP_POSTALCODE INT ,
EMP_CITY VARCHAR(20) ,
EMP_COUNTRY VARCHAR(25) ,
EMP_DEPTNO VARCHAR(10)
) ;

CREATE TABLE DEPARTMENT
(
	DEPT_INDEX INT PRIMARY KEY ,
	DEPT_NO INT ,
	EMP_DEPARTMENT VARCHAR(30) ,
	DEPT_ID VARCHAR(25) ,
	EMP_ID_DEPT_INDEX INT , 
    FOREIGN KEY(DEPT_INDEX) REFERENCES EMPLOYEES(EMP_ID)
    ) ;

-- 1.  Display all information in the tables EMP and DEPT. 
SELECT * FROM EMPLOYEES
INNER JOIN DEPARTMENT
ON EMPLOYEES.EMP_ID = EMP_ID_DEPT_IND ;

-- 2.  Display only the hire date and employee name for each employee.
SELECT HIRE_DATE , FIRST_NAME FROM EMPLOYEES ;

/* 3. Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title.*/
SELECT FIRST_NAME , JOB_ID , CONCAT_WS(",  ", FIRST_NAME , JOB_ID) 
AS EMPLOYEE_TITLE FROM EMPLOYEES ;

-- 4. Display the hire date, name and department number for all clerks. 
SELECT HIRE_DATE , FIRST_NAME ,DEPT_NO  FROM EMPLOYEES
INNER JOIN DEPARTMENT 
ON EMPLOYEES.EMP_ID = EMP_ID_DEPT_IND WHERE JOB_TITLE = 'CLERK'; 

/* 5. Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT. */
SELECT * , CONCAT_WS("," ,EMP_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, GENDER, AGE, 
JOB_TITLE, YRS_OF_EXP, SALARY,EMP_DEPT,EMP_DOJ , HIRE_DATE, ADDRESS, POSTAL_CODE, 
CITY, COUNTRY,  COMMISSION) AS THE_OUTPUT FROM EMPLOYEES ; 

-- 6.  Display the names and salaries of all employees with a salary greater than 2000. 
SELECT FIRST_NAME , SALARY FROM EMPLOYEES HAVING SALARY > 2000 ; 

/* 7. Display the names and dates of employees with the column headers "Name" and "Start 
Date". */ 
SELECT FIRST_NAME AS "NAME" , EMP_DOJ AS "START_DATE" FROM EMPLOYEES ;

  -- 8. Display the names and hire dates of all employees in the order they were hired.   
 SELECT FIRST_NAME , HIRE_DATE FROM EMPLOYEES ORDER BY HIRE_DATE ASC ;
 
 -- 9. Display the names and salaries of all employees in reverse salary order .
 SELECT FIRST_NAME , SALARY FROM EMPLOYEES ORDER BY SALARY DESC ; 
 
 /* 10. Display 'ename" and "deptno" who are all earned commission and display salary in 
reverse order. */
SELECT COUNT(EMP_ID) , EMP_DEPT , COMMISSION
FROM EMPLOYEES GROUP BY EMP_DEPT , COMMISSION ;
 
-- 11.  Display the last name and job title of all employees who do not have a manager.
SELECT LAST_NAME , JOB_TITLE FROM EMPLOYEES WHERE JOB_TITLE NOT IN ("HR MANAGER") ;

/* 12.  Display the last name, job, and salary for all employees 
whose job is sales representative or stock clerk and whose salary
 is not equal to $2,500, $3,500, or $5,000. */
 SELECT LAST_NAME , EMP_DEPT , SALARY FROM EMPLOYEES WHERE EMP_DEPT IN ('SALES' OR 'CLERK') 
 AND SALARY NOT IN (2500 , 3500 ,5000) ;
 
 -- ***********************************HR2************************************* --
 
 -- 1.  Display the maximum, minimum and average salary and commission earned. 
 SELECT MAX(SALARY) AS MAXIMUM_SALARY , MIN(SALARY) AS MINIMUN_SALARY , 
 AVG(SALARY) AS AVERAGE_SALARY , MAX(COMMISSION) AS MAXIMUM_COMMISSION , 
 MIN(COMMISSION) AS MINIMUN_COMMISSION , AVG(COMMISSION) AS AVERAGE_COMMISSION
 FROM EMPLOYEES ;
 
 /* 2. Display the department number, total salary payout and total commission payout for 
each department.*/
SELECT EMP_ID ,
SUM(SALARY) ,
SUM(COMMISSION)
FROM EMPLOYEES
GROUP BY EMP_ID ;

