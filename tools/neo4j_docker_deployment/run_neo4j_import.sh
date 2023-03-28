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
rm -fR $HOME_FOLDER/neo4j/data
rm -fR $HOME_FOLDER/neo4j/logs

mkdir -p $HOME_FOLDER/neo4j/data
mkdir -p $HOME_FOLDER/neo4j/logs
mkdir -p $HOME_FOLDER/neo4j/conf

docker run --interactive --tty --rm \
    --publish=7474:7474 --publish=7687:7687 \
    --user="$(id -u):$(id -g)" \
    --env NEO4J_AUTH=neo4j/neo4j_test \
    --env NEO4J_dbms_memory_pagecache_size=4G \
    --volume=$HOME_FOLDER/neo4j/import:/import \
    --volume=$HOME_FOLDER/neo4j/data:/data \
    --volume=$HOME_FOLDER/neo4j/logs:/logs \
    --volume=$HOME_FOLDER/neo4j/conf:/conf \
    --name $docker_name \
    neo4j:5.4.0 \
neo4j-admin database import full neo4j --verbose  \
    --skip-duplicate-nodes=true \
    --nodes=/import/lay_off/v_nodes_continents.csv \
    --nodes=/import/lay_off/v_nodes_countries.csv \
    --nodes=/import/lay_off/v_nodes_layoff.csv \
    --nodes=/import/lay_off/v_nodes_locations.csv \
    --nodes=/import/lay_off/v_nodes_sectors.csv \
    --relationships=/import/lay_off/v_rel_companies_countries.csv \
    --relationships=/import/lay_off/v_rel_companies_locations.csv \
    --relationships=/import/lay_off/v_rel_companies_sectors.csv \
    --relationships=/import/lay_off/v_rel_country_continents.csv 

