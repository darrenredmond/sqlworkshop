-- Example 1
-- explicit cursor definition - declare, open, fetch, close cursor
SET SERVEROUTPUT ON
DECLARE
    CURSOR emp_cursor is
        select employee_id, last_name from employees
        where department_id = 30;
    empno employees.employee_id%type;
    lname employees.last_name%type;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor into empno, lname;
        exit when emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(empno || ' ' || lname);
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- Example 2
-- explicit cursor definition - declare, open, fetch, close cursor
-- using rowtype
SET SERVEROUTPUT ON
DECLARE
    CURSOR emp_cursor is
        select employee_id, last_name from employees
        where department_id = 30;
    emp_record emp_cursor%rowtype;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor into emp_record;
        exit when emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.last_name);
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- Example 3
-- explicit cursor definition - declare, but uses cursor for loop
-- so no need to open, fetch, close cursor
SET SERVEROUTPUT ON
DECLARE
    CURSOR emp_cursor is
        select employee_id, last_name from employees
        where department_id = 30;
BEGIN
    FOR emp_record in emp_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.last_name);
    END LOOP;
END;
/

-- Example 4
-- cursor for loop with no declaration - define the sql in the cursor for loop.
SET SERVEROUTPUT ON
BEGIN
    FOR emp_record in (select employee_id, last_name
        from employees where department_id = 30)
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' 
          || emp_record.last_name);
    END LOOP;
END;
/

-- Example 5 - parameterised cursor
SET SERVEROUTPUT ON
DECLARE
    CURSOR emp_cursor(deptno NUMBER) is
        select employee_id, last_name from employees
        where department_id = deptno;
    empno employees.employee_id%type;
    lname employees.last_name%type;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Dept 30');
    OPEN emp_cursor(30);
    LOOP
        FETCH emp_cursor into empno, lname;
        exit when emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(empno || ' ' || lname);
    END LOOP;
    CLOSE emp_cursor;
    DBMS_OUTPUT.PUT_LINE('Dept 10');
    OPEN emp_cursor(10);
    LOOP
        FETCH emp_cursor into empno, lname;
        exit when emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(empno || ' ' || lname);
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- Example 6 - cursor with for update and second update statement using
-- where current of.
SET SERVEROUTPUT ON
DECLARE
  CURSOR sal_cursor is
    select e.department_id, employee_id, last_name, salary
    from employees e, departments d
    where e.department_id = d.department_id
    and d.department_id = 60
    for update of salary nowait;
BEGIN
  for emp_record in sal_cursor
  loop
    if emp_record.salary < 5000 then
      update employees set salary = emp_record.salary * 1.10
      where current of sal_cursor;
    end if;
  end loop;
end;
/

-- Check Salary Function
CREATE OR REPLACE FUNCTION check_sal 
RETURN Boolean
IS
  dept_id employees.department_id%TYPE;
  empno employees.employee_id%TYPE;
  sal employees.salary%TYPE;
  avg_sal employees.salary%TYPE;
BEGIN
  empno := 209;
  select salary, department_id into sal, dept_id
      from employees where employee_id = empno;
  select avg(salary) into avg_sal from employees
  where department_id = dept_id;
  if sal > avg_sal then
    return true;
  else
    return false;
  end if;
EXCEPTION
  when no_data_found then
    return null;
end;
/

-- anonymous block to call the check sal function.
set serveroutput on
begin
  if (check_sal is null) then
    dbms_output.put_line('Salary is null.');
  elsif (check_sal) then
    dbms_output.put_line('Salary > average.');
  else
    dbms_output.put_line('Salary < average.');
  end if;
end;
/

select salary, department_id from employees
where employee_id = 205;

select avg(salary) from employees
where employee_id = 205;

select employee_id, salary from employees
where department_id = 110;


-- Check Salary Function
CREATE OR REPLACE FUNCTION check_sal(empno employees.employee_id%type) 
RETURN Boolean
IS
  dept_id employees.department_id%TYPE;
  sal employees.salary%TYPE;
  avg_sal employees.salary%TYPE;
BEGIN
  select salary, department_id into sal, dept_id
      from employees where employee_id = empno;
  select avg(salary) into avg_sal from employees
  where department_id = dept_id;
  if sal > avg_sal then
    return true;
  else
    return false;
  end if;
EXCEPTION
  when no_data_found then
    return null;
end;
/

-- anonymous block to call the check sal function.
set serveroutput on
begin
  if (check_sal(205) is null) then
    dbms_output.put_line('Salary is null.');
  elsif (check_sal(205)) then
    dbms_output.put_line('Salary > average.');
  else
    dbms_output.put_line('Salary < average.');
  end if;
end;
/


create or replace function add_three_numbers(
    a number := 0, b number := 0, c number := 0)
RETURN number
IS
BEGIN
    return a + b + c;
END;
/

set serveroutput on
BEGIN
    dbms_output.put_line(add_three_numbers(3,4,5));
    dbms_output.put_line(add_three_numbers(3,4));
    dbms_output.put_line(add_three_numbers(c => 3, b => 4, a => 5));
    dbms_output.put_line(add_three_numbers(3, c => 5, b => 5));
END;
/

drop table dept;
create table dept as select * from departments;
select * from dept;

SELECT * from USER_ERRORS;

CREATE OR REPLACE PROCEDURE add_dept
IS
  dept_id dept.department_id%type;
  dept_name dept.department_name%type;
BEGIN
  dept_id := 200;
  dept_name := 'ST-Cirriculum';
  INSERT INTO dept(department_id, department_name)
  VALUES(dept_id, dept_name);
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row.');
END;
/

SET SERVEROUTPUT ON
BEGIN
    add_dept;
END;
/

SET SERVEROUTPUT ON
execute add_dept

select * from dept;

select * from user_errors;

CREATE OR REPLACE PROCEDURE add_dept(
    p_department_id dept.department_id%type,
    p_department_name dept.department_name%type,
    p_manager_id dept.manager_id%type := 10,
    p_location_id dept.location_id%type := 1700)
IS
BEGIN
  INSERT INTO dept(department_id, department_name,
      manager_id, location_id)
  VALUES(p_department_id, p_department_name,
      p_manager_id, p_location_id);
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row.');
END;
/

BEGIN
add_dept(100, 'IT', 50);
add_dept(1000, 'Accounting', loc_id => 100);
END;
/
select * from dept;

describe employees;

CREATE OR REPLACE PROCEDURE add_employee(
    p_first_name employees.first_name%type,
    p_last_name employees.last_name%type,
    p_email employees.email%type,
    p_phone_number employees.phone_number%type := '',
    p_hire_date employees.hire_date%type := SYSDATE,
    p_job_id employees.job_id%type := '',
    p_salary employees.salary%type := 10,
    p_commission_pct employees.commission_pct%type := 0,
    p_manager_id employees.manager_id%type := 101,
    p_department_id employees.department_id%type := 50)
IS
BEGIN
  INSERT INTO employees(employee_id, last_name,
      first_name, email, phone_number, hire_date,
      job_id, salary, commission_pct, manager_id,
      department_id)
  VALUES(employees_seq.NEXTVAL, p_last_name,
      p_first_name, p_email, p_phone_number, p_hire_date,
      p_job_id, p_salary, p_commission_pct,
      p_manager_id, p_department_id);
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row.');
END;
/
execute add_employee('Darren', 'Redmond', 'dredmond', p_job_id => 'AD_PRES');

EXECUTE package_variables.set('Hi Darren');

describe package_variables;

SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE(package_variables.get);
END;
/


CREATE OR REPLACE PACKAGE global_consts IS
  mile_2_kilo CONSTANT NUMBER := 1.6093;
  kilo_2_mile CONSTANT NUMBER := 0.6214;
  yard_2_meter CONSTANT NUMBER := 0.9144;
  meter_2_yard CONSTANT NUMBER := 1.0936;
END global_consts;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('20 miles = ' || 20*global_consts.mile_2_kilo || ' kms');
END;
/

describe global_consts;


