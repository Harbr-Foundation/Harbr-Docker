#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <release|dev>"
    exit 1
fi

# Detect if running in WSL
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    echo "It looks like you are running this script in WSL."
    echo "Please run the up.bat script in Windows with the same arguments to avoid permission issues."
    exit 1
fi

# Set the directory based on the argument
if [ "$1" == "release" ]; then
    cd ./release
    docker-compose up -d --build
elif [ "$1" == "dev" ]; then
    cd ./dev
        docker-compose up -d
else
    echo "Invalid argument. Use 'release' or 'dev'."
    exit 1
fi

# Navigate to the directory and run docker-compose
cd $DIR
docker-compose up