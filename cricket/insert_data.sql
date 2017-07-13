BEGIN
INSERT INTO teams(
 team_id,team_name,coach)
   VALUES (team_id_seq.NEXTVAL,'Mumbai Indians','Ricky Ponting');
   INSERT INTO teams 
   VALUES (team_id_seq.NEXTVAL,'Royal Challengers Banglore','Daniel Vittori');
   INSERT INTO teams        
   VALUES (team_id_seq.NEXTVAL,'Delhi Daredevil','Paddy Upton');
   INSERT INTO teams 
   VALUES (team_id_seq.NEXTVAL,'Kolkata knight Riders','Jacques Kallis');
   INSERT INTO teams        
   VALUES (team_id_seq.NEXTVAL,'Sunrise Hyderabad','Tom Moddy');
END;
/

BEGIN
   INSERT INTO players(
   position,players_id,first_name,last_name,country,role,team_id,birth_date)
   VALUES(1,101,'Sachin','Tendulkar','India','Batsman','100',TO_DATE('24/04/1973','DD-MM-RR'));
   INSERT INTO players
   VALUES(2,102,'Rohit','Sharma','India','Batsman','100',TO_DATE('30/04/1987','DD-MM-RR'));
   INSERT INTO players
   VALUES(3,103,'Lendl','Simmons','West Indies','Batsman','100',TO_DATE('25/01/1985','DD-MM-RR'));
   INSERT INTO players
   VALUES (4,104,'Ambati','Rayudu','India','Batsman','100',TO_DATE('23/09/1985','DD-MM-RR'));
   INSERT INTO players
   VALUES(5,105,'Hardik','Pandya','India','Allrounder','100',TO_DATE('11/10/1993','DD-MM-RR'));
   INSERT INTO players
   VALUES(6,106,'keiron','Pollard','West Indies','Allrounder','100',TO_DATE('12/05/1987','DD-MM-RR'));
   INSERT INTO players
   VALUES(7,107,'Krunal','Pandya','India','Allrounder','100',TO_DATE('24/04/1991','DD-MM-RR'));
   INSERT INTO players
   VALUES(8,108,'Jos','Butler','England','Batsman','100',TO_DATE('08/09/1990','DD-MM-RR'));
   INSERT INTO players
   VALUES(9,109,'Harbajan','Singh','India','Bowler','100',TO_DATE('03/07/1980','DD-MM-RR'));
   INSERT INTO players
   VALUES(10,110,'Jasprit','Bumrah','India','Bowler','100',TO_DATE('06/12/1993','DD-MM-RR'));
   INSERT INTO players
   VALUES(11,111,'Lasith','Malinga','Srilanka','Bowler','100',TO_DATE('28/08/1983','DD-MM-RR'));
   INSERT INTO players
   VALUES(1,201,'Virat','kohli','India','Batsman','200',TO_DATE('05/11/1988','DD-MM-RR'));
   INSERT INTO players
   VALUES(2,202,'Chris','Gayle','West Indies','Batsman','200',TO_DATE('21/09/1979','DD-MM-RR'));
   INSERT INTO players
   VALUES(3,203,'Ab','de Villiers','South Africa','Batsman','200',TO_DATE('17/02/1984','DD-MM-RR'));
   INSERT INTO players
   VALUES(4,204,'shane','Watson','Australia','Allrounder','200',TO_DATE('17/06/1981','DD-MM-RR'));
   INSERT INTO players
   VALUES(5,205,'Sachin','baby','India','Batsman','200',TO_DATE('18/12/1988','DD-MM-RR'));
   INSERT INTO players
   VALUES(6,206,'Stuart','Binny','India','Allrounder','200',TO_DATE('03/06/1984','DD-MM-RR'));
   INSERT INTO players
   VALUES(7,207,'Sarfaraz','Khan','India','Bowler','200',TO_DATE('22/10/1997','DD-MM-RR'));
   INSERT INTO players
   VALUES(8,208,'kane','Richardson','Australia','Bowler','200',TO_DATE('12/02/1991','DD-MM-RR'));
   INSERT INTO players
   VALUES(9,209,'Tabraiz','Shamsi','India','Bowler','200',TO_DATE('18/02/1990','DD-MM-RR'));
   INSERT INTO players
   VALUES(10,210,'Yuzvendra','Chahal','India','Bowler','200',TO_DATE('23/07/1990','DD-MM-RR'));
   INSERT INTO players
   VALUES(11,211,'Varun','Aaron','India','Bowler','200',TO_DATE('29/10/1989','DD-MM-RR'));
   INSERT INTO players
   VALUES(1,301,'Quinton','de cock','South Africa','Batsman','300',TO_DATE('17/12/1992','DD-MM-RR'));
   INSERT INTO players
   VALUES(2,302,'Sanju','Samson','India','Batsman','300',TO_DATE('11/11/1994','DD-MM-RR'));
   INSERT INTO players
   VALUES(3,303,'JP','Duminy','South Africa','Batsman','300',TO_DATE('14/04/1984','DD-MM-RR'));
   INSERT INTO players
   VALUES(4,304,'Rishab','Pant','India','Batsman','300',TO_DATE('04/10/1997','DD-MM-RR'));
   INSERT INTO players
   VALUES(5,305,'karun','Nair','India','Batsman','300',TO_DATE('06/12/1991','DD-MM-RR'));
   INSERT INTO players
   VALUES(6,306,'Carlos','Brathwaite','West Indies','Allrounder','300',TO_DATE('18/07/1988','DD-MM-RR'));
   INSERT INTO players
   VALUES(7,307,'Chris','Morris','South Africa','Bowler','300',TO_DATE('30/04/1987','DD-MM-RR'));
   INSERT INTO players
   VALUES(8,308,	'Zaheer','Khan','India','Bowler','300',TO_DATE('07/10/1978','DD-MM-RR'));
   INSERT INTO players
   VALUES(9,309,'Amit','Mishra','India','Bowler','300',TO_DATE('24/11/1982','DD-MM-RR'));
   INSERT INTO players
   VALUES(10,310,'Imran','Tahir','South Africa','Bowler','300',TO_DATE ('27/03/1979','DD-MM-RR'));
   INSERT INTO players
   VALUES(11,311,'Mohammed','Shami','India','Bowler','300',TO_DATE('09/03/1990','DD-MM-RR'));
   INSERT INTO players
   VALUES(1,401,'Gautam','Gambhir','India','Batsman','400',TO_DATE('14/10/1981','DD-MM-RR'));
   INSERT INTO players
   VALUES(2,402,'Robin','Uttappa','India','Batsman','400',TO_DATE('11/11/1985','DD-MM-RR'));
   INSERT INTO players
   VALUES(3,403,'Manish','Pandey','India','Batsman','400',TO_DATE('10/09/1989','DD-MM-RR'));
   INSERT INTO players
   VALUES(4,404,'Yusuf','Pathan','India','Batsman','400',TO_DATE('07/11/1982','DD-MM-RR'));
   INSERT INTO players
   VALUES(5,405,'Surya Kumar','Yadav','India','Batsman','400',TO_DATE('14/09/1990','DD-MM-RR'));
   INSERT INTO players
   VALUES(6,406,'Rajagopal','Sathish','India','Allrounder','400',TO_DATE('14/01/1981','DD-MM-RR'));
   INSERT INTO players
   VALUES(7,407,'Morne','Morkel','South Africa','Allrounder','400',TO_DATE('06/10/1984','DD-MM-RR'));
   INSERT INTO players
   VALUES(8,408,'Shakib','Al Hasan','Bangladesh','Allrounder','400',TO_DATE('24/03/1987','DD-MM-RR'));
   INSERT INTO players
   VALUES(9,409,'Shaun','Tait','Australia','Bowler','400',TO_DATE('22/02/1983','DD-MM-RR'));
   INSERT INTO players
   VALUES(10,410,'Piyush','Chawla','India','Bowler','400',TO_DATE('24/12/1988','DD-MM-RR'));
   INSERT INTO players
   VALUES(11,411,'Sunil','Narine','West Indies','Bowler','400',TO_DATE('26/05/1988','DD-MM-RR'));
   INSERT INTO players
   VALUES(1,501,'David','Warner','Australia','Batsman','500',TO_DATE('27/10/1986','DD-MM-RR'));
   INSERT INTO players
   VALUES(2,502,'Shikhar','Dhawan','India','Batsman','500',TO_DATE('05/12/1985','DD-MM-RR'));
   INSERT INTO players
   VALUES(3,503,'Naman','Ojha','India','Batsman','500',TO_DATE('20/07/1983','DD-MM-RR'));
   INSERT INTO players
   VALUES(4,504,'Yuvraj','Singh','India','Allrounder','500',TO_DATE('12/12/1981','DD-MM-RR'));
   INSERT INTO players
   VALUES(5,505,'Moises','Henriques','Australia','Allrounder','500',TO_DATE('01/02/1987','DD-MM-RR'));
   INSERT INTO players
   VALUES(6,506,'Deepak','Hooda','India','Allrounder','500',TO_DATE('19/04/1995','DD-MM-RR'));
   INSERT INTO players
   VALUES(7,507,'Eoin','Morgan','England','Batsman','500',TO_DATE('10/09/1986','DD-MM-RR'));
   INSERT INTO players
   VALUES(8,508,'Bhuvaneshwar','Kumar','India','Bowler','500',TO_DATE('05/12/1990','DD-MM-RR'));
   INSERT INTO players
   VALUES(9,509,'Karn','Sharma','India','Bowler','500',TO_DATE('23/10/1987','DD-MM-RR'));
   INSERT INTO players
   VALUES(10,510,'Trent','Bolt','New Zealand','Bowler','500',TO_DATE('22/07/1989','DD-MM-RR'));
   INSERT INTO players
   VALUES(11,511,'Ashish','Nehra','India','Bowler','500',TO_DATE('29/04/1979','DD-MM-RR'));
END;   
/

BEGIN 
  INSERT INTO venues( 
  venue_id,stadium_name,team_id,city,capacity)
  VALUES(venue_id_seq.NEXTVAL,'Wankhade stadium',team_id_seq.NEXTVAL,'Mumbai',33108); 
  INSERT INTO venues
  VALUES(venue_id_seq.NEXTVAL,'M Chinnaswamy stadium',team_id_seq.NEXTVAL,'Banglore',40000);
  INSERT INTO venues
  VALUES(venue_id_seq.NEXTVAL,'Feroz Shah Kotla',team_id_seq.NEXTVAL,'Delhi',41820);
  INSERT INTO venues
  VALUES(venue_id_seq.NEXTVAL,'Eden Gardens',team_id_seq.NEXTVAL,'Kolkata',66349);
  INSERT INTO venues
  VALUES(venue_id_seq.NEXTVAL,'Rajiv Gandhi International',team_id_seq.NEXTVAL,'Hyderabad',65000);
END; 
/


BEGIN
   INSERT INTO captains(
   captains_id,players_id,team_id)
   VALUES('C1',101,team_id_seq.NEXTVAL);
   INSERT INTO captains
   VALUES('C2',201,team_id_seq.NEXTVAL);
   INSERT INTO captains
   VALUES('C3',308,team_id_seq.NEXTVAL);
   INSERT INTO captains
   VALUES('C4',401,team_id_seq.NEXTVAL);
   INSERT INTO captains
   VALUES('C5',501,team_id_seq.NEXTVAL);
END; 
/

BEGIN 
     INSERT INTO wicketkeepers(
     wicketkeepers_id,players_id,team_id)
     VALUES('W1',108,team_id_seq.NEXTVAL);
     INSERT INTO wicketkeepers
     VALUES('W2',203,team_id_seq.NEXTVAL);
     INSERT INTO wicketkeepers
     VALUES('W3',301,team_id_seq.NEXTVAL);
     INSERT INTO wicketkeepers
     VALUES('W4',402,team_id_seq.NEXTVAL);
     INSERT INTO wicketkeepers
     VALUES('W5',503,team_id_seq.NEXTVAL);
END; 
/

BEGIN
    INSERT INTO MATCHES (
    match_id,team_id_home,team_id_away,venue_id,match_date_time)
    VALUES(match_id_seq.NEXTVAL,400,300,4001,TO_DATE('02-04-2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,200,100,2001,TO_DATE('03/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,500,200,5001,TO_DATE('09/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,100,400,1001,TO_DATE('10/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,300,100,3001,TO_DATE('16/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,400,500,4001,TO_DATE('17/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,200,400,2001,TO_DATE('23/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,500,300,5001,TO_DATE('24/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,100,500,1001,TO_DATE('30/04/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,300,200,3001,TO_DATE('01/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,300,400,3001,TO_DATE('07/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,100,200,1001,TO_DATE('08/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,200,500,2001,TO_DATE('14/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,400,100,4001,TO_DATE('15/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,100,300,1001,TO_DATE('21/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,500,400,5001,TO_DATE('22/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,400,200,4001,TO_DATE('28/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,300,500,3001,TO_DATE('29/05/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,500,100,5001,TO_DATE('04/06/2016','DD-MM-RR'));
    INSERT INTO MATCHES 
    VALUES(match_id_seq.NEXTVAL,200,300,2001,TO_DATE('05/06/2016','DD-MM-RR'));
END;
/

BEGIN
INSERT INTO RESULTS(
        result_id, match_id, match_result, toss_won)
VALUES  ('R1',match_id_seq.NEXTVAL,'KKR Won By 7 Wickets, with 9 Balls Remaining','DD,who chose to bat');
END;
/

(18.3/20)(20/20)
R2	2	149/9  (20/20)	150/7  (20/20)	MI Won By 1 Run	RCB,Who chose to field.
R3	3	162/7  (20/20)	136/8  (20/20)	SRH Won By 26 Runs	SRH,Who chose to bat.
R4	4	164/6  (20/20)	209/4  (20/20)	KKR Won By 45 Runs	KKR,Who chose to bat.
R5	5	177/6  (20/20)	179/7  (19/20)	MI Won By 3 Wickets (6 Balls Remaining)	MI,Who chose to field.
R6	6	183/3  (20/20)	186/7  (19.2/20)	SRH Won By 3 Wickets (4 Balls Remaining)	KKR,Who chose to bat.
R7	7	177/5  (20/20)	159/7  (20/20)	RCB Won By 18 Runs	RCB,Who chose to bat.
R8	8	166  (20/20)	172/2  (17.2/20)	DD Won By 8 Wickets (16 Balls Remaining)	DD,who chose to field.
R9	9	209/7 (20/20)	191/8 (20/20)	MI Won By 18 Runs	MI,Who chose to bat.
R10	10	191/6 (20/20)	191/6 (20/20)	Match Tied (RCB Won One Over Elliminator)	RCB,Who chose to bat.
R11	11	146/8 (20/20)	149/4 (18/20)	KKR Won By 4 Wickets (12 Balls Remaining)	KKR,Who chose to field.
R12	12	130/9 (20/20)	134/1 (16.1/20)	RCB Won By 9 Wickets (23 Balls Remaining)	RCB,Who chose to field.
R13	13	140/9 (20/20)	150/6 (20/20)	SRH Won By 10 Runs	SRH,Who chose to bat.
R14	14	179/7 (20/20)	187/5 (20/20)	MI Won By 8 Runs	KKR,Who chose to field.
R15	15	165/7 (20/20)	169/5 (19.5/20)	DD Won By 5 Wickets (1 Ball Remaining)	DD,who chose to field.
R16	16	176/4 (20/20)	101/4 (12/12 Target 118)	SRH Won By 16 Runs (D/L Method)	SRH,who chose to bat.
R17	17			                                  No Results (Match abandoned due to rain)	KKR,Who chose to bat.
R18	18	190/4 (20/20)	153/9 (20/20)	DD Won By 37 Runs	DD,who chose to bat.
R19	19	137/8 (20/20)	157/8 (20/200	MI Won By 20 Runs	MI,Who chose to bat.
R20	20	226/3 (20/20)	88  (13.4/20)	RCB Won By 138 Runs	RCB,who chose to bat.
        
select * from results;
select * from home_team_score;
select * from away_team_score;

BEGIN 
INSERT INTO HOME_TEAM_SCORE(
        match_id, result_id, runs, wickets, overs,total_overs)
VALUES (match_id_seq.NEXTVAL, 'R1', 170, 3, 18.3, 20);
END;
/
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R2, 149, 9, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R3, 162, 7, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R4, 164, 6, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R5, 177, 6, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R6, 183, 3, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R7,	177, 5, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R8,	166, 10, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R9,	209, 7 , 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R10, 191, 6, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R11, 146, 8, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R12, 130, 9, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R13, 140, 9, 20  20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R14, 179, 7, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R15, 165, 7, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R16, 176, 4, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R17,	0,  0,  0, 0 );	
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R18, 190, 4, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R19, 137, 8, 20, 20);
INSERT INTO HOME_TEAM_SCORE
VALUES (match_id_seq.NEXTVAL, R20, 226, 3, 20, 20);

BEGIN
INSERT INTO POINTS_TABLE(
          team_id,match_played, match_won, match_lost, tie,	points)
 VALUES (100, 8,	5, 3, 0, 15);
 INSERT INTO POINTS_TABLE
 VALUES (500, 8, 4, 4, 0, 12);
 INSERT INTO POINTS_TABLE
 VALUES (400, 7, 3, 4, 1, 10);
 INSERT INTO POINTS_TABLE
 VALUES (200, 7, 3, 4,	1, 10);
 INSERT INTO POINTS_TABLE
 VALUES (300, 8, 3, 5, 0,	9);
 END;
/




 
