#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/setup/setup_lib/libraries.sh

username=$(whoami)

image="phpmyadmin/phpmyadmin"
tag="latest"
docker_name="database_browser"

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

docker run -d \
    -p 8081:80 \
    --name=$docker_name \
    -e PMA_PORT=3306 \
    -e PMA_HOST=mysql_database \
    --network graphics_db_exercise \
    -v ${MBD_WORKSPACE}/setup/volumes/phpadmin/config.inc.php:/var/www/html/config.inc.php \
    --link mysql_database:mysql \
    $image:$tag

#docker exec -it mysql_database mysql -u finance -D finance_db -pfinance

if [ $? -eq 0 ];then
    echo "${green}Docker $docker_name started${reset}"
else
    echo "${red}Docker $docker_name has failed starting${reset}"
    echo "Review the logs here:"
    echo "  ->   docker logs $docker_name"
fi