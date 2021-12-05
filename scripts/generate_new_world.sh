#!/bin/bash
export SCREENDIR=$HOME/.screen

# We don't care to save the world
screen -S minecraft -X quit

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR/..

rm -rf Backup/world
rm -rf Backup/world_nether
rm -rf Backup/world_the_end

mv Server_Files/world Backup
mv Server_Files/world_nether Backup
mv Server_Files/world_the_end Backup

scripts/start_server.sh