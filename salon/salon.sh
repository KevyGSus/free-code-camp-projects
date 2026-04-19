#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -At -c"

MAIN_MENU() {
if [[ $1 ]]
  then
    echo $1
fi
echo -e "\nWhich service would you like to book?"
echo -e "$($PSQL "SELECT * FROM services")" | sed 's/|/) /'
read SERVICE_ID_SELECTED
if [[ ! $SERVICE_ID_SELECTED =~ [0-9]+ ]]
  then
    MAIN_MENU "Please select a number."
  else
    SERVICE_CHECK="$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")"
    if [[ -z $SERVICE_CHECK ]]
      then
        MAIN_MENU "Service not found."
      else
        echo -e "\nWhat is your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")"
        echo $CUSTOMER_NAME
        if [[ -z $CUSTOMER_NAME ]]
          then
            echo -e "\nWhat is your name?"
            read CUSTOMER_NAME
            echo "$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")"
        fi
      echo -e "\nWhat time would you like to book for?"
      read SERVICE_TIME
      CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")"
      INSERT="$($PSQL "INSERT into appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")"
      echo -e "I have put you down for a $SERVICE_CHECK at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
fi
}

MAIN_MENU