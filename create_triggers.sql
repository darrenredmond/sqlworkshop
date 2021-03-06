
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

CREATE OR REPLACE VIEW EMPLOYEE_DEPARTMENT
AS SELECT d.department_id, d.department_name, e.first_name, e.last_name
from employees e, departments d
where e.department_id = d.department_id;

SELECT * from employee_department;

update employee_department set department_name = 'Shipping';

CREATE OR REPLACE TRIGGER insert_emp_dept
  INSTEAD OF INSERT ON EMPLOYEE_DEPARTMENT
DECLARE
  v_department_id departments.department_id%TYPE;
BEGIN
  BEGIN
    SELECT department_id INTO v_department_id
    FROM   departments
    WHERE  department_id = :new.department_id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      INSERT INTO departments (department_id, department_name)
             VALUES (departments_seq.nextval, :new.department_name)
             RETURNING department_id INTO v_department_id;
  END;
  INSERT INTO employees (employee_id, first_name, last_name, department_id,
                 email, hire_date, salary, job_id)
         VALUES(employees_seq.nextval, :new.first_name,
                 :new.last_name, v_department_id,
                 :new.first_name || :new.last_name, SYSDATE, 10, 'AD_VP');
END insert_emp_dept;
/
drop trigger insert_emp_dept;
insert into employee_department(department_id, department_name, first_name, last_name)
values(null, 'Analytics', 'Mark', 'Redmond');

select * from user_errors;

select * from employee_department where department_name = 'Analytics';
select * from employees where first_name = 'Mark';
