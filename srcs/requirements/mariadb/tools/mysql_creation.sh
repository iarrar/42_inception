#!/bin/bash

service mariadb start
sleep 10

if ! service mariadb status; then
    echo "Failed to start MariaDB"
    exit 1
fi
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

if mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}"; then
    echo "Database '${MYSQL_DATABASE}' created successfully"
else
    echo "Failed to create database '${MYSQL_DATABASE}'"
    exit 1
fi

mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@"