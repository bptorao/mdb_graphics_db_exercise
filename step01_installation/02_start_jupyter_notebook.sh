#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/setup/setup_lib/libraries.sh


echo "${blue}- ---------------------------------------------- -${reset}"
echo "Start Jupyter datascience notebook container"
${MBD_WORKSPACE}/tools/jupyter_notebook_docker/run_jupyter_notebook_lab.sh

