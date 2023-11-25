#!/bin/bash

echo "Building server.jar version $VERSION"

wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev $VERSION -o /opt/output
