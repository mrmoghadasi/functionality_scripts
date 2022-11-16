#!/bin/sh

Date1=$(date +%Y-%m-%d_%H:%M:%S)
Sname=`hostname`


# Your Email Information: Recipient (To:), Subject and Body
SUBJECT="Alert from Server: $Sname"



if [ ${PAM_TYPE} = "open_session" ]; then

curl -X POST -H 'Content-Type: application/json' https://rocker-chat.domain/hooks/Token \
        --data-binary '{"text":"SSH Alert", "attachments": [{"title": "'"$SUBJECT"'", "text": "Host: '$Sname'  \n\t  User: '$PAM_USER' \t\n  User IP Host: '$PAM_RHOST' \t\n Service: '$PAM_SERVICE' \t\n TTY: '$PAM_TTY' \t\n Date: '$Date1' \t\n  " }] }'

fi

exit 0
