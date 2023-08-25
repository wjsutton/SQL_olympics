
DROP TABLE IF EXISTS athletes;
CREATE TABLE athletes  (
  id INT,
  name VARCHAR(100),
  sex VARCHAR(1),
  birth_year INT,
  height INT,
  weight INT
);
INSERT INTO athletes 
SELECT DISTINCT
id,
name,
sex,
year - age as birth_year,
height,
weight
FROM olympics.results;

DROP TABLE IF EXISTS team_members;
CREATE TABLE team_members (
  id INT,
  team VARCHAR(50),
  NOC VARCHAR(3),
  NOC_region VARCHAR(50),
  NOC_notes VARCHAR(30)
);
SELECT DISTINCT
id,
team,
noc,
noc_region,
NOC_notes
FROM olympics.results;

DROP TABLE IF EXISTS events;
CREATE TABLE events (
  event VARCHAR(100),
  sport VARCHAR(25),
  year INT,
  games VARCHAR(20),
  season VARCHAR(6),
  city VARCHAR(25),
  id INT,
  medal VARCHAR(6)
);
SELECT DISTINCT
event,
sport,
year,
games,
season,
city,
id,
medal
FROM olympics.results;

-- SELECT COUNT(*) FROM events ;
-- SELECT COUNT(*) FROM team_members ;
-- SELECT COUNT(*) FROM athletes ;
-- SELECT COUNT(*) FROM results ;