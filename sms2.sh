#!/bin/bash
#Julius Kaplan 03.10.2021 ver1 
# AT+CMGS="num" + ENTER + "Message" + ctrl+Z and send the sms to the num
# determine device modem, we use /dev/ttyUSB0 for this example
#!/bin/sh
 
# Modem device
DEV=/dev/ttyUSB0
# Destination mumber

#DESTNUM="0547362625"
# Message
#SMS="Hi, there"

DESTNUM="$1"
SMS="$2"


# we need to put sleep 1 to slow down commands for modem to process
echo -e "ATZ\r" >$DEV
#sleep 1
echo -e "AT+CMGF=1\r" >$DEV
#sleep 1
echo -e "AT+CMGS=\"$DESTNUM\"\r" >$DEV
#sleep 1
echo -e "$SMS\x1A" >$DEV
#sleep 1

echo "MESSAGE: $2"


