
CREATE TABLE Member(
  member_id number(10) PRIMARY KEY,
  last_name varchar2(25) NOT NULL,
  first_name varchar2(25),
  address varchar2(100),
  city varchar2(30),
  phone varchar2(15),
  join_date date default sysdate NOT NULL
);

CREATE TABLE Title(
  title_id number(10) PRIMARY KEY,
  title varchar2(60) NOT NULL,
  description varchar2(400) NOT NULL,
  rating varchar2(4) CONSTRAINT title_rating_ck CHECK
      (rating in ('G', 'PG', 'R', 'NC17', 'NR')),
  category varchar2(20) CONSTRAINT title_category_ck CHECK
      (category in ('ACTION', 'SCIFI', 'CHILD', 'DOCUMENTARY',
          'DRAMA', 'COMEDY')),
  release_date date
);

create TABLE Title_Copy(
  copy_id number(10) PRIMARY KEY,
  title_id number(10) NOT NULL CONSTRAINT title_copy_title_id_fk
      REFERENCES Title(Title_id),
  status varchar2(15) CONSTRAINT title_copy_status_ck CHECK
      (status in ('RENTED', 'AVAILABLE', 'RESERVED', 'DESTROYED'))
);

create TABLE Rental(
  rental_id number(10) PRIMARY KEY,
  book_date date default sysdate not null,
  member_id number(10) NOT NULL CONSTRAINT rental_member_id_fk
      REFERENCES Member(Member_id),
  copy_id number(10) NOT NULL CONSTRAINT rental_copy_id_fk
      REFERENCES Title_Copy(Copy_id),
  act_return_date date,
  exp_return_date date DEFAULT SYSDATE + 2
);
  
create TABLE Reservation(
  reservation_id number(10) PRIMARY KEY,
  res_date date,
  member_id number(10) NOT NULL CONSTRAINT reservation_member_id_fk
      REFERENCES Member(Member_id),
  title_id number(10) NOT NULL CONSTRAINT reservation_title_id_fk
      REFERENCES Title(Title_id)
);

create sequence member_id_seq nocache;
create sequence title_id_seq nocache;
create sequence title_copy_id_seq nocache;
create sequence rental_id_seq nocache;
create sequence reservation_id_seq nocache;
