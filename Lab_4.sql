-- Question 4.1

select * from CLIENT;

CLI NAME       PHONE          EMAIL
--- ---------- -------------- --------------------
C1  ABC        +48-87489389   aaa@abc.com
C2  LTS        +91-78389397   bbb@its.com
C3  RK         +44-67838934   ccc@rk.com
C4  MMA        +31-77839093   ddd@mma.com
C5  AKS        +81-66822903   eee@aks.com
C6  GKS        +78-75628982   fff@gks.com
C7  B&B        +91-64839839   ggg@bb.com
C8  ABT        +97-67554667
C9  XYZ                       xyz@ab.com

-- Question 4.2

select NAME, PHONE, EMAIL from EMP where DESIGNATION = 'DEVELOPER';

NAME            PHONE EMAIL
---------- ---------- --------------------
RAJESH                rajesh@digisol.com
MANISH                manish@digisol.com

-- Question 4.3

select * from EMP where REPORTS_TO = 106;

EMPCODE NAME       QUALIFI      PHONE EMAIL
---------- ---------- ------- ---------- --------------------
DESIGNATION              SALARY REPORTS_TO
-------------------- ---------- ----------
       110 BHASKAR    MTECH              bhaskar@digisol.com
PROJECT DIRECTOR                       106

       105 MANISH     MCA                manish@digisol.com
DEVELOPER                              106

-- Question 4.4

select EMAIL, NAME from EMP where DESIGNATION = 'TECHNICAL HEAD' and QUALIFICATION = 'BTECH'; 

EMAIL                NAME
-------------------- ----------
ajay@digisol.com     AJAY

-- Question 4.5

select NAME from EMP where SALARY between 100000 and 200000;

no rows selected

-- Question 4.6

select SKILLID, SKILL_EXPERIENCE from EMP_SKILL where EMPNO = 101;

SKI SKILL_EXPERIENCE
--- ----------------
S1                 6
S2                10
S3                 7

-- Question 4.7

select SKILLNAME from EMP_SKILL natural join SKILL where EMPNO = 101;

SKILLNAME
--------------------
Full Stack
Python
java

-- Question 4.8

select EMPCODE from WORK_EXP where CLIENTID = 'C1' or CLIENTID = 'C2' and RATING = 'A' or RATING = 'B';

   EMPCODE
----------
       100
       101
       102
       102
       105
       110

 -- Question 4.9
 
 select EMPCODE from WORK_EXP where CLIENTID = 'C2' and RATING = 'B';
 
    EMPCODE
----------
       102
       105
 
-- Question 4.10

select count(EMPNO) from EMP natural join FAMILY_DEPENDENTS where NAME = 'RAVI';

COUNT(EMPNO)
------------
           6

-- Question 4.11

select NAME, DESIGNATION, SALARY*12 AS ANNUAL_SALARY from EMP;

NAME       DESIGNATION          ANNUAL_SALARY
---------- -------------------- -------------
RAJESH     DEVELOPER
RAVI       PROJECT LEADER
VIJAY      PROJECT MANAGER
AJAY       TECHNICAL HEAD
BHASKAR    PROJECT DIRECTOR
RAJ        PROJECT LEADER
RAKESH
RAKESH

           PROJECT LEADER
RAJ

NAME       DESIGNATION          ANNUAL_SALARY
---------- -------------------- -------------
Saatwik    CEO                        3599988
MANISH     DEVELOPER

-- Question 4.12

select NAME, DEP_NAME from EMP natural join FAMILY_DEPENDENTS;

NAME       DEP_NAME
---------- --------------------
RAJESH     AARYA
RAJESH     AJITH
RAJESH     AKANKSH
RAJESH     ANITHA
RAJESH     PARV
RAJESH     PRITHVI
RAVI       AARYA
RAVI       AJITH
RAVI       AKANKSH
RAVI       ANITHA
RAVI       PARV

-- Question 4.13

select * from EMP natural join PRJ_DETAILS where ACTUAL_END_DATE is null and ACTUAL_BUDGET < BUDGET;

   EMPCODE NAME       QUALIFI      PHONE EMAIL
---------- ---------- ------- ---------- --------------------
DESIGNATION              SALARY REPORTS_TO PRJ PRJ_NAME   START_DAT END_DATE
-------------------- ---------- ---------- --- ---------- --------- ---------
ACTUAL_EN ACTUAL_BUDGET LEAD_BY_EMPCODE     BUDGET
--------- ------------- --------------- ----------
       113 RAKESH     MTECH
                                           P1  SPYDER     10-JAN-20 11-OCT-22
                1990000             102    2000000

       109            MTECH
                                           P1  SPYDER     10-JAN-20 11-OCT-22
                1990000             102    2000000

   EMPCODE NAME       QUALIFI      PHONE EMAIL
---------- ---------- ------- ---------- --------------------
DESIGNATION              SALARY REPORTS_TO PRJ PRJ_NAME   START_DAT END_DATE
-------------------- ---------- ---------- --- ---------- --------- ---------
ACTUAL_EN ACTUAL_BUDGET LEAD_BY_EMPCODE     BUDGET
--------- ------------- --------------- ----------

       114
PROJECT LEADER                             P1  SPYDER     10-JAN-20 11-OCT-22
                1990000             102    2000000

       111 RAJ                           raj-1@digisol.com
                                           P1  SPYDER     10-JAN-20 11-OCT-22

   EMPCODE NAME       QUALIFI      PHONE EMAIL
---------- ---------- ------- ---------- --------------------
DESIGNATION              SALARY REPORTS_TO PRJ PRJ_NAME   START_DAT END_DATE
-------------------- ---------- ---------- --- ---------- --------- ---------
ACTUAL_EN ACTUAL_BUDGET LEAD_BY_EMPCODE     BUDGET
--------- ------------- --------------- ----------
                1990000             102    2000000

       116 Saatwik    PHD     9740225444 saatwik@digisol.com
CEO                      299999            P1  SPYDER     10-JAN-20 11-OCT-22
                1990000             102    2000000

       105 MANISH     MCA                manish@digisol.com

   EMPCODE NAME       QUALIFI      PHONE EMAIL
---------- ---------- ------- ---------- --------------------
DESIGNATION              SALARY REPORTS_TO PRJ PRJ_NAME   START_DAT END_DATE
-------------------- ---------- ---------- --- ---------- --------- ---------
ACTUAL_EN ACTUAL_BUDGET LEAD_BY_EMPCODE     BUDGET
--------- ------------- --------------- ----------
DEVELOPER                              106 P1  SPYDER     10-JAN-20 11-OCT-22
                1990000             102    2000000
				
-- Question 4.14

select NAME, SALARY, EMPCODE, PAY_DAY, ADVANCE_TAX from EMP natural join PAY_CHECK where extract(month from PAY_DAY) = 3;

no rows selected

-- Question 4.15

select a.NAME, b.NAME as REPORTS_TO, b.PHONE from EMP a inner join EMP b on a.REPORTS_TO = b.EMPCODE;

NAME       REPORTS_TO      PHONE
---------- ---------- ----------
RAJESH     RAVI
RAVI       VIJAY
VIJAY      BHASKAR
AJAY       VIJAY
BHASKAR    RAJ
RAJ        BHASKAR

-- Question 4.16

select * from PRJ_DETAILS order by ACTUAL_END_DATE desc;

PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN ACTUAL_BUDGET LEAD_BY_EMPCODE
--- ---------- --------- --------- --------- ------------- ---------------
    BUDGET
----------
P6  MARS       21-FEB-19 07-AUG-20                                     110


P3  UNICORN    03-SEP-21 10-OCT-23                 8000000             106
   7500000

P1  SPYDER     10-JAN-20 11-OCT-22                 1990000             102
   2000000


PRJ PRJ_NAME   START_DAT END_DATE  ACTUAL_EN ACTUAL_BUDGET LEAD_BY_EMPCODE
--- ---------- --------- --------- --------- ------------- ---------------
    BUDGET
----------
P7                                                                     105


P8  XXX


P4  ZEUS       28-FEB-20 09-JUN-21 10-JAN-22       5000000             110

-- Question 4.17

select NAME, SKILLNAME from EMP natural join EMP_SKILL natural join SKILL order by EMPNO asc, SKILL_EXPERIENCE desc;


NAME       SKILLNAME
---------- --------------------
RAJESH     Full Stack
RAVI       Full Stack
MANISH     Full Stack
Saatwik    Full Stack
RAJ        Full Stack
           Full Stack
           Full Stack
RAKESH     Full Stack
RAKESH     Full Stack
RAJ        Full Stack
BHASKAR    Full Stack

NAME       SKILLNAME
---------- --------------------
AJAY       Full Stack
VIJAY      Full Stack
RAJESH     java
Saatwik    java
RAJ        java
           java
           java
RAKESH     java
MANISH     java
RAJ        java

-- Question 4.18

SELECT NAME,DEP_NAME,AGE FROM EMP NATURAL JOIN FAMILY_DEPENDENTS WHERE RELATIONSHIP = 'SON' ORDER BY NAME ASC,AGE DESC;


NAME       DEP_NAME                    AGE
---------- -------------------- ----------
AJAY       PARV                         23
AJAY       AJITH                        12
AJAY       AKANKSH                      11
BHASKAR    PARV                         23
BHASKAR    AJITH                        12
BHASKAR    AKANKSH                      11
MANISH     PARV                         23
MANISH     AJITH                        12
MANISH     AKANKSH                      11
RAJ        PARV                         23
RAJ        PARV                         23


-- Question 4.19

SELECT NAME,PRJ_NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP ORDER BY NAME DESC,EMPCODE ASC;

NAME       PRJ_NAME
---------- ----------
VIJAY      APOLLO
VIJAY      SPYDER
RAVI       SPYDER
RAJESH     SPYDER
RAJESH     UNICORN
RAJ        ZEUS
RAJ        UNICORN
RAJ        JUPITER
MANISH     APOLLO
BHASKAR    ZEUS
BHASKAR    JUPITER

NAME       PRJ_NAME
---------- ----------
AJAY       APOLLO

-- Question 4.20

SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP WHERE PRJ_NAME = 'SPYDER' UNION SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP WHERE PRJ_NAME = 'APOLLO';


NAME
----------
AJAY
MANISH
RAJESH
RAVI
VIJAY

-- Question 4.21

SELECT NAME FROM EMP NATURAL JOIN EMP_SKILL NATURAL JOIN SKILL WHERE SKILLNAME = 'AZURE' UNION SELECT NAME FROM EMP NATURAL JOIN EMP_SKILL NATURAL JOIN SKILL WHERE SKILLNAME = 'ORACLE';

NAME
----------
AJAY
BHASKAR
MANISH
RAJ
RAJESH
RAKESH
RAVI
Saatwik
VIJAY


-- Question 4.22

SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP MINUS SELECT NAME FROM EMP NATURAL JOIN PRJ_DETAILS NATURAL JOIN WORK_EXP WHERE PRJ_NAME = 'JUPITOR';

NAME
----------
AJAY
BHASKAR
MANISH
RAJ
RAJESH
RAVI
VIJAY
 
-- Question 4.23

select NAME from EMP where REPORTS_TO is null;

NAME
----------
RAKESH
RAKESH


RAJ
Saatwik

-- Question 4.24

select NAME, EMAIL from EMP where EMAIL like 'ra%';

NAME       EMAIL
---------- --------------------
RAJ        raj-1@digisol.com
RAJ        raj@digisol.com
RAJESH     rajesh@digisol.com
RAVI       ravi@digisol.com

-- Question 4.25

select PRJ_NAME from PRJ_DETAILS where START_DATE between '01-JAN-2020' and '14-DEC-2020';

PRJ_NAME
----------
ZEUS
SPYDER

--Question 4.26

select NAME from EMP natural join EMP_SKILL where SKILLID in (select SKILLID from EMP_SKILL where EMPNO = 101);

NAME
----------
RAJESH
RAVI
VIJAY
AJAY
BHASKAR
RAJ
RAKESH
RAKESH