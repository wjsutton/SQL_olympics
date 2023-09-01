CREATE TABLE my_viz
SELECT DISTINCT
NOC_region,
year,
a.sex,
e.event,
sport
FROM results as r
INNER JOIN teams as t on t.team_id = r.team_id
INNER JOIN athletes as a on a.athlete_id = r.athlete_id
INNER JOIN games as g on g.games_id = r.games_id
INNER JOIN events as e on e.event_id = r.event_id
WHERE medal='Gold';
