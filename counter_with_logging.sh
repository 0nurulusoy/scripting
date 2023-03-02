#!/bin/bash

log_file=/your_path/zenigma.log
script_file=/your_path/zenigma.sh
killer_log=/your_path/killer.log

while true
do
  count=$(wc -l < $log_file)
  if [ $count -ge 20 ]
  then
    pkill -f $script_file
    deletion_status=$?
    if [ $deletion_status -eq 0 ]
    then
      rm $log_file
      echo "$(date +"%Y-%m-%d %H:%M:%S"): Deleted $log_file" >> $killer_log
      touch $log_file
      echo "$(date +"%Y-%m-%d %H:%M:%S"): Emptied $log_file" >> $killer_log
      nohup ./$script_file > $log_file 2>&1 &
      echo "$(date +"%Y-%m-%d %H:%M:%S"): Started $script_file" >> $killer_log
    else
      echo "$(date +"%Y-%m-%d %H:%M:%S"): Failed to delete $log_file" >> $killer_log
    fi
  fi
  sleep 10
done
