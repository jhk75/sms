#Sending sms via CLI. Example: python3 sms.py 0547000000 test

import time
import os
import sys
import serial
import argparse

phone=serial.Serial('/dev/ttyUSB0', 115200, timeout=2)
recipient = sys.argv[1]
message = str(sys.argv[2])

def info(phone):
    try:
        time.sleep(0.5)
        phone.write(b'ATZ\r')
        time.sleep(0.5)
        phone.write(b'AT+CMGF=1\r')
        time.sleep(0.5)
        phone.write(b'AT+CMGS="' + recipient.encode() + b'"\r')
        time.sleep(0.5)
        phone.write(message.encode() + b"\r")
        time.sleep(0.5)
        phone.write(bytes([26]))
        time.sleep(0.5)
    finally:
        phone.close()


def main():
    info(phone)


if __name__ == "__main__":
    main()












