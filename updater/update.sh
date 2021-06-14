#!/bin/bash
export SCREENDIR=$HOME/.screen

LINK=$1
FILENAME=$2
BACKUP_DIR="../Backup"
SERVER_DIR="../Server_Files"
SCRIPTS_DIR="../scripts"
EULA="../Server_Files/eula.txt"

FILES_TO_MOVE=(banned-players.json banned-ips.json ops.json server.properties whitelist.json run.sh server-icon.png plugins world world_nether world_the_end)

# Tell server that it will be updated soon
screen -S minecraft -X stuff "say Server will be updated in 5 minutes!\r"
# sleep 300
sleep 5

# Stop the server
$SCRIPTS_DIR/stop_server.sh

# Recreate backup directory
mkdir $BACKUP_DIR

# Remove backed up files
echo "Deleting backup"
rm -rf $BACKUP_DIR/*

# Backup current files
echo "Backing up current server files"
for i in ${FILES_TO_MOVE[*]}; do
    cp -rf $SERVER_DIR/$i $BACKUP_DIR
done

# Remove all server files
echo "Deleting server files"
rm -rf $SERVER_DIR/*

# Download server
echo "Downloading updated server"
wget $LINK
mv $FILENAME $SERVER_DIR/server.jar

# Run server to get the eula/logs/default server.properties
echo "Initializing server"
cd $SERVER_DIR
java -jar server.jar
cd ../updater

# Accept the eula
echo "Accepting eula"
echo "eula=true" > $EULA

# Copy files from backup to server files
echo "Restoring server backup"
for i in ${FILES_TO_MOVE[*]}; do
    cp -rf $BACKUP_DIR/$i $SERVER_DIR
done

# Start the server
cd ..
scripts/start_server.sh
