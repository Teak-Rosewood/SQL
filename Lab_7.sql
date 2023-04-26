-- Q1

set serveroutput on
DECLARE
my_num number(10);
final number(10) := 0;
temp number(10);
begin
my_num := &my_num;
while my_num>0 loop
temp := mod(my_num,10);
my_num := my_num/10;
final := 10*final+temp;
end loop;
DBMS_OUTPUT.PUT_LINE(final);
end;
/

-- Q2

set serveroutput on
DECLARE
my_string varchar2(20);
my_string_temp varchar2(20);
BEGIN
my_string := '&my_string';
for i in REVERSE 1..length(my_string) LOOP
my_string_temp := my_string_temp || Substr(my_string, i, 1);
end loop;
if my_string = my_string_temp THEN
DBMS_OUTPUT.PUT_LINE('Palindrome');
ELSE
DBMS_OUTPUT.PUT_LINE('Not palindrome');
end if;
end;
/

-- Q3

set serveroutput on
DECLARE
my_emp emp.empcode%type;
my_display emp%ROWTYPE;
BEGIN
my_emp := &my_emp;
select * into my_display from emp where empcode = my_emp;
DBMS_OUTPUT.PUT_LINE(my_display.name);
end;
/

-- Q4

set serveroutput on
DECLARE
vowel_count number(10) := 0;
consonant_count number(10) := 0;
number_count number(10) :=0;
spl_count number(10) :=0;
my_string varchar2(10);
BEGIN
my_string := '&my_string';
for i in 1..length(my_string) LOOP
if (ascii(substr(my_string,i,1)) BETWEEN 65 and 90) or (ascii(substr(my_string,i,1)) BETWEEN 97 and 122) THEN
if ((substr(my_string,i,1)) in ('a','e','i','o','u','A','E','I','O','U')) THEN
vowel_count := vowel_count+1;
ELSE
consonant_count := consonant_count+1;
end if;
elsif (ascii(substr(my_string,i,1)) BETWEEN 48 and 57) then
number_count := number_count+1;
ELSE
spl_count := spl_count+1;
end if;
end loop;
DBMS_OUTPUT.PUT_LINE('Number of vowels:' || vowel_count);
DBMS_OUTPUT.PUT_LINE('Number of consonants:' || consonant_count);
DBMS_OUTPUT.PUT_LINE('Number of numbers:' || number_count);
DBMS_OUTPUT.PUT_LINE('Number of special:' || spl_count);
end;
/

-- Q5

set serveroutput on
DECLARE
my_code emp.empcode%type;
my_prj work_exp.prjid%TYPE;
salary emp.salary%type;
my_pr_name prj_details.prj_name%type;
rating work_exp.rating%type;
name emp.name%type;
temp number(10);
BEGIN
my_code := &my_code;
my_prj := '&my_prj';
select salary,prj_name,rating,name into salary,my_pr_name,rating,name from emp natural join work_exp natural join prj_details where empcode = my_code and prjid = my_prj;
DBMS_OUTPUT.PUT_LINE('Employee Code:' || my_code);
DBMS_OUTPUT.PUT_LINE('Employee Name:' || name);
DBMS_OUTPUT.PUT_LINE('Project Name:' || my_pr_name);
DBMS_OUTPUT.PUT_LINE('Rating:' || rating);
if rating = 'A' then 
temp := 10000;
elsif rating = 'B' THEN
temp := 5000;
ELSE
temp := 3000;
end if;
salary := salary + temp;
DBMS_OUTPUT.PUT_LINE('Salary:' || salary);
end;
/

-- Q6

set serveroutput on
DECLARE
my_emp emp%ROWTYPE;
my_sal pay_check%ROWTYPE;
BEGIN
SELECT * into my_emp from emp where empcode = 100;
SELECT * into my_sal from pay_check where empcode = 100 and pay_date = '01-JAN-20';
DBMS_OUTPUT.PUT_LINE('Name:' || my_emp.name);
DBMS_OUTPUT.PUT_LINE('Salary:' || my_emp.salary);
DBMS_OUTPUT.PUT_LINE('Regular increment:' || my_sal.regular_increment);
DBMS_OUTPUT.PUT_LINE('Increased Basic Salary:' || (my_emp.salary+my_sal.regular_increment));
DBMS_OUTPUT.PUT_LINE('Performance incentive:' || my_sal.PERFORMANCE_INCENTIVE);
DBMS_OUTPUT.PUT_LINE('Salary:' || my_emp.salary);
DBMS_OUTPUT.PUT_LINE('DA:' || (my_emp.salary+my_sal.regular_increment)*0.5);
DBMS_OUTPUT.PUT_LINE('PF:' || (my_emp.salary+my_sal.regular_increment)*0.12);
DBMS_OUTPUT.PUT_LINE('Other Incentive:' || my_sal.other_incentives);
DBMS_OUTPUT.PUT_LINE('Advance tax paid:' || my_sal.ADVANCE_TAX);
DBMS_OUTPUT.PUT_LINE('Monthly Gross Salary:' || (my_emp.salary+my_sal.regular_increment+my_sal.PERFORMANCE_INCENTIVE+(my_emp.salary+my_sal.regular_increment)*0.5+(my_emp.salary+my_sal.regular_increment)*0.12+my_sal.other_incentives));
DBMS_OUTPUT.PUT_LINE('Monthly Take home salary:' || (my_emp.salary+my_sal.regular_increment+my_sal.PERFORMANCE_INCENTIVE+(my_emp.salary+my_sal.regular_increment)*0.5+my_sal.other_incentives-my_sal.ADVANCE_TAX));
end;
/

-- Q8

create table account(
	acc_no numeric(10),
	balance numeric(10) constraint val_bal check(balance > 1000));

insert into account values(123,2000);

set serveroutput on
DECLARE
my_acc account.acc_no%type;
bal account.balance%type;
withdraw account.balance%type;
BEGIN
my_acc := &my_acc;
select balance into bal from account where acc_no = my_acc;
withdraw := &withdraw;
if bal - withdraw > 1000 then
UPDATE account SET balance = balance - withdraw;
DBMS_OUTPUT.PUT_LINE('Balance: ' || (bal - withdraw));
ELSE
DBMS_OUTPUT.PUT_LINE('Failed transaction. Insufficient funds.');
end if;
end;
/

-- Q9

set serveroutput on
DECLARE
cursor c is select * from prj_details where budget_allocated > actual_budget;
my_proj prj_details%ROWTYPE;
BEGIN
open c;
LOOP
	fetch c into my_proj;
	exit when c%notfound;
	DBMS_OUTPUT.PUT_LINE('Name: ' || my_proj.prj_name);
end loop;
end;
/

-- Q10
set serveroutput on
DECLARE
cursor c is select * from emp;
my_emp emp%ROWTYPE;
BEGIN
open c;
LOOP
	fetch c into my_emp;
	exit when c%notfound;
	DBMS_OUTPUT.PUT_LINE('Name: ' || my_emp.name);
	DBMS_OUTPUT.PUT_LINE('Designation: ' || my_emp.designation);
	DBMS_OUTPUT.PUT_LINE('Email: ' || my_emp.name|| '.' || my_emp.designation || '@digisoul.com');
end loop;
end;
/

--Q12
set serveroutput on
DECLARE
cursor c is select * from emp_skill;
my_skill emp_skill%rowtype;
skill emp_skill.skill_experience%type;
BEGIN
skill := &skill;
open c;
loop
	fetch c into my_skill;
	exit when c%notfound;
	if my_skill.skill_experience > skill then
	DBMS_OUTPUT.PUT_LINE('EMPNO: ' || my_skill.empno);
	DBMS_OUTPUT.PUT_LINE('SKILLID: ' || my_skill.skillid);
	end if;
end loop;
end;
/





