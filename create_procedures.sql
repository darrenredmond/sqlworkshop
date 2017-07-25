
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
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row.');
END;
/