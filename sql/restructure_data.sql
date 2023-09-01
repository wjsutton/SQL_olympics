USE olympics; 

DROP TABLE IF EXISTS athletes;
CREATE TABLE athletes  (
  athlete_id INT,
  name VARCHAR(100),
  sex VARCHAR(1),
  height INT,
  weight INT
);
INSERT INTO athletes
SELECT DISTINCT
id as athlete_id,
name,
sex,
NULLIF(height,'') as height,
NULLIF(weight,'') as weight
FROM olympics.staging;

DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
  team_id INT,
  team VARCHAR(50),
  NOC VARCHAR(3),
  NOC_region VARCHAR(50),
  NOC_notes VARCHAR(30)
);
INSERT INTO teams
SELECT 
ROW_NUMBER() OVER(ORDER BY team) as team_id,
team,
noc,
noc_region,
NOC_notes
FROM (
	SELECT DISTINCT 
	team,
	noc,
	noc_region,
	NOC_notes
	FROM staging
) as teams;

DROP TABLE IF EXISTS games;
CREATE TABLE games (
  games_id INT,
  year INT,
  games VARCHAR(20),
  season VARCHAR(6),
  city VARCHAR(25)
);
INSERT INTO games
SELECT 
ROW_NUMBER() OVER(ORDER BY year, games, season) as games_id,
year,
games,
season,
city
FROM (
	SELECT DISTINCT 
	year,
	games,
	season,
	city
	FROM staging
) as games;

DROP TABLE IF EXISTS events;
CREATE TABLE events (
  event_id INT,
  event VARCHAR(100),
  sport VARCHAR(25)
);
INSERT INTO events
SELECT 
ROW_NUMBER() OVER(ORDER BY event, sport) as event_id,
event,
sport
FROM (
	SELECT DISTINCT 
	event,
	sport
	FROM staging
) as events;

DROP TABLE IF EXISTS results;
CREATE TABLE results (
  athlete_id INT,
  athlete_age INT,
  team_id INT,
  games_id INT,
  event_id INT, 
  medal VARCHAR(6)
);
INSERT INTO results
SELECT DISTINCT
id as athlete_id,
NULLIF(age,'') as athlete_age,
team_id,
games_id,
event_id,
medal
FROM staging as S
INNER JOIN teams as T on T.team = S.team
INNER JOIN games as G on G.games = S.games AND G.year = S.year AND G.season = S.season
INNER JOIN events as E on E.event = S.event AND E.sport = S.sport;

ALTER TABLE athletes ADD PRIMARY KEY(athlete_id);
ALTER TABLE teams ADD PRIMARY KEY(team_id);
ALTER TABLE games ADD PRIMARY KEY(games_id);
ALTER TABLE events ADD PRIMARY KEY(event_id);

ALTER TABLE results ADD FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id);
ALTER TABLE results ADD FOREIGN KEY (team_id) REFERENCES teams(team_id);
ALTER TABLE results ADD FOREIGN KEY (games_id) REFERENCES games(games_id);
ALTER TABLE results ADD FOREIGN KEY (event_id) REFERENCES events(event_id);
