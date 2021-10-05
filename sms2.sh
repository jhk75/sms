#!/bin/bash
# AT+CMGS="num" + ENTER + "Message" + ctrl+Z and send the sms to the num
# determine device modem, we use /dev/ttyUSB0 for this example
 
# Modem device
DEV=/dev/ttyUSB0

DESTNUM="$1"
SMS="$2"


# we need to put sleep 1 to slow down commands for modem to process
echo -e "ATZ\r" >$DEV
sleep 1
echo -e "AT+CMGF=1\r" >$DEV
sleep 1
echo -e "AT+CMGS=\"$DESTNUM\"\r" >$DEV
sleep 1
echo -e "$SMS\x1A" >$DEV
sleep 1

echo "MESSAGE: $2"



