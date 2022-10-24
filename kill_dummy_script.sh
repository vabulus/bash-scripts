#!/bin/bash

user_count=$(who | wc -l)
if [ "$user_count" -gt "0" ]; then
    pid=$(pgrep -fl "dummy_script.sh" | cut --delimiter=" " -f 1)
    echo "[$(date)]: $(who -q | head -1 | cut --delimiter=' ' -f 1) killed the dummy script!" > /var/logs/myownscript.txt
    sleep 1
    kill $pid
    sleep 20
    kill -9 $pid 2>/dev/null
fi