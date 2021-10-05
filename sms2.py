import time
import os
import sys
#import telnetlib
#import glob
import serial
import argparse

#recipient = "0547362625"
#message = "test msg"

recipient = sys.argv[1]
message = str(sys.argv[2])

def info(phone):
    try:
        phone=serial.Serial('/dev/ttyUSB0', 115200, timeout=2)
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
    phone= serial.Serial('/dev/ttyUSB0', 115200, timeout=2)
    print(info(phone))


if __name__ == "__main__":
    main()












