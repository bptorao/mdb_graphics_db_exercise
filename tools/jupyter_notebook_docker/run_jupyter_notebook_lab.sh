#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/setup/setup_lib/libraries.sh



username=$(whoami)

image=$image
docker_name="datascience-notebook"

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

devprojects_workspace="${MBD_WORKSPACE}/setup/volumes/jupyter_workspace"
conda_envs="${MBD_WORKSPACE}/setup/volumes/jupyter_config/conda/envs"
#/home/jovyan/.jupyterjupyter_server_config.json
jupyter_config="${MBD_WORKSPACE}/setup/volumes/jupyter_config/jupyter_config"
jupyter_local="${MBD_WORKSPACE}/setup/volumes/jupyter_config/jupyter_local"
#-it


docker run  \
    -p 8888:8888 \
    --network graphics_db_exercise \
    -v "${devprojects_workspace}":/home/jovyan/work \
    -v "${conda_envs}":/opt/conda/envs \
    -v "${jupyter_config}":/home/jovyan/.jupyter \
    -v "${jupyter_local}":/home/.local \
    --name $docker_name \
    jupyter/datascience-notebook:latest

if [ $? -eq 0 ];then
    echo "${green}Docker $docker_name started${reset}"
else
    echo "${red}Docker $docker_name has failed starting${reset}"
    echo "Review the logs here:"
    echo "  ->   docker logs $docker_name"
fi

