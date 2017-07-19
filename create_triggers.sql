
CREATE or REPLACE TRIGGER validate_employee_changes
AFTER INSERT OR UPDATE
ON EMPLOYEES
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE(:NEW.hire_date);
  DBMS_OUTPUT.PUT_LINE(:NEW.email);
END;
/
drop trigger validate_employee_changes;

select salary from employees where email = 'SKING';

SET SERVEROUTPUT ON
update employees set email = 'SKING1' where email = 'SKING';
update employees set email = 'SKING' where email = 'SKING';

CREATE OR REPLACE TRIGGER check_raise
BEFORE UPDATE OF salary
ON EMPLOYEES
FOR EACH ROW
WHEN (OLD.salary != NEW.salary)
BEGIN
  DBMS_OUTPUT.PUT_LINE(:OLD.salary);
  DBMS_OUTPUT.PUT_LINE(:NEW.salary);
  DBMS_OUTPUT.PUT_LINE(:NEW.email);
END;
/

update employees set salary = 24000 where email = 'SKING';

drop trigger check_raise;
drop trigger validate_employee_changes;

CREATE OR REPLACE TRIGGER compound_employee
FOR UPDATE ON EMPLOYEES
COMPOUND TRIGGER
  v_global_var NUMBER := 1;
  BEFORE STATEMENT IS BEGIN
   DBMS_OUTPUT.PUT_LINE('Compound Statement Before' || v_global_var);
   v_global_var := v_global_var + 1;
  END BEFORE STATEMENT;
  BEFORE EACH ROW IS BEGIN
    DBMS_OUTPUT.PUT_LINE('Compound Row Before' || v_global_var);
    v_global_var := v_global_var + 1;
  END BEFORE EACH ROW;
  AFTER EACH ROW IS BEGIN
    DBMS_OUTPUT.PUT_LINE('Compound Row After' || v_global_var);
    v_global_var := v_global_var + 1;
  END AFTER EACH ROW;
  AFTER STATEMENT IS BEGIN
    DBMS_OUTPUT.PUT_LINE('Compound Statement After' || v_global_var);
    v_global_var := v_global_var + 1;
  END AFTER STATEMENT;
END;
/

update employees set salary = salary - 1 where lower(last_name) = 'king';

drop trigger compound_employee;

create or replace PROCEDURE secure_dml
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

create or replace TRIGGER secure_employees
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;

UPDATE EMPLOYEES SET SALARY = 500;
ALTER TRIGGER secure_employees DISABLE;
ALTER TABLE employees DISABLE ALL TRIGGERS;
ALTER TRIGGER secure_employees ENABLE;
ALTER TABLE employees ENABLE ALL TRIGGERS;

create or replace TRIGGER town_crier
  BEFORE DDL ON SCHEMA
BEGIN
  DBMS_OUTPUT.PUT_LINE('You have created a ' || ORA_DICT_OBJ_TYPE ||
          ' called ' || ORA_DICT_OBJ_NAME);
  --secure_dml;
END town_crier;

create table a_table1 (col1 number);

CREATE VIEW EMPLOYEE_DEPARTMENT
AS SELECT e.last_name, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

SELECT * from employee_department;

update employee_department set department_name = 'Shipping';

select * from user_errors;


