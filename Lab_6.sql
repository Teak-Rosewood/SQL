-- Question 6.1
SELECT NAME, 
       UPPER(NAME) AS UPPER_NAME, 
       LOWER(NAME) AS LOWER_NAME, 
       INITCAP(NAME) AS INITCAP_NAME 
FROM EMP;

-- Question 6.2

SELECT NAME || ' Works as ' || DESIGNATION
FROM EMP;

-- Question 6.3

SELECT LPAD(SALARY, 10, '*') AS SALARY_PADDED
FROM EMP;

-- Question 6.4

SELECT RPAD(SALARY, 10, '*')
FROM EMP;

-- Question 6.5

SELECT NAME, LENGTH(NAME)
FROM EMP;

-- Question 6.6

SELECT NAME, SUBSTR(EMAIL, 3, 7)
FROM EMP;

-- Question 6.7

SELECT NAME, REPLACE(EMAIL, 'digisol', 'digitech')
FROM EMP;

-- Question 6.8

SELECT e.NAME || '-' || d.DEP_NAME
FROM EMP e
INNER JOIN FAMILY_DEPENDENTs d
ON e.empcode = d.EMPNO;

-- Question 6.9

SELECT CLIENTID, LENGTH(CLIENTID)
FROM CLIENT;

-- Question 6.10

SELECT RTRIM(CLIENTID) AS "Trimmed_ClientID", LENGTH(RTRIM(CLIENTID))
FROM CLIENT;

-- Question 6.11

SELECT LTRIM(CLIENTID) AS "Left_Trimmed_ClientID", LENGTH(LTRIM(CLIENTID))
FROM CLIENT
SELECT TRIM(CLIENTID) AS "Trimmed_ClientID", LENGTH(TRIM(CLIENTID))
FROM CLIENT;

-- Question 6.12

SELECT ASCII('A') AS "ASCII_Value", CHR(65) AS "Corresponding_Character"
FROM DUAL;

-- Question 6.13

SELECT TRUNC(123.456, 2)
FROM DUAL;

-- Question 6.14

SELECT SQRT(9) AS "Square_Root", POWER(9,2) AS "Square", POWER(9,5) AS "5th_Power"
FROM DUAL;

-- Question 6.15

SELECT ROUND(123.456, 2)
FROM DUAL;

-- Question 6.16

SELECT ABS(-123) AS "Absolute_Value", MOD(123,10) AS "Remainder"
FROM DUAL;

-- Question 6.17

SELECT FLOOR(234.36), CEIL(-234.26)
FROM DUAL;

-- Question 6.18

SELECT TO_CHAR(START_DATE, 'DD-Month-YYYY') AS "Start_Date", TO_CHAR(END_DATE, 'DD-Month-YYYY') AS "End_Date"
FROM PRJ_DETAILS;

-- Question 6.19

SELECT TO_CHAR(END_DATE, 'Month-YYYY') AS "Month_Year"
FROM PRJ_DETAILS;

-- Question 6.20

SELECT TO_CHAR(START_DATE, 'Month') AS "Month", TO_CHAR(START_DATE, 'DD') AS "Day", TO_CHAR(START_DATE, 'YYYY') AS "Year"
FROM PRJ_DETAILS;\

-- Question 6.21

SELECT PRJ_NAME, MONTHS_BETWEEN(END_DATE, START_DATE)
FROM PRJ_DETAILS;

-- Question 6.22

SELECT Prj_Name, End_Date, ADD_MONTHS(end_Date, 2)
FROM Prj_Details;

-- Question 6.23

SELECT NEXT_DAY(SYSDATE, 'THURSDAY')
FROM DUAL; 
