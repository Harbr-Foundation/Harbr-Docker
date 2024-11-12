@echo off

REM Check if an argument is provided
if "%1"=="" (
    echo Usage: %0 ^<release^|dev^>
    exit /b 1
)

REM Set the directory based on the argument
if "%1"=="release" (
    cd release
    docker-compose up -d --build
) else if "%1"=="dev" (
    cd dev
    docker-compose up -d
) else (
    echo Invalid argument. Use 'release' or 'dev'.
    exit /b 1
)