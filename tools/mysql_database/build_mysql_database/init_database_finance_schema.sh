#!/bin/bash

if [ -z "$MBD_WORKSPACE" ]; then
    # Empty
    echo "[ERROR] ENV VAR MBD_WORKSPACE cannot be empty"
    exit
fi

source ${MBD_WORKSPACE}/setup/setup_lib/libraries.sh

username=$(whoami)
docker_name="mysql_database"

echo "Initializating MYSQL database finance_db on ${docker_name} container for user ${username}...."

cd  ${MBD_WORKSPACE}/tools/mysql_database/build_mysql_database

docker exec -i $docker_name mysql -u root -d finance_db --password=my_password finance_db < init_database_schema.sql

