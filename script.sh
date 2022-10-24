dummy_script(){
    while true 
    do
        printf $(date)
        sleep 1
    done   
}

user_count=$(who | wc -l)

if [ "$user_count" -gt "0" ]; then
    pid=$(cat $"pidfile")  
    if [[ ! -z "$pid" && -f "pidfile" ]]; then
        kill $pid;
        sleep 2;
        kill -9 $pid 2>/dev/null
        echo "[$(date)]: $(who -q | head -1 | cut --delimiter=" " -f 1) killed the script with pid: $pid" | tee -a logs
    else
        echo "[$(date)]: No script running, but more than 0 users logged in, therefore not starting script" | tee -a logs
    fi
else
    if test -f "pidfile"; then
        pid=$(cat $"pidfile")     
        if [[ ! -z "$pid" && -d "/proc/${pid}" ]]; then
            echo "[$(date)]: Script already running with pid: $pid"
        else
            dummy_script &
            echo $! > pidfile
            echo "[$(date)]: Script not running yet, therefore now starting the script with pid: $!";
        fi
    else
        dummy_script &
        echo $! > pidfile
        echo "[$(date)]: Creating pidfile and starting script with pid: $!" | tee -a logs
    fi
fi
