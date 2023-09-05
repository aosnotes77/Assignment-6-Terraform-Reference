#!/bin/bash

# This command updates all the packages on the server to their latest versions
sudo yum update -y

# This series of commands installs the Apache web server, enables it to start on boot, and then starts the server immediately
sudo yum install -y httpd
sudo systemctl enable httpd 
sudo systemctl start httpd

## This command installs PHP 8 along with several necessary extensions for the application to run
sudo dnf install -y php php-cli php-fpm php-mysqlnd php-bcmath php-ctype php-fileinfo php-json php-mbstring php-openssl php-pdo php-gd php-tokenizer php-xml

## These commands Installs MySQL version 8
# Install the MySQL Community repository
sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm 
#
# Install the MySQL server
sudo dnf install -y mysql80-community-release-el9-1.noarch.rpm 
dnf repolist enabled | grep "mysql.*-community.*"
sudo dnf install -y mysql-community-server 
#
# Start and enable the MySQL server
sudo systemctl start mysqld
sudo systemctl enable mysqld

# Install the cURL and PHP cURL packages
sudo yum install -y curl libcurl libcurl-devel php-curl --allowerasing

# Restart the PHP-FPM service to apply the changes
sudo service php-fpm restart

# Update the settings, memory_limit to 128M and max_execution_time to 300 in the php.ini file
sudo sed -i 's/^\s*;\?\s*memory_limit =.*/memory_limit = 128M/' /etc/php.ini
sudo sed -i 's/^\s*;\?\s*max_execution_time =.*/max_execution_time = 300/' /etc/php.ini

# This command enables the 'mod_rewrite' module in Apache on an EC2 Linux instance. It allows the use of .htaccess files for URL rewriting and other directives in the '/var/www/html' directory
sudo sed -i '/<Directory "\/var\/www\/html">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf

#
## Install and configure the application.
#

# This command downloads the contents of the specified S3 bucket to the '/var/www/html' directory on the EC2 instance
sudo aws s3 sync s3://aosnote-nest-app-code /var/www/html

# This command changes the current working directory to '/var/www/html', which is the standard directory for hosting web pages on a Unix-based server
cd /var/www/html

# This command is used to extract the contents of the application code zip file that was previously downloaded from the S3 bucket
sudo unzip nest-app.zip

# This command recursively copies all files, including hidden ones, from the 'nest-app' directory to the '/var/www/html/'.
sudo cp -R nest-app/. /var/www/html/

# This command permanently deletes the 'nest-app' directory and the 'nest-app.zip' file.
sudo rm -rf nest-app nest-app.zip

# This command set permissions 777 for the '/var/www/html' directory and the 'storage/' directory
sudo chmod -R 777 /var/www/html
sudo chmod -R 777 storage/

# This command uses `sed` to search the .env file for a line that starts with APP_NAME= and replaces everything after the "=" character with the app's name.
sudo sed -i "/^APP_NAME=/ s/=.*$/=${PROJECT_NAME}-${ENVIRONMENT}/" .env

# This command uses `sed` to search the .env file for a line that starts with APP_URL= and replaces everything after the "=" character with the app's domain name.
sudo sed -i "/^APP_URL=/ s/=.*$/=https:\/\/${RECORD_NAME}.${DOMAIN_NAME}\//" .env

# This command uses `sed` to search the .env file for a line that starts with DB_HOST= and replaces everything after the "=" character with the RDS endpoint.
sudo sed -i "/^DB_HOST=/ s/=.*$/=${RDS_ENDPOINT}/" .env

# This command uses `sed` to search the .env file for a line that starts with DB_DATABASE= and replaces everything after the "=" character with the RDS database name.
sudo sed -i "/^DB_DATABASE=/ s/=.*$/=${RDS_DB_NAME}/" .env

# This command uses `sed` to search the .env file for a line that starts with DB_USERNAME= and replaces everything after the "=" character with the RDS database username.
sudo sed -i "/^DB_USERNAME=/ s/=.*$/=${USERNAME}/" .env

# This command uses `sed` to search the .env file for a line that starts with DB_PASSWORD= and replaces everything after the "=" character with the RDS database password.
sudo sed -i "/^DB_PASSWORD=/ s/=.*$/=${PASSWORD}/" .env

# This command will replace the AppServiceProvider.php file
sudo aws s3 cp s3://aosnote-app-service-provider-files/nest-AppServiceProvider.php /var/www/html/app/Providers/AppServiceProvider.php

# This command will restart the Apache server
sudo service httpd restart
