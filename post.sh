#!/bin/bash

TG_TOKEN="8485647929:AAEJ9daOIX1UZdecHhy9OXf8KOz_Z-zqpSg"
CHATID="5479672033"
BOT_BUILD_URL="https://api.telegram.org/bot$TG_TOKEN/sendDocument"

FILE_TO_SEND=$(ls -t "$PWD"/*.zip 2>/dev/null | head -n 1)

if [ -z "$FILE_TO_SEND" ]; then
  echo "Zip file not found in $PWD"
  exit 1
fi

DATE_ID=$(TZ=Asia/Jakarta date +'%d-%m-%Y %H:%M')

CAPTION="Kernel Build Succesfully
Date: $DATE_ID
Created: by @Renzy665"

echo "Sending file: $FILE_TO_SEND"
echo "Caption: $CAPTION"

if curl --no-progress-meter -F document=@"$FILE_TO_SEND" -F chat_id="$CHATID" --form-string caption="$CAPTION" "$BOT_BUILD_URL"; then
  echo "Send succesfully"
else
  echo "Send failed"
  exit 1
fi
