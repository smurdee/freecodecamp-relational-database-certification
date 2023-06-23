#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# TRUNCARE all old data
echo "$($PSQL "DROP TABLE games, teams")"
# Create teams tables
echo $($PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY, name VARCHAR(20) UNIQUE NOT NULL)")
# Create games table
echo $($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY,
year INT NOT NULL, round VARCHAR(20) NOT NULL,
winner_id INT NOT NULL REFERENCES teams(team_id),
opponent_id INT NOT NULL REFERENCES teams(team_id),
winner_goals INT NOT NULL,
opponent_goals INT NOT NULL)")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # add team
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $WINNER_ID ]]
    then
      echo $($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
    if [[ -z $OPPONENT_ID ]]
    then
      echo $($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    echo $($PSQL "INSERT INTO games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

  fi
done