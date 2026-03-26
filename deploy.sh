#!/bin/bash
cd /var/www/phpapp || exit 1

# Pull latest code from GitHub
git reset --hard
git pull origin main   # use 'master' if your repo uses master

# Set correct permissions
sudo chown -R nginx:nginx /var/www/phpapp
sudo chmod -R 755 /var/www/phpapp

# Restart web server (if using Nginx or Apache)
sudo systemctl restart nginx   # For Nginx
# sudo systemctl restart httpd  # For Apache

# Log deployment
echo "PHP Deployment completed at $(date)" >> deploy.log
