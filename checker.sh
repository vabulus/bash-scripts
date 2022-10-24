#!/bin/bash

user_count=$(who | wc -l)
if [ "$user_count" -gt "0" ]; then
    process_count=$(ps aux | grep dummy_script.sh | wc -l)
    if [ "$process_count" -gt "1" ]; then
        echo "[$(date)]: dummy script already running!"
    else
        echo "[$(date)]: now starting dummy script!"
        ./dummy_script.sh
    fi
fi
