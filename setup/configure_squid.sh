#!/bin/bash

# Backup original Squid configuration
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak

# Replace with custom configuration
sudo cp configs/squid/squid.conf /etc/squid/squid.conf

# Restart Squid service
sudo systemctl restart squid
