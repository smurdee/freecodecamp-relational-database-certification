#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN () {
  echo "Enter your username:"
  read USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  if [[ -n $USER_ID ]]
  then
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = '$USER_ID'")
    BEST_GAME=$($PSQL "SELECT MIN(tries) FROM games WHERE user_id = '$USER_ID'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    CREATE_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  fi

  RANDOM_NUMBER=$((RANDOM % 1000 + 1))
  GUESS=1001
  COUNTER=0
  # echo $RANDOM_NUMBER #delete after runs
  echo "Guess the secret number between 1 and 1000:"

  while [[ -n $GUESS  ]]
  do
    read GUESS
    COUNTER=$((COUNTER + 1))
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    elif [[ $GUESS -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -eq $RANDOM_NUMBER ]]
    then
      echo "You guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"
      SAVE_GAME=$($PSQL "INSERT INTO games(user_id, tries) VALUES ('$USER_ID', '$COUNTER')")
      exit 0
    fi
  done
}

MAIN