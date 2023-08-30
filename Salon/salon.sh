#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~ \n\nWelcome to My Salon, how can I help you?"

MAINMENU(){
if [[ $1 ]]
then
 echo $1
fi

OPTIONS=$($PSQL "SELECT service_id, name FROM SERVICES")


echo "$OPTIONS" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done

read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
1) 

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

echo -e "\nYou have selected a$SERVICE, What is your phone number?"
read CUSTOMER_PHONE

PHONENUMBER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z "$PHONENUMBER" ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  NEWCUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")  
fi

CUSTOMERID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
GETNAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your$SERVICE,$GETNAME?"
read SERVICE_TIME


APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMERID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo -e "\nI have put you down for a$SERVICE at$SERVICE_TIME,$GETNAME."

;;
2)

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

echo -e "\nYou have selected a$SERVICE, What is your phone number?"
read CUSTOMER_PHONE

PHONENUMBER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z "$PHONENUMBER" ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  NEWCUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")  
fi

CUSTOMERID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
GETNAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your$SERVICE,$GETNAME?"
read SERVICE_TIME


APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMERID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo -e "\nI have put you down for a$SERVICE at$SERVICE_TIME,$GETNAME."

;;
3)

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

echo -e "\nYou have selected a$SERVICE, What is your phone number?"
read CUSTOMER_PHONE

PHONENUMBER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z "$PHONENUMBER" ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  NEWCUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")  
fi

CUSTOMERID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
GETNAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your$SERVICE,$GETNAME?"
read SERVICE_TIME


APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMERID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo -e "\nI have put you down for a$SERVICE at$SERVICE_TIME,$GETNAME."

;;
4)

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

echo -e "\nYou have selected a$SERVICE, What is your phone number?"
read CUSTOMER_PHONE

PHONENUMBER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z "$PHONENUMBER" ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  NEWCUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")  
fi

CUSTOMERID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
GETNAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your$SERVICE,$GETNAME?"
read SERVICE_TIME


APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMERID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo -e "\nI have put you down for a$SERVICE at$SERVICE_TIME,$GETNAME."

;;
5)

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

echo -e "\nYou have selected a$SERVICE, What is your phone number?"
read CUSTOMER_PHONE

PHONENUMBER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z "$PHONENUMBER" ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  NEWCUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")  
fi

CUSTOMERID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
GETNAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

echo -e "\nWhat time would you like your$SERVICE,$GETNAME?"
read SERVICE_TIME


APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMERID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo -e "\nI have put you down for a$SERVICE at$SERVICE_TIME,$GETNAME."

;;
*)
MAINMENU "I could not find that service. What would you like today?"
;;
esac

}

MAINMENU
