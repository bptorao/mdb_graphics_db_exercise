#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/step01_installation/setup_lib/libraries.sh

# RUN Docker: MySQL
username=$(whoami)

image="mysql/mysql-server"
tag="latest"
docker_name="mysql_database"


echo "-----------------------------------------------------------------------------------"
echo "Checking docker container ${docker_name}"
docker_ps=$(docker ps -aq --filter "name=${docker_name}" | head -n 1)
if [ ! $docker_ps == "" ]; then
    docker_status=$(docker container inspect -f '{{.State.Status}}' ${docker_name})
    if [ -z $docker_status ]; then
        echo "Docker ${docker_name} container not found"
    else
        if [ $docker_status == "running" ]; then
            echo "Docker ${docker_name} container for user ${username} was found running: Stopping it previously to deploy."
            docker stop ${docker_name}
            docker rm ${docker_name}
        else
        echo "Docker ${docker_name} container for user ${username} was used: Removing to deploy."
        docker rm ${docker_name}
        fi
    fi
fi
echo ""
echo "-----------------------------------------------------------------------------------"


echo "Deploying ${docker_name} container for user ${username}...."

docker run \
    --detach \
    --name=$docker_name \
    --network graphics_db_exercise \
    --env="MYSQL_ROOT_PASSWORD=my_password" \
    --publish 6603:3306 \
    -v ${MBD_WORKSPACE}/setup/volumes/mysql/config/my.cnf:/etc/my.cnf \
    -v ${MBD_WORKSPACE}/setup/volumes/mysql/database:/var/lib/mysql \
    -v ${MBD_WORKSPACE}/setup/volumes/mysql/temp:/tmp_database \
    $image:$tag

if [ $? -eq 0 ];then
    echo "${green}Docker $docker_name started${reset}"
else
    echo "${red}Docker $docker_name has failed starting${reset}"
    echo "Review the logs here:"
    echo "  ->   docker logs $docker_name"
fi
