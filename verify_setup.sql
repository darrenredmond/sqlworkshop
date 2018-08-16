SELECT table_name FROM user_tables
WHERE table_name IN ('MEMBER', 'TITLE', 'TITLE_COPY', 'RENTAL', 'RESERVATION');

SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name IN ('MEMBER', 'TITLE', 'TITLE_COPY', 'RENTAL', 'RESERVATION'); 

SELECT sequence_name, increment_by, last_number
FROM user_sequences WHERE sequence_name IN ('MEMBER_ID_SEQ', 'TITLE_ID_SEQ');

SELECT * from title;
SELECT * from member;
SELECT * from title_copy;
SELECT * from rental;
SELECT * from reservation;
SELECT * from title_avail;


SELECT package_movies.check_member('Carmen', 'Redmond') from dual;
SELECT package_movies.check_member('Carmen', 'Velasquez') from dual;

SET SERVEROUTPUT ON
DECLARE
  v_member_id member.member_id%TYPE;
BEGIN
  v_member_id := package_movies.check_member('Carmen', 'Velasquez');
  DBMS_OUTPUT.PUT_LINE('The member id is : ' || v_member_id);
END;
/

SET SERVEROUTPUT ON
DECLARE
  v_member member%ROWTYPE;
BEGIN
  v_member := package_movies.get_member('Carmen', 'Velasquez');
  DBMS_OUTPUT.PUT_LINE('The member id is : ' || v_member.member_id);
  DBMS_OUTPUT.PUT_LINE('The last name is : ' || v_member.last_name);
  DBMS_OUTPUT.PUT_LINE('The phone number is : ' || v_member.phone);
END;
/
