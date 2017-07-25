
create or replace PROCEDURE secure_dml
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '22:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;
/

create or replace TRIGGER secure_title
  BEFORE INSERT OR UPDATE OR DELETE ON title
BEGIN
  secure_dml;
END secure_title;
/

create or replace TRIGGER secure_member
  BEFORE INSERT OR UPDATE OR DELETE ON member
BEGIN
  secure_dml;
END secure_member;
/

