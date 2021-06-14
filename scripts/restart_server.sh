#!/bin/bash
export SCREENDIR=$HOME/.screen

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR/..

scripts/stop_server.sh

scripts/start_server.sh
