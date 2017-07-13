
ALTER TABLE TEAMS
ADD home_ground NUMBER(10)
UPDATE TEAMS
SET home_ground = 1001
WHERE team_id = 100;
UPDATE TEAMS
SET home_ground = 2001
WHERE team_id = 200;
UPDATE TEAMS
SET home_ground = 3001
WHERE team_id = 300;
UPDATE TEAMS
SET home_ground = 4001
WHERE team_id = 400;
UPDATE TEAMS
SET home_ground = 5001
WHERE team_id = 500;


