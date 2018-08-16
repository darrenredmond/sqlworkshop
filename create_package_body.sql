CREATE OR REPLACE PACKAGE BODY package_movies IS
  PROCEDURE add_title(
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
  END add_title;

  PROCEDURE update_rating(
    p_title title.title%TYPE,
    p_rating title.rating%TYPE)
  IS
  CURSOR title_cursor is
    select title_id, rating
    from title
    where title = p_title
    for update of rating nowait;
  BEGIN
    for title_record in title_cursor
    loop
      update title set rating = p_rating
      where current of title_cursor;
    end loop;
  END update_rating;

  PROCEDURE add_member(
    p_first_name member.first_name%TYPE,
    p_last_name member.last_name%TYPE,
    p_address member.address%TYPE,
    p_city member.city%TYPE,
    p_phone member.phone%TYPE,
    p_join_date member.join_date%TYPE)
  IS
  BEGIN
    INSERT INTO member(member_id, first_name, last_name, address, city, phone, join_date)
    VALUES (member_id_seq.NEXTVAL, p_first_name, p_last_name, p_address, p_city, p_phone,
      p_join_date);
    DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' member row.');
  END add_member;

  PROCEDURE add_member(
    p_first_name member.first_name%TYPE,
    p_last_name member.last_name%TYPE,
    p_address member.address%TYPE,
    p_city member.city%TYPE,
    p_phone member.phone%TYPE,
    p_join_date VARCHAR2)
  IS
  BEGIN
    add_member(p_first_name, p_last_name, p_address, p_city, p_phone,
      TO_DATE(p_join_date, 'DD-MON-YYYY'));
  END add_member;

  FUNCTION check_member(p_first_name member.first_name%TYPE,
      p_last_name member.last_name%TYPE) 
  RETURN member.member_id%TYPE
  IS
    v_member_id member.member_id%TYPE;
  BEGIN
    select member_id into v_member_id from member
        where last_name = p_last_name and first_name = p_first_name;
    return v_member_id;
  EXCEPTION
    when no_data_found then
      return 0;
    when too_many_rows then
      return 0;
  END check_member;

  FUNCTION get_member(p_first_name member.first_name%TYPE,
      p_last_name member.last_name%TYPE) 
  RETURN member%ROWTYPE
  IS
    v_member member%ROWTYPE;
  BEGIN
    select * into v_member from member
        where last_name = p_last_name and first_name = p_first_name;
    return v_member;
  EXCEPTION
    when no_data_found then
      return NULL;
    when too_many_rows then
      return NULL;
  END get_member;

END package_movies;
/