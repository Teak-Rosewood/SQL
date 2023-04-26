-- Question 1

Create table ACCOUNT (
    Account_Number INT, 
    Balence numeric(10,2) not null check (balance >= 1000)
);

insert into ACCOUNT values (1, 1000);
insert into ACCOUNT values (2, 2000);
insert into ACCOUNT values (3, 3000);
insert into ACCOUNT values (4, 4000);
insert into ACCOUNT values (5, 5000);
insert into ACCOUNT values (6, 6000);
insert into ACCOUNT values (7, 7000);
insert into ACCOUNT values (8, 8000);
insert into ACCOUNT values (9, 9000);

create or replace procedure withdrawFromBank (
    acc_num in ACCOUNT.Account_Number%TYPE,
    Ammount in ACCOUNT.Balance%TYPE
) is 
currBalance ACCOUNT.Balance%TYPE;
BEGIN 
    select Balance into currBalance
    from ACCOUNT
    where Account_Number = acc_num;
    DBMS_OUTPUT.PUT_LINE('Current Balance: ' || currBalance);
    if currBalance - Ammount >= 1000 
        then update ACCOUNT set Balance = currBalance - Ammount 
            where Account_Number = acc_num
        
        DBMS_OUTPUT.PUT_LINE('Withdrawal of ' || Ammount || 'is Successful');
        DBMS_OUTPUT.PUT_LINE('Updated Current Balence: ' || (currBalance-Ammount));
    else 
        DBMS_OUTPUT.PUT_LINE('Insufficient funds');
    end if;
END;
/

Declare 
    accountNumber ACCOUNT.Account_Number%TYPE := &acc_num;
    withdraw_amt ACCOUNT%TYPE := &amt;
Begin 
    withdrawFromBank(accountNumber, withdraw_amt);
End;
/   

-- Question 2

CREATE OR REPLACE PROCEDURE find_available_hr(
    p_skill IN VARCHAR2,
    p_skill_experience IN NUMBER
)
AS
BEGIN
    SELECT *
    FROM human_resources
    WHERE skill = p_skill
    AND skill_experience >= 12;
END;
/
DECLARE
    v_skill VARCHAR2(50) := 'Marvel';
    v_skill_experience NUMBER := 24;
BEGIN
    find_available_hr(v_skill, v_skill_experience);
END;
/

-- Question 3

CREATE OR REPLACE PROCEDURE get_additional_budget_needed(p_project_id IN NUMBER)
AS
  v_start_date DATE;
  v_end_date DATE;
  v_actual_end_date DATE;
  v_budget_allocated NUMBER;
  v_per_day_cost NUMBER;
  v_additional_days NUMBER;
  v_additional_budget_needed NUMBER;
  v_project_leader_name VARCHAR2(100);
  v_employee_name VARCHAR2(100);
  v_employee_email VARCHAR2(100);
BEGIN
  
  SELECT STRAT_DATE, END_DATE, BUDGET_ALLOCATED, LEAD_BY_EMPCODE, ACTUAL_END_DATE
  INTO v_start_date, v_end_date, v_budget_allocated, v_per_day_cost, v_project_leader_id, v_actual_end_date
  FROM PRJ_DETAILS
  WHERE PRJID = p_project_id;
  
  v_additional_days := v_actual_end_date - v_end_date;
  
  v_additional_budget_needed := v_budget_allocated / (v_end_date - v_start_date);
  
  SELECT NAME, EMAIL
  INTO v_project_leader_name, v_employee_name, v_employee_email
  FROM EMP
  WHERE employee_id = v_project_leader_id;
  
  DBMS_OUTPUT.PUT_LINE('Name of Project Leader: ' || v_project_leader_name);
  DBMS_OUTPUT.PUT_LINE('Name & email of Employee to whom Project leader reports to: ' || v_employee_name || ' (' || v_employee_email || ')');
  DBMS_OUTPUT.PUT_LINE('Additional Budget Needed: ' || v_additional_budget_needed);

  RETURN v_additional_budget_needed;
END;
/

DECLARE
  v_additional_budget_needed NUMBER;
  v_prjid PRJ_DETAILS.PRJID%TYPE = &a;
BEGIN
  v_additional_budget_needed := get_additional_budget_needed(1);
END;

-- Question 4

CREATE OR REPLACE FUNCTION calculate_incentive(p_project_id IN NUMBER)
RETURN NUMBER
AS
  v_total_incentive NUMBER := 0;
BEGIN
  FOR EMP IN (SELECT EMPCODE, RATING FROM EXPERIENCE WHERE PRJID = p_project_id)
  LOOP
    IF emp.rating = 'A' THEN
      v_total_incentive := v_total_incentive + 30000;
    ELSIF emp.rating = 'B' THEN
      v_total_incentive := v_total_incentive + 20000;
    ELSIF emp.rating = 'C' THEN
      v_total_incentive := v_total_incentive + 10000;
    END IF;
  END LOOP;
  
  RETURN v_total_incentive;
END;

DECLARE
  v_project_id NUMBER := &project_id; 
  v_total_incentive NUMBER;
BEGIN
  v_total_incentive := calculate_incentive(v_project_id);
  
  DBMS_OUTPUT.PUT_LINE('Total Incentive: ' || v_total_incentive);
END;

-- Question 5

CREATE OR REPLACE FUNCTION find_clients(p_country_code IN VARCHAR2)
RETURN VARCHAR2
IS
  v_client_name VARCHAR2(100);
BEGIN
  SELECT client_name INTO v_client_name
  FROM clients
  WHERE country_code = p_country_code;
  
  RETURN v_client_name;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No clients found in that country.';
  WHEN TOO_MANY_ROWS THEN
    RETURN 'Multiple clients found in that country.';
END;

-- Question 6

CREATE OR REPLACE FUNCTION generate_email_id(p_name IN VARCHAR2, p_empno IN NUMBER)
RETURN VARCHAR2
AS
  v_email_id VARCHAR2(100);
BEGIN
  v_email_id := LOWER(REPLACE(p_name, ' ', '_') || '_' || p_empno || '@digisol.com');
  
  RETURN v_email_id;
END;

DECLARE
  v_name VARCHAR2(100) := ''; 
  v_empno NUMBER := 1;
  v_email_id VARCHAR2(100);
BEGIN
  v_email_id := generate_email_id(v_name, v_empno);
  
  DBMS_OUTPUT.PUT_LINE('Email ID: ' || v_email_id);
END;

-- Question 7

CREATE OR REPLACE PACKAGE workforce_pkg AS
  
  FUNCTION get_reporting_manager(p_empno IN NUMBER) RETURN VARCHAR2;
  
  PROCEDURE display_project_employees(p_project_id IN NUMBER);

  PROCEDURE display_projects_started_from(p_start_date IN DATE);
  
  PROCEDURE display_workforce_details;
  
  FUNCTION count_employees_by_designation RETURN SYS_REFCURSOR;
END workforcepkg;
/

CREATE OR REPLACE PACKAGE BODY workforce_pkg AS

  FUNCTION get_reporting_manager(p_empno IN NUMBER) RETURN VARCHAR2 AS
    v_reporting_manager VARCHAR2(100);
  BEGIN
    SELECT e2.name INTO v_reporting_manager
    FROM EMP e1
    JOIN EMP e2 ON e1.REPORTS_TO = e2.EMPCODE
    WHERE e1.EMPCODE = p_empno;
    
    RETURN v_reporting_manager;
  END get_reporting_manager;
  
  PROCEDURE display_project_employees(p_project_id IN NUMBER) AS
  BEGIN
    FOR emp IN (SELECT name FROM PRJ_DETAILS natural join EMP WHERE PRJID = p_project_id)
    LOOP
      DBMS_OUTPUT.PUT_LINE(emp.NAME);
    END LOOP;
  END display_project_employees;
  
  PROCEDURE display_projects_started_from(p_start_date IN DATE) AS
  BEGIN
    FOR project IN (SELECT name FROM PRJ_DETAILS WHERE start_date >= p_start_date)
    LOOP
      DBMS_OUTPUT.PUT_LINE(project.PRJ_NAME);
    END LOOP;
  END display_projects_started_from;
  
  PROCEDURE display_workforce_details AS
  BEGIN
    FOR skill IN (SELECT DISTINCT name FROM SKILL)
    LOOP
      DBMS_OUTPUT.PUT_LINE('Skill: ' || skill.NAME);
      FOR emp IN (SELECT EMPCODE, NAME, SKILL_EXPERIENCE FROM EMP natural join EMP_SKILL WHERE SKILLID = skill.SKILLID)
      LOOP
        DBMS_OUTPUT.PUT_LINE('  Empno: ' || emp.EMPCODE || ', Name: ' || emp.NAME || ', Experience: ' || emp.SKILL_EXPERIENCE);
      END LOOP;
    END LOOP;
  END display_workforce_details;
  
  FUNCTION count_employees_by_designation RETURN SYS_REFCURSOR AS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
    SELECT DESIGNATION, COUNT(*) AS num_employees
    FROM EMP
    GROUP BY DESIGNATION;
    
    RETURN v_cursor;
  END count_employees_by_designation;
END workforce_pkg;
/