
-- Procedure to add a title - it takes a title name, description, rating,
-- category, and release date as its parameters and will insert a new record
-- into the title table
CREATE OR REPLACE PROCEDURE add_title(
  p_title title.title%TYPE,
  p_description title.description%TYPE,
  p_rating title.rating%TYPE,
  p_category title.category%TYPE,
  p_release_date title.release_date%TYPE)
IS
BEGIN
  INSERT INTO title(title_id, title, description, rating, category, release_date)
  VALUES (title_id_seq.NEXTVAL, p_title, p_description, p_rating, p_category, p_release_date);
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' title row.');
END;
/

-- Procedure to add a member - it takes a first name, last name, address, city,
-- phone, and join date as its parameters and will insert a new record
-- into the member table
CREATE OR REPLACE PROCEDURE add_member(
  p_first_name member.first_name%TYPE,
  p_last_name member.last_name%TYPE,
  p_address member.address%TYPE,
  p_city member.city%TYPE,
  p_phone member.phone%TYPE,
  p_join_date member.join_date%TYPE)
IS
BEGIN
  INSERT INTO member(member_id, first_name, last_name, address, city, phone, join_date)
  VALUES (member_id_seq.NEXTVAL, p_first_name, p_last_name, p_address, p_city, p_phone, p_join_date);
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' member row.');
END;
/

