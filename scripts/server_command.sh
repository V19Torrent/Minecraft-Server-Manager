#!/bin/bash
export SCREENDIR=$HOME/.screen

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR/..

COMMAND=$@

screen -S minecraft -X stuff "$COMMAND"$(echo -ne '\015')
