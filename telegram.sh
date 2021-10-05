#!/bin/sh
token='2044944965:AAGv-kSzDrj5cQSOecWW2LipAN7u7bVZOOQ'
chat="$1"
subj="$2"
message="$3"
/usr/bin/curl -s --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"${chat}\",\"text\":\"${subj}\n${message}\"}" "https://api.telegram.org/bot${token}/sendMessage" --cacert '/usr/lib/zabbix/alertscripts/cacert.pem'
