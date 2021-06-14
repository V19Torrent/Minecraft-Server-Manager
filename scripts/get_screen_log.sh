#!/bin/bash
export SCREENDIR=$HOME/.screen

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR/..

if [ $1 == "all" ] || [ $1 == "All" ];
then
    cat Server_Files/screenlog.0
else
    tail -$1 Server_Files/screenlog.0
fi

