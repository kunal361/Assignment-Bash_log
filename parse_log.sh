#!/bin/bash
max_time=0
max_req=""
curr_time=0
while IFS='' read -r request; do
  if [ "$request" != "--" ]; then
    IFS='' read -r response
    num=`echo $response|wc -w`
    if [ $num == 13 ]; then
      curr_time="`echo $response|cut -d ' ' -f5|sed 's/[^0-9]//g'`"
    else
      curr_time="`echo $response|cut -d ' ' -f7|sed 's/[^0-9]//g'`"
    fi
    if [ $curr_time -gt $max_time ]; then
      max_time=$curr_time
      max_req=$request
    fi
  fi
done
echo "Max time: ${max_time}ms"
echo "Request: $max_req"