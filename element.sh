#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

MAIN () {
  if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
    exit 0
  elif [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = '$1'")
    read ATOMIC_NUMBER BAR SYMBOL BAR NAME <<< $ELEMENT_DATA
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
  then
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE symbol = '$1'")
    read ATOMIC_NUMBER BAR SYMBOL BAR NAME <<< $ELEMENT_DATA
  elif [[ $1 =~ ^[a-zA-Z]+$ ]]
  then
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE name = '$1'")
    read ATOMIC_NUMBER BAR SYMBOL BAR NAME <<< $ELEMENT_DATA
  fi

  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
  else
    PROPERTIES_DATA=$($PSQL "SELECT type_id, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties WHERE atomic_number = '$ATOMIC_NUMBER'")
    read TYPE_ID BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT <<< $PROPERTIES_DATA
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id='$TYPE_ID'")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a$TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

MAIN $1