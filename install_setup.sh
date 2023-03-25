#!/bin/bash

installation_folder=$(pwd)

export MBD_WORKSPACE=$installation_folder

echo "Installing ENV VARs for mbd_graphics_db_exercise"


echo " - Creating & updating SERVER_IP"
server_ip_read=$(hostname -I | awk '{print $1}')
echo " - Creating & updating MBD_WORKSPACE"

echo "
export SERVER_IP=$server_ip_read
export MBD_WORKSPACE=$installation_folder

" >> ~/.bashrc

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
else
    echo "------------------------------------------------"
    echo " - MBD_WORKSPACE = $MBD_WORKSPACE"
    echo ""
    echo "Setup completed"
fi
