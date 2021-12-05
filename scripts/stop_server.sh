#!/bin/bash
export SCREENDIR=$HOME/.screen

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR/..

echo "Stopping Server"

# Stop the server
screen -S minecraft -X stuff "stop\r"

if [ "$?" == 1 ]
then
    SCREEN_NUM=$(screen -ls | grep minecraft | cut -d\. -f1)  > /dev/null 2>&1
    screen -wipe $SCREEN_NUM  > /dev/null 2>&1
else
    sleep 10

    # Kill the screen
    screen -S minecraft -X quit
fi

rm Server_Files/screenlog.*
