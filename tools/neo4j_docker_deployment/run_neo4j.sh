#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/setup/setup_lib/libraries.sh

username=$(whoami)

docker_name="neo4j_mdb"


echo "-----------------------------------------------------------------------------------"
echo "Checking docker container ${docker_name}"
docker_ps=$(docker ps -aq --filter "name=${docker_name}" | head -n 1)
if [ ! $docker_ps == "" ]; then
    docker_status=$(docker container inspect -f '{{.State.Status}}' ${docker_name})
    if [ -z $docker_status ]; then
        echo "Docker ${docker_name} container not found"
    else
        if [ $docker_status == "running" ]; then
            echo "Docker ${docker_name} container for user ${APP_USER} was found running: Stopping it previously to deploy."
            docker stop ${docker_name}
            docker rm ${docker_name}
        else
        echo "Docker ${docker_name} container for user ${APP_USER} was used: Removing to deploy."
        docker rm ${docker_name}
        fi
    fi
fi
echo ""
echo "-----------------------------------------------------------------------------------"


echo "Deploying ${docker_name} container for user ${username}...."

HOME_FOLDER="${MBD_WORKSPACE}/setup/volumes"
mkdir -p $HOME_FOLDER/neo4j/data
mkdir -p $HOME_FOLDER/neo4j/logs
mkdir -p $HOME_FOLDER/neo4j/conf
mkdir -p $HOME_FOLDER/neo4j/import

docker run \
    --detach \
    --network graphics_db_exercise \
    --publish=7474:7474 --publish=7687:7687 \
    --user="$(id -u):$(id -g)" \
    --env NEO4J_AUTH=neo4j/neo4j_test \
    --env NEO4J_dbms_memory_pagecache_size=3G \
    --volume=$HOME_FOLDER/neo4j/data:/data \
    --volume=$HOME_FOLDER/neo4j/logs:/logs \
    --volume=$HOME_FOLDER/neo4j/conf:/conf \
    --volume=$HOME_FOLDER/neo4j/import:/import \
    --name $docker_name \
    neo4j:5.4.0

if [ $? -eq 0 ];then
    echo "${green}Docker $docker_name started${reset}"
else
    echo "${red}Docker $docker_name has failed starting${reset}"
    echo "Review the logs here:"
    echo "  ->   docker logs $docker_name"
fi


