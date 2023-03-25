#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 6`
reset=`tput sgr0`

#export MBD_WORKSPACE="<LOCAL_FOLDER>"

#export SERVER_IP=""

if [ -z "$SERVER_IP" ]; then
    # Empty
    echo "[ERROR] ENV VAR SERVER_IP cannot be empty"
    exit
fi
