#!/bin/bash
export SCREENDIR=$HOME/.screen

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR/..

SCREEN_NUM=$(screen -ls | grep minecraft | cut -d\. -f1)  > /dev/null 2>&1

if [ $SCREEN_NUM ]
then
    echo "Server already started"
else
    echo "Starting Server"

    # Get Password
    PASSWORD=`cat password.txt`

    # Change directories
    cd Server_Files

    # Create a screen for the server
    screen -dmSL minecraft
    # Run the server
    screen -S minecraft -X stuff "./run.sh\r"
    sleep 0.5
    screen -S minecraft -X stuff "$PASSWORD\r"
fi
