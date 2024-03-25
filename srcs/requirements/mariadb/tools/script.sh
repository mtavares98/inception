#!/bin/bash

service mariadb start;
sleep 3;

echo "Creating admin user"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -e "CREATE USER '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

echo "Setting password for root user"
mysqladmin -u root password "$DB_PASS"
mysqladmin -u root -p"$DB_PASS" shutdown

exec "$@"
