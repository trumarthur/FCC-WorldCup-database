#!/bin/bash

# Query 1: Total number of goals in all games from winning teams
echo "Total number of goals in all games from winning teams:"
$($PSQL "SELECT SUM(winner_goals) FROM games;")

# Query 2: Total number of goals in all games from both teams combined
echo "Total number of goals in all games from both teams combined:"
$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games;")

# Query 3: Average number of goals in all games from the winning teams
echo "Average number of goals in all games from the winning teams:"
$($PSQL "SELECT AVG(winner_goals) FROM games;")

# Query 4: Average number of goals in all games from the winning teams rounded to two decimal places
echo "Average number of goals in all games from the winning teams rounded to two decimal places:"
$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")

# Query 5: Average number of goals in all games from both teams
echo "Average number of goals in all games from both teams:"
$($PSQL "SELECT ROUND(AVG(winner_goals + opponent_goals), 2) FROM games;")

# Query 6: Most goals scored in a single game by one team
echo "Most goals scored in a single game by one team:"
$($PSQL "SELECT MAX(winner_goals) FROM games;")

# Query 7: Number of games where the winning team scored more than two goals
echo "Number of games where the winning team scored more than two goals:"
$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2;")

# Query 8: Winner of the 2018 tournament team name
echo "Winner of the 2018 tournament team name:"
$($PSQL "SELECT teams.name FROM teams JOIN games ON games.winner_id = teams.team_id WHERE games.year = 2018 AND games.round = 'Final';")

# Query 9: List of teams who played in the 2014 'Eighth-Final' round
echo "List of teams who played in the 2014 'Eighth-Final' round:"
$($PSQL "SELECT DISTINCT teams.name FROM teams JOIN games ON teams.team_id = games.winner_id WHERE games.year = 2014 AND games.round = 'Eighth-Final'
        UNION
        SELECT DISTINCT teams.name FROM teams JOIN games ON teams.team_id = games.opponent_id WHERE games.year = 2014 AND games.round = 'Eighth-Final';")

# Query 10: List of unique winning team names in the whole data set
echo "List of unique winning team names in the whole data set:"
$($PSQL "SELECT DISTINCT teams.name FROM teams JOIN games ON games.winner_id = teams.team_id;")

# Query 11: Year and team name of all the champions
echo "Year and team name of all the champions:"
$($PSQL "SELECT games.year, teams.name FROM games JOIN teams ON games.winner_id = teams.team_id WHERE games.round = 'Final';")

# Query 12: List of teams that start with 'Co'
echo "List of teams that start with 'Co':"
$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%';")

