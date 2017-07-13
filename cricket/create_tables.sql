
CREATE TABLE TEAMS(
 team_id     NUMBER(10) 
             CONSTRAINT teams_team_id_pk PRIMARY KEY,
 team_name   VARCHAR2(40)
             CONSTRAINT teams_team_name_nn NOT NULL,
 coach       VARCHAR2(30));
 
 
CREATE TABLE PLAYERS(
 position    NUMBER(20),
 players_id  NUMBER(10)
             CONSTRAINT players_players_id_pk PRIMARY KEY,
 first_name  VARCHAR2(20),
 last_name   VARCHAR2(30),
 country     VARCHAR2(20),
 role        VARCHAR2(30) NOT NULL
             CONSTRAINT players_role_ck
             CHECK(role IN ('Batsman','Bowler','Allrounder')),
 team_id     NUMBER(10)
             CONSTRAINT players_team_id_fk REFERENCES teams(team_id),
 birth_date  DATE);
        
            
CREATE TABLE VENUES( 
 venue_id      NUMBER(10)
               CONSTRAINT venues_venue_id_pk PRIMARY KEY,
 stadium_name  VARCHAR2(30),  
 team_id       NUMBER(10)
               CONSTRAINT venues_team_id_fk REFERENCES teams(team_id),
 city          VARCHAR2(20),
 capacity      NUMBER(10));
 
 
CREATE TABLE CAPTAINS(
 captains_id VARCHAR2(40)
             CONSTRAINT captains_captains_id_pk PRIMARY KEY,
 players_id  NUMBER(10) NOT NULL
             CONSTRAINT captains_players_id_fk REFERENCES players(players_id),
 team_id     NUMBER(10) NOT NULL
             CONSTRAINT captains_team_id_fk REFERENCES teams(team_id));
 
 
CREATE TABLE WICKETKEEPERS(
  wicketkeepers_id VARCHAR2(100)
                   CONSTRAINT wicketkeepers_wkt_id_pk PRIMARY KEY,
  players_id       NUMBER(10)
                   CONSTRAINT wicketkeepers_players_id_fk REFERENCES 
                   players(players_id),
  team_id          NUMBER(10) NOT NULL
                   CONSTRAINT wicketkeepers_team_id_fk REFERENCES teams(team_id));


CREATE TABLE MATCHES(
  match_id	      NUMBER(10)
                  CONSTRAINT matches_match_id_pk PRIMARY KEY,              
  team_id_home	  NUMBER(10)
                  CONSTRAINT matches_team_id_home_fk REFERENCES teams(team_id),
  team_id_away	  NUMBER(10)
                  CONSTRAINT matches_team_id_away_fk REFERENCES teams(team_id),
  venue_id	      NUMBER(10)
                  CONSTRAINT matches_venue_id_fk REFERENCES venues(venue_id),
  match_date_time DATE );
  
  
CREATE TABLE RESULTS(
   result_id       VARCHAR2(100)
                   CONSTRAINT results_result_id_pk PRIMARY KEY,
   match_id	       NUMBER(10)
                   CONSTRAINT results_match_id_fk REFERENCES matches(match_id),
   match_result    VARCHAR2(100),
   toss_won        VARCHAR2(30));
  
  
CREATE TABLE home_team_score(
      match_id	  NUMBER(10)
                  CONSTRAINT home_team_score_match_id_fk REFERENCES matches(match_id),
      result_id   VARCHAR2(100)
                  CONSTRAINT home_team_score_result_id_fk REFERENCES results(result_id),          
      runs        NUMBER(10),
      wickets     NUMBER(10),
      overs       NUMBER(10,2),
      total_overs NUMBER(10,2));
      
      
CREATE TABLE away_team_score(
      match_id	  NUMBER(10)
                  CONSTRAINT away_team_score_match_id_fk REFERENCES matches(match_id),
      result_id   VARCHAR2(100)
                  CONSTRAINT away_team_score_result_id_fk REFERENCES results(result_id),           
      runs        NUMBER(10),
      wickets     NUMBER(10),
      overs       NUMBER(10,2),
      total_overs NUMBER(10,2));
   
   
CREATE TABLE POINTS_TABLE(
  team_id      NUMBER(10)
               CONSTRAINT points_table_team_id_fk REFERENCES teams(team_id),
  match_played NUMBER(10),           
  match_won    NUMBER(10),
  match_lost   NUMBER(10),
  tie          NUMBER(10),
  points       NUMBER(10));
