#!/bin/bash

# Install NGINX on Centos 7

# Install EPEL repo
sudo yum -y install epel-release

# Install NGINX
sudo yum -y install nginx

# Configure NGINX to run after system reboot
sudo chkconfig nginx on
sudo systemctl enable nginx
sudo systemctl start nginx

# Generate SSl key and cert for HTTPS servers
sudo mkdir -p /etc/pki/nginx
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/nginx/server.key -out /etc/pki/nginx/server.crt -subj "/C=GB/ST=Hertfordshire/L=Hemel Hempstead/O=Virgin WiFi/OU=Technology Solutions/CN=test"

# Create nginx caching folder
sudo mkdir -p /var/lib/nginx/tmp/cache
sudo chown -R nginx:nginx /var/lib/nginx/tmp/cache

# Check nginx config syntax
sudo nginx -t

# Logging nginx
sudo chown nginx:nginx /var/log/nginx/access.log
sudo chown nginx:nginx /var/log/nginx/error.log

# Disable Selinux to avoid 503 status code on http requests on port 80
# and reboot machine
sudo sed -i "s|SELINUX=enforcing|SELINUX=disabled|" /etc/sysconfig/selinux

# Debugging commands
# Verify NGINX is running on expected ports
netstat -tapnl

# Verify NGINX status
sudo systemctl status nginx

# Check NGINX errors
journalctl -xe

# Check NGINX logs
tail -f /var/log/nginx/error.log /var/log/nginx/access.log
