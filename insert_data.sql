
BEGIN
  add_title('Star Wars', 'Best Movie Ever.', 'G', 'CHILD', TO_DATE('05-JULY-1977','DD-MON-YYYY'));
  add_title('Willie and Christmas Too',
    'All of Willie''s friends make a Christmas list for Santa, but Willie has yet to add his own wish list.',
    'G', 'CHILD', TO_DATE('05-OCT-1995','DD-MON-YYYY'));
  add_title('Alien Again', 'Yet another installment of science fiction history. Can the heroine save the planet from the alien life form?',
    'R', 'SCIFI', TO_DATE( '19-MAY-1995','DD-MON-YYYY'));
  add_title('The Glob', 'A meteor crashes near a small American town and unleashes carnivorous goo in this classic.',
    'NR', 'SCIFI', TO_DATE( '12-AUG-1995','DD-MON-YYYY'));
  add_title('My Day Off', 'With a little luck and a lot ingenuity, a teenager skips school for a day in New York.',
    'PG', 'COMEDY', TO_DATE( '12-JUL-1995','DD-MON-YYYY'));
  add_title('Miracles on Ice', 'A six-year-old has doubts about Santa Claus, but she discovers that miracles really do exist.',
    'PG', 'DRAMA', TO_DATE( '12-SEP-1995','DD-MON-YYYY'));
  add_title('Soda Gang', 'After discovering a cache of drugs, a young couple find themselves pitted against a vicious gang.',
    'NR', 'ACTION', TO_DATE( '01-JUN-1995','DD-MON-YYYY'));
  package_movies.add_member('Carmen', 'Velasquez', '283 King Street', 'Seattle', '206-899-6666', TO_DATE('08-MAR-1990', 'DD-MON-YYYY'));
  package_movies.add_member('LaDoris', 'Ngao', '5 Modrany', 'Bratislava', '586-355-8882', TO_DATE('08-MAR-1990', 'DD-MON-YYYY'));
  package_movies.add_member('Midori', 'Nagayama', '68 Via Centrale', 'Sao Paolo', '254-852-5764', TO_DATE('17-JUN-1991', 'DD-MON-YYYY'));
  package_movies.add_member('Mark', 'Quick-toSee', '6921 King Way', 'Lagos', '63-559-7777', TO_DATE('07-APR-1990', 'DD-MON-YYYY'));
  package_movies.add_member('Audry', 'Ropeburn', '86 Chu Street', 'Hong Kong', '41-559-87', TO_DATE('18-JAN-1991', 'DD-MON-YYYY'));
  package_movies.add_member('Molly', 'Urguhart', '3035 Laurier', 'Quebec',
    '418-542-9988', TO_DATE('18-JAN-1991', 'DD-MON-YYYY'));

  package_movies.add_member('Molly', 'Urguhart', '3035 Laurier', 'Quebec',
    '418-542-9988', TO_DATE('18-JAN-1991', 'DD-MON-YYYY'));
END;
/

SET SERVEROUTPUT ON
BEGIN
  package_movies.add_member('Darren', 'Redmond', '3035 Laurier', 'Quebec',
    '418-542-9988', TO_DATE('18-JAN-1991', 'DD-MON-YYYY'));

  package_movies.add_member('Mark', 'Redmond', '3035 Laurier', 'Quebec',
    '418-542-9988', '18-JAN-1991');
END;
/

--(select title_id from title where title = 'Willie and Christmast Too');

INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 1, 'AVAILABLE');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 2, 'AVAILABLE');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 2, 'RENTED');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 3, 'AVAILABLE');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 4, 'AVAILABLE');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 4, 'AVAILABLE');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 4, 'RENTED');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 5, 'AVAILABLE');
INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_Id_Seq.NEXTVAL, 6, 'AVAILABLE');

INSERT INTO Rental(rental_id, member_id, copy_id, book_date,
exp_return_date, act_return_date)
VALUES(rental_id_seq.NEXTVAL, 1, 1, sysdate - 3, sysdate - 1, sysdate - 2);

INSERT INTO Rental(rental_id, member_id, copy_id, book_date,
exp_return_date, act_return_date)
VALUES(rental_id_seq.NEXTVAL, 1, 3, sysdate - 1, sysdate + 1, null);

INSERT INTO Rental(rental_id, member_id, copy_id, book_date,
exp_return_date, act_return_date)
VALUES(rental_id_seq.NEXTVAL, 2, 7, sysdate - 2, sysdate, sysdate);

INSERT INTO Rental(rental_id, member_id, copy_id, book_date,
exp_return_date, act_return_date)
VALUES(rental_id_seq.NEXTVAL, 6, 9, sysdate - 4, sysdate - 2, sysdate - 2);

INSERT INTO title(title_id , title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Interstellar War', 'Historical Interstellar action movie.',
'PG', 'SCIFI', TO_DATE( '07-JUL-1977','DD-MON-YYYY'));

INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_id_seq.NEXTVAL,
  (select title_id from title where title = 'Interstellar War'),
'AVAILABLE');

UPDATE Title set title = 'Interstellar Wars'
where title = 'Interstellar War';

INSERT INTO Title_Copy(copy_id, title_id, status)
VALUES(Title_Copy_id_seq.NEXTVAL, 7, 'AVAILABLE');

INSERT INTO Reservation(reservation_id, res_date, member_id, title_id)
VALUES (reservation_id_seq.NEXTVAL, SYSDATE,
  (select member_id from member where first_name = 'Carmen'
    and last_name = 'Velasquez'),
  (select title_id from title where title = 'Interstellar Wars')
);

INSERT INTO Reservation(reservation_id, res_date, member_id, title_id)
VALUES (reservation_id_seq.NEXTVAL, SYSDATE,
  (select member_id from member where first_name = 'Mark'
    and lower(last_name) = 'quick-tosee'),
  (select title_id from title where title = 'Soda Gang')
);










