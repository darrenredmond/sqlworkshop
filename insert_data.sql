
insert into title(title_id, title, description, rating, category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Willie and Christmas Too',
'All of Willie''s friends make a Christmas list for
Santa, but Willie has yet to add his own wish list.',
'G', 'CHILD', TO_DATE('05-OCT-1995','DD-MON-YYYY'));

INSERT INTO title(title_id , title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Alien Again', 'Yet another
installment of science fiction history. Can the
heroine save the planet from the alien life form?',
'R', 'SCIFI', TO_DATE( '19-MAY-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'The Glob', 'A meteor crashes
near a small American town and unleashes carnivorous
goo in this classic.', 'NR', 'SCIFI',
TO_DATE( '12-AUG-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'My Day Off', 'With a little
luck and a lot ingenuity, a teenager skips school for
a day in New York.', 'PG', 'COMEDY',
TO_DATE( '12-JUL-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Miracles on Ice', 'A six-year-old has doubts
about Santa Claus, but she
discovers that miracles
really do exist.', 'PG', 'DRAMA',
TO_DATE( '12-SEP-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Soda Gang', 'After discovering a cache
of drugs, a young couple
find themselves pitted
against a vicious gang.', 'NR', 'ACTION',
TO_DATE( '01-JUN-1995','DD-MON-YYYY'));

INSERT INTO member(member_id, first_name, last_name, address,
city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Carmen', 'Velasquez',
'283 King Street', 'Seattle', '206-899-6666', TO_DATE('08-MAR-1990',
'DD-MON-YYYY'));

INSERT INTO member(member_id, first_name, last_name, address,
city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'LaDoris', 'Ngao',
'5 Modrany', 'Bratislava', '586-355-8882', TO_DATE('08-MAR-1990',
'DD-MON-YYYY'));

INSERT INTO member(member_id, first_name, last_name, address,
city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Midori', 'Nagayama',
'68 Via Centrale', 'Sao Paolo', '254-852-5764', TO_DATE('17-JUN-1991',
'DD-MON-YYYY'));
  
INSERT INTO member(member_id, first_name, last_name, address,
city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Mark', 'Quick-toSee',
'6921 King Way', 'Lagos', '63-559-7777', TO_DATE('07-APR-1990',
'DD-MON-YYYY'));

INSERT INTO member(member_id, first_name, last_name, address,
city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Audry', 'Ropeburn',
'86 Chu Street', 'Hong Kong', '41-559-87', TO_DATE('18-JAN-1991',
'DD-MON-YYYY'));

INSERT INTO member(member_id, first_name, last_name, address,
city, phone, join_date)
VALUES (member_id_seq.NEXTVAL, 'Molly', 'Urguhart',
'3035 Laurier', 'Quebec', '418-542-9988', TO_DATE('18-JAN-1991',
'DD-MON-YYYY'));

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




















