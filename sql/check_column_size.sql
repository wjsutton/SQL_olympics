SELECT
MAX(LENGTH(name)),
MAX(LENGTH(sex)),
MAX(LENGTH(team)),
MAX(LENGTH(noc)),
MAX(LENGTH(noc_region)),
MAX(LENGTH(NOC_notes)),
MAX(LENGTH(event)),
MAX(LENGTH(city)),
MAX(LENGTH(season)),
MAX(LENGTH(sport)),
MAX(LENGTH(games)),
MAX(LENGTH(medal))
FROM olympics.staging;