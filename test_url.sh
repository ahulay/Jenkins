#!/bin/bash

url=$1

attempts=5
timeout=5

for (( i=1; i<=$attempts; i++ ))
do
  code=`curl -sL --connect-timeout 20 --max-time 30 -w "%{response_code}" "$url" -o /dev/null`

  if [ "$code" = "200" ]; then
    echo "Success"
    break
  else
    sleep $timeout
  fi  
done

if [ "$code" != "200" ]; then
  echo "Failure"
fi
