#!/bin/bash
sudo apt update -y
sudo apt install nginx -y

sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>Welcome to Terraform Web Server from kunal v1</h1>" > /var/www/html/index.html
