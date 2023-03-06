insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (100, 'RAJESH', 'BTECH', 'rajesh@digisol.com', 'DEVELOPER', 101);

insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (101, 'RAVI', 'MTECH', 'ravi@digisol.com', 'PROJECT LEADER', 102);

insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (102, 'VIJAY', 'BTECH', 'vijay@digisol.com', 'PROJECT MANAGER', 110);

insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (108, 'AJAY', 'BTECH', 'ajay@digisol.com', 'TECHNICAL HEAD', 102);

insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (110, 'BHASKAR', 'MTECH', 'bhaskar@digisol.com', 'PROJECT DIRECTOR', 106);

insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (105, 'MANISH', 'MCA', 'manish@digisol.com', 'DEVELOPER', 106);
-- Error: unique constraint (DSE214.PK_EMPNO) violated
insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (106, 'RAJ', 'MSC', 'raj@digisol.com', 'PROJECT LEADER', 110);
insert into EMP (EMPCODE, NAME, QUALIFICATION, EMAIL, DESIGNATION, REPORTS_TO) 
values (107, 'RAJ', 'MSC', 'raj@digisol.com', 'PROJECT LEADER', 110);

-- Error: unique constraint (DSE214.PK_EMPNO) violated
insert into EMP (EMPCODE, NAME, QUALIFICATION) 
values (102, 'RAKESH', 'MTECH');
insert into EMP (EMPCODE, NAME, QUALIFICATION) 
values (112, 'RAKESH', 'MTECH');

-- Error: unique constraint (DSE214.PK_EMPNO) violated
insert into EMP (EMPCODE, NAME, QUALIFICATION) 
values (113, 'RAKESH', 'MTECH');

-- Error: check constraint (DSE214.VALID_QUALIF) violated
insert into EMP (EMPCODE, QUALIFICATION) 
values (109, 'MBA');
insert into EMP (EMPCODE, QUALIFICATION) 
values (109, 'MTECH');

-- Error: check constraint (DSE214.VALID_DESIGNATION) violated
insert into EMP (EMPCODE, DESIGNATION) 
values (110, 'S.ENGINEER');
insert into EMP (EMPCODE, DESIGNATION) 
values (114, 'PROJECT LEADER');

-- Error: check constraint (DSE214.EMAIL_DOMAIN) violated
-- Error: unique constraint (DSE214.UNQ_EMAIL) violated
insert into EMP (EMPCODE, NAME, EMAIL) 
values (111, 'RAJ', 'raj@digital.com');
insert into EMP (EMPCODE, NAME, EMAIL) 
values (111, 'RAJ', 'raj-1@digisol.com');

-- Custom Input
insert into EMP
values (116, 'Saatwik', 'PHD', 9740225444, 'saatwik@digisol.com', 'CEO', 299999, NULL); 

-- SKILL TABLE 

insert into SKILL
values ('S1', 'Full Stack');
insert into SKILL
values ('S2', 'Python');
insert into SKILL
values ('S3', 'java');
insert into SKILL
values ('S4', 'C++');
insert into SKILL
values ('S6', 'Oracle');
insert into SKILL
values ('S7', 'Android');
insert into SKILL
values ('S8', 'AZURE');
insert into SKILL
values ('S9', 'DOT NET');
insert into SKILL
values ('S10', 'IOS');

-- Custom Input 
insert into SKILL
values('S5', 'Firebase');

-- CLIENT TABLE

insert into CLIENT 
values('C1', 'ABC', '+48-87489389', 'aaa@abc.com');
insert into CLIENT 
values('C2', 'LTS', '+91-78389397', 'bbb@its.com');
insert into CLIENT 
values('C3', 'RK', '+44-67838934', 'ccc@rk.com');
insert into CLIENT 
values('C4', 'MMA', '+31-77839093', 'ddd@mma.com');
insert into CLIENT 
values('C5', 'AKS', '+81-66822903', 'eee@aks.com');
insert into CLIENT 
-- Error: Wrong phone format
values('C6', 'GKS', '+78-75628982', 'fff@gks.com');
insert into CLIENT 
values('C7', 'B&B', '+91-64839839', 'ggg@bb.com');
insert into CLIENT (CLIENTID, NAME, PHONE)
values('C8', 'ABT', '+97-67554667');
insert into CLIENT (CLIENTID, NAME, EMAIL)
values('C9', 'XYZ', 'xyz@ab.com');


-- EMP_SKILL Table

insert into EMP_SKILL
values(100, 'S1', 15);
insert into EMP_SKILL
values(100, 'S3', 10);
insert into EMP_SKILL
values(101, 'S1', 6);
insert into EMP_SKILL
values(101, 'S2', 10);
insert into EMP_SKILL
values(102, 'S4', 18);
insert into EMP_SKILL
values(110, 'S1', 14);
insert into EMP_SKILL
values(110, 'S6', 20);
insert into EMP_SKILL
values(106, 'S2', 10);
insert into EMP_SKILL
values(106, 'S6', 12);
insert into EMP_SKILL
values(106, 'S8', 10);
insert into EMP_SKILL
values(108, 'S9', 5);
insert into EMP_SKILL
values(108, 'S6', 18);
insert into EMP_SKILL
values(105, 'S7', 12);
insert into EMP_SKILL
values(105, 'S10', 11);
-- Error:  unique constraint (DSE214.PK_EMPNO_SKILLID) violated
insert into EMP_SKILL
values(101, 'S2', 7);
insert into EMP_SKILL
values(101, 'S3', 7);

-- WORK_EXP table

INSERT INTO WORK_EXP 
VALUES(100,'P1',20,'C1','A');
INSERT INTO WORK_EXP 
VALUES(100,'P3',15,'C3','A');
INSERT INTO WORK_EXP 
VALUES(101,'P1',16,'C1','A');
INSERT INTO WORK_EXP 
VALUES(102,'P2',18,'C2','B');
INSERT INTO WORK_EXP 
VALUES(102,'P1',18,'C1','A');
INSERT INTO WORK_EXP 
VALUES(108,'P2',12,'C2','C');
INSERT INTO WORK_EXP 
VALUES(106,'P3',20,'C3','C');
INSERT INTO WORK_EXP 
VALUES(106,'P4',10,'C4','C');
INSERT INTO WORK_EXP 
VALUES(105,'P2',19,'C2','B');
INSERT INTO WORK_EXP 
VALUES(110,'P4',12,'C4','B');
INSERT INTO WORK_EXP 
VALUES(110,'P5',16,'C8','A');
INSERT INTO WORK_EXP 
VALUES(105,'P5',5,'C5','D');
INSERT INTO WORK_EXP 
VALUES(111,'P5',5,'C5','C');

-- PRJ_DETAILS table
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE,LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P1', 'SPYDER', '10-JAN-2020', '11-OCT-2022', 102, 2000000.0,1990000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, ACTUAL_END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P2', 'APOLLO', '01-JAN-2019', '10-JUL-2021', '30-DEC-2021', 108, 3000000.0,3600000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P3', 'UNICORN', '03-SEP-2021', '10-OCT-2023', 106, 7500000.0,8000000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, ACTUAL_END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P4', 'ZEUS', '28-FEB-2020', '09-JUN-2021', '10-JAN-2022', 110, 5500000.0,5000000.0);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE, ACTUAL_END_DATE, LEAD_BY_EMPCODE, BUDGET, ACTUAL_BUDGET)
values ('P5', 'JUPITER', '07-AUG-2018', '04-FEB-2020', '01-NOV-2020', 110, 9000000.0,9000000.0);

-- Error:  check constraint (DSE214.END_DATE_GREATERTHN_START_DATE) violated
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE,LEAD_BY_EMPCODE)
values ('P6', 'MARS', '21-FEB-2022', '07-AUG-2020', 110);
insert into PRJ_DETAILS (PRJID, PRJ_NAME, START_DATE, END_DATE,LEAD_BY_EMPCODE)
values ('P6', 'MARS', '21-FEB-2019', '07-AUG-2020', 110);

-- Error: cannot insert NULL into ("DSE214"."PRJ_DETAILS"."PRJID")
insert into PRJ_DETAILS (PRJID, PRJ_NAME)
values (NULL, 'XXX');
insert into PRJ_DETAILS (PRJID, PRJ_NAME)
values ('P8', 'XXX');

-- Error: integrity constraint (DSE214.SYS_C0049824) violated - parent key not
insert into PRJ_DETAILS (PRJID, LEAD_BY_EMPCODE)
values ('P7', 123);
insert into PRJ_DETAILS (PRJID, LEAD_BY_EMPCODE)
values ('P7', 105);



-- FAMILY DEPENDENTS

insert into FAMILY_DEPENDENTS
values (100, 'AJITH', 'SON', 12);
insert into FAMILY_DEPENDENTS
values (100, 'PRITHVI', 'DAUGHTER', 9);
insert into FAMILY_DEPENDENTS
values (101, 'AARYA', 'DAUGHTER', 17);
insert into FAMILY_DEPENDENTS
values (101, 'AKANKSH', 'SON', 11);
insert into FAMILY_DEPENDENTS
values (101, 'ANITHA', 'SPOUSE', 43);

-- Custom Input
insert into FAMILY_DEPENDENTS
values (100, 'PARV', 'SON', 23);

-- Medical Policy table 
INSERT INTO MEDICAL_POLICY VALUES(100,'MED001',10000,'10-DEC-2020');
INSERT INTO MEDICAL_POLICY VALUES(101,'MED003',12000,'15-DEC-2020');
INSERT INTO MEDICAL_POLICY VALUES(100,'MED001',10000,'10-JAN-2020');
INSERT INTO MEDICAL_POLICY VALUES(101,'MED003',12000,'15-JAN-2020');
INSERT INTO MEDICAL_POLICY VALUES(103,'MED004',9000,'21-JAN-2020'); --ORA-02291: integrity constraint (DSE186.SYS_C0044712) violated - parent key not found

INSERT INTO MEDICAL_POLICY VALUES(106,'MED004',9000,'21-JAN-2020');

-- Pay check table 
ALTER TABLE PAY_CHECK DROP COLUMN REGULAR_INCREMENT;
ALTER TABLE PAY_CHECK ADD REGULAR_INCREMENT NUMERIC(4) CONSTRAINT VAL CHECK(REGULAR_INCREMENT=2000 OR REGULAR_INCREMENT=3000 OR REGULAR_INCREMENT=5000 OR REGULAR_INCREMENT=7000 OR REGULAR_INCREMENT=9000);

ALTER TABLE PAY_CHECK DROP COLUMN PAY_DATE;
ALTER TABLE PAY_CHECK ADD PAY_DATE DATE;
ALTER TABLE PAY_CHECK ADD CONSTRAINT PRM_KEY PRIMARY KEY(EMPCODE,PAY_DATE);

INSERT INTO PAY_CHECK VALUES(100,NULL,NULL,NULL,2500,5000,'01-DEC-2020',,2000);
INSERT INTO PAY_CHECK VALUES(101,NULL,NULL,NULL,5000,7000,'01-DEC-2020',3000);
INSERT INTO PAY_CHECK VALUES(102,NULL,NULL,NULL,3600,7000,'01-DEC-2020',3000);
INSERT INTO PAY_CHECK VALUES(100,NULL,NULL,NULL,450,4000,'01-JAN-2020',3000);
INSERT INTO PAY_CHECK VALUES(101,NULL,NULL,NULL,2100,4000,'01-JAN-2020',5000);
INSERT INTO PAY_CHECK VALUES(102,NULL,NULL,NULL,NULL,9000,'01-JAN-2020',5000);
INSERT INTO PAY_CHECK VALUES(103,NULL,NULL,NULL,900,3000,'02-JAN-2020',7000); --ORA-02291: integrity constraint (DSE186.SYS_C0044783) violated - parent key not found

INSERT INTO PAY_CHECK VALUES(100,NULL,NULL,NULL,900,3000,'02-JAN-2020',7000);

-- Question 3.9

delete from EMP where EMPCODE = 100; 
ROLLBACK;
update EMP set EMAIL = 'rajesh@digisol.com' where EMPCODE = 100;

-- Question 3.10

update WORK_EXP set PRJID = 'P9' where EMPCODE = 111;

-- Question 3.11


-- Question 3.13

delete from CLIENT where CLIENTID = 'C1';

-- Question 3.14

update EMP set SALARY = SALARY + (SALARY/100);

-- Question 3.15

update EMP set REPORTS_TO = 106 where EMPCODE = 108;
 
-- Question 3.16

update EMP est REPORTS_TO = 117 where EMPCOE = 108;
