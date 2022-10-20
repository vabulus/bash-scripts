# bash-scripts for school
## Instruction
Write a program that uses the system's processing power for other purposes whenever no user is logged on to the system. Whenever the system is not in use, a program has to be started (simply use a script with sleep in infinite loop as dummy / placeholder for a possible meaningful program) that uses the idle computing power in a meaningful way.

When a user logs in, the process should be terminated immediately so that the user is not disturbed or affected in the use of the system's performance.

A log file should show when the process was started and when (and by which user) it was stopped.

**Requirements**:
- A script that determines if the system is currently free, and in this case starts the dummy process and is started periodically (as a cronjob or self-sustaining in a loop)
- The dummy process (e.g. "sleep" in an infinite loop)
- A mechanism that ensures that a possibly running dummy process is eliminated when a user logs in (sudo may be required here!).

*Useful Considerations*:
- Don't start the dummy process if it is already running (so you may have to "remember" (keyword "flag file" or "pid file") or check (using the current process list) if the dummy process is already running.
- The dummy process should be killed "nicely" so that it is "allowed" to save its intermediate results. If it has not been completely terminated within 20 seconds, then the process should be killed hard (SIGKILL). This way a program can be terminated "with due severity" if necessary.

## Setup on linux 
1. ``cd ~``

2. ``git clone https://github.com/vabulus/bash-scripts.git"``

3. ``sudo crontab -e``

4. append following line: ``* * * * * sh <PATH-TO-SCRIPT-LOCATION>``
