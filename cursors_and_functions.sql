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


