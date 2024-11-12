#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <release|dev>"
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