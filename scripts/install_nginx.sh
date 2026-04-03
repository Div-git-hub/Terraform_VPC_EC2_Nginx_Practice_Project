#!/bin/bash

exec > /home/ubuntu/debug.log 2>&1
set -e

echo "script started"

sleep 30   # ⬅️ IMPORTANT

apt update -y
apt install nginx -y

systemctl start nginx
systemctl enable nginx

echo "nginx installed and running"