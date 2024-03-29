#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/setup/setup_lib/libraries.sh


echo "${blue}# ############################################## #${reset}"
echo "${blue}# Starting containers #${reset}"
echo "${blue}# ############################################## #${reset}"

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Start MYSQL container"
${MBD_WORKSPACE}/tools/mysql_database/build_mysql_database/run_database.sh

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Start PHPADMIN container"
${MBD_WORKSPACE}/tools/mysql_database/build_phpadmin_browser/run_phpadmin.sh

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Start Neo4j container"
${MBD_WORKSPACE}/tools/neo4j_docker_deployment/run_neo4j.sh


echo "${blue}# ############################################## #${reset}"
echo "${blue}# Containers started - Check that every app worked as expected. #${reset}"
