#!/bin/bash

log_file=zenigma.log
script_file=zenigma.sh

while true
do
  count=$(wc -l < $log_file)
  if [ $count -ge 20 ]
  then
    echo "Record count is $count, killing $script_file"
    pkill -f $script_file
    rm $log_file
    echo "Deleted $log_file"
    nohup ./$script_file > $log_file 2>&1 &
    echo "Started $script_file"
  fi
  sleep 10
done
