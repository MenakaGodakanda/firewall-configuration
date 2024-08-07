#!/bin/bash

echo "Starting UFW..."
sudo systemctl start ufw

echo "Starting Snort..."
sudo systemctl start snort

echo "Starting ClamAV..."
sudo systemctl start clamav-daemon

echo "Starting Squid..."
sudo systemctl start squid

echo "Starting Suricata..."
sudo systemctl start suricata
