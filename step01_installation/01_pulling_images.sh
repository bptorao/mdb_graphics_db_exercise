#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/setup/setup_lib/libraries.sh



echo "${blue}# ############################################## #${reset}"
echo "${blue}# Pulling docker images #${reset}"
echo "${blue}# ############################################## #${reset}"

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Pulling MYSQL docker image"
docker pull mysql/mysql-server:latest

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Pulling PHPADMIN docker image"
docker pull phpmyadmin/phpmyadmin:latest

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Pulling Neo4j docker image"
docker pull neo4j:5.4.0

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Pulling Jupyter datascience notebook"
docker pull jupyter/datascience-notebook

echo "${blue}- ---------------------------------------------- -${reset}"
echo "Creating project docker network"
docker network create graphics_db_exercise

echo "${blue}# ############################################## #${reset}"
echo "${blue}# Docker images pulled #${reset}"
