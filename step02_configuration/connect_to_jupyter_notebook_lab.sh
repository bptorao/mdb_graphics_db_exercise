#!/bin/bash

username=$(whoami)

image=$image
docker_name="datascience-notebook"

echo ""
echo "-----------------------------------------------------------------------------------"


echo "Connect to ${docker_name} container for user ${username}...."

devprojects_workspace="/Users/bueka.torao/DevProjects/devprojects_workspace"

docker exec -it $docker_name /bin/bash