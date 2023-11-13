#!/bin/bash

# Create a symbolic link to the SSL certificate and key files
ln -s /etc/nginx/ssl/nginx.crt /etc/ssl/certs/nginx.crt
ln -s /etc/nginx/ssl/nginx.key /etc/ssl/private/nginx.key

# Start Nginx in the foreground
nginx -g "daemon off;"
