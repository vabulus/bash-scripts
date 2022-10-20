dummy_script(){
    while true 
    do
        printf $(date)
        sleep 1
    done   
}

user_count=$(who | wc -l)

if [ "$user_count" -gt "3" ]; then
    if test -f "pidfile"; then
        echo "$user_count users are logged in:"
        pid=$(cat $"pidfile")
        kill $pid;
        echo "Now trying to soft kill the scrip with pid: $pid"
        sleep 20;
        echo "Now killing the process with -9"
        kill -9 $pid;
    else
        echo "nothing to kill"
    fi
else
    if test -f "pidfile"; then
        pid=$(cat $"pidfile")

        echo $pid
        if [ -d "/proc/${pid}" ]; then
            echo "$pid is already running, therefore not starting script"
        else
            dummy_script &
            echo $! > pidfile
            echo "Script not running yet, therefore now starting the script with pid: $!";
        fi
    else
        echo "Init start of script, now creating pidfile and starting script";
        dummy_script &
        echo $! > pidfile
    fi
fi