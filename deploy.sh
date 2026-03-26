#!/bin/bash

cd /var/www/phpapp || exit 1

# Fix git safe directory
git config --global --add safe.directory /var/www/phpapp

# Pull latest code
git fetch origin
git reset --hard origin/master

# Restart Apache
sudo systemctl restart httpd
sudo systemctl restart nginx

# Log deployment
echo "Deployment completed at $(date)" >> /var/www/phpapp/deploy.log
