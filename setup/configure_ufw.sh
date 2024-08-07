#!/bin/bash

# Enable UFW
sudo ufw --force enable

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow 22/tcp

# Allow HTTP
sudo ufw allow 80/tcp

# Allow HTTPS
sudo ufw allow 443/tcp

# Allow specific IP to access a port
sudo ufw allow from 192.168.1.100 to any port 8080

# Allow a range of IP addresses to access a port
sudo ufw allow from 192.168.1.1/24 to any port 3306

# Allow a specific subnet to access a port
sudo ufw allow from 192.168.2.0/24 to any port 5432

# Allow all traffic on localhost (loopback)
sudo ufw allow from 127.0.0.1 to any

# Deny specific IP address
sudo ufw deny from 192.168.1.200

# Deny specific subnet
sudo ufw deny from 192.168.3.0/24

# Reload UFW to apply changes
sudo ufw reload
