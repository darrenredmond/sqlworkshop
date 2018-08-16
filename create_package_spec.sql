CREATE OR REPLACE PACKAGE package_movies
IS

  PROCEDURE add_title(
    p_title title.title%TYPE,
    p_description title.description%TYPE,
    p_rating title.rating%TYPE,
    p_category title.category%TYPE,
    p_release_date title.release_date%TYPE);

  PROCEDURE update_rating(
    p_title title.title%TYPE,
    p_rating title.rating%TYPE);

  PROCEDURE add_member(
    p_first_name member.first_name%TYPE,
    p_last_name member.last_name%TYPE,
    p_address member.address%TYPE,
    p_city member.city%TYPE,
    p_phone member.phone%TYPE,
    p_join_date member.join_date%TYPE);

  PROCEDURE add_member(
    p_first_name member.first_name%TYPE,
    p_last_name member.last_name%TYPE,
    p_address member.address%TYPE,
    p_city member.city%TYPE,
    p_phone member.phone%TYPE,
    p_join_date VARCHAR2);

  FUNCTION check_member(
    p_first_name member.first_name%TYPE,
    p_last_name member.last_name%TYPE) 
  RETURN member.member_id%TYPE;

  FUNCTION get_member(p_first_name member.first_name%TYPE,
      p_last_name member.last_name%TYPE) 
  RETURN member%ROWTYPE;

END package_movies;
/