
describe member;
describe title;
describe title_copy;
describe rental;
describe reservation;

select * from Member;

select * from Title;

select * from Title_Copy;

select * from Rental;

select * from Reservation;

select * from user_constraints
where table_name in ('MEMBER', 'TITLE', 'TITLE_COPY', 'RENTAL', 'RESERVATION');

select * from user_sequences
where sequence_name in ('MEMBER_ID_SEQ', 'TITLE_ID_SEQ', 'TITLE_COPY_ID_SEQ',
    'RENTAL_ID_SEQ', 'RESERVATION_ID_SEQ');

select * from title_avail;
