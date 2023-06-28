#!/bin/bash
PSQL="psql -X -t --username=freecodecamp --dbname=salon -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

# show list of services offered
SERVICES_OFFERED () {
  if [[ $1 ]]
  then
    echo -e "$1"
  fi

  SERVICES_OFFERED=$($PSQL "SELECT * FROM services")
  echo "$SERVICES_OFFERED" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  if [[ -z $SERVICE_NAME_SELECTED ]]
  then
    SERVICES_OFFERED "\nI could not find that service. What would you like today?"
  else
    VERIFY_CUSTOMER
  fi
}

VERIFY_CUSTOMER () {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
  BOOK_APPOINTMENT
}

BOOK_APPOINTMENT () {
  echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES ('$SERVICE_TIME', '$CUSTOMER_ID', '$SERVICE_ID_SELECTED')")
  echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

SERVICES_OFFERED "Welcome to My Salon, how can I help you?\n"