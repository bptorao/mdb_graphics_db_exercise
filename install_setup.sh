#!/bin/bash

installation_folder=$(pwd)

export MBD_WORKSPACE=$installation_folder

echo "Installing ENV VARs for mbd_graphics_db_exercise"

echo "

export MBD_WORKSPACE=$installation_folder

" >> ~/.bashrc

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
else
    echo "------------------------------------------------"
    echo "Setup completed"
fi
