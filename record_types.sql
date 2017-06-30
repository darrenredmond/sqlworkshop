
SET SERVEROUTPUT ON
DEFINE employee_number = 124
DECLARE
  emp_rec employees%ROWTYPE;
BEGIN
  select * into emp_rec from employees
      where employee_id = &employee_number;
  DBMS_OUTPUT.PUT_LINE(emp_rec.last_name);
  DBMS_OUTPUT.PUT_LINE(emp_rec.first_name);
  DBMS_OUTPUT.PUT_LINE(emp_rec.salary);
END;
/
select * from employees where employee_id > 206;
select * from job_history where employee_id = 208;

SET SERVEROUTPUT ON
DEFINE employee_number = 208
DECLARE
  emp_rec employees%ROWTYPE;
BEGIN
  select * into emp_rec from employees
      where employee_id = &employee_number;
  emp_rec.hire_date := sysdate;
  DBMS_OUTPUT.PUT_LINE(emp_rec.last_name);
  DBMS_OUTPUT.PUT_LINE(emp_rec.first_name);
  DBMS_OUTPUT.PUT_LINE(emp_rec.hire_date);
  UPDATE employees set ROW = emp_rec
      where employee_id = &employee_number;
END;
/

SET SERVEROUTPUT ON
DECLARE
  type emp_table_type is table of employees%rowtype index by pls_integer;
  my_emp_table emp_table_type;
  max_count number(3) := 104;
BEGIN
  for i in 100..max_count
  loop
    select * into my_emp_table(i) from employees where employee_id = i; 
  end loop;
  for i in my_emp_table.first..my_emp_table.last
  loop
    DBMS_OUTPUT.PUT_LINE(my_emp_table(i).last_name);
  end loop;
END;
/






