#!/bin/bash

echo "Stopping UFW..."
sudo systemctl stop ufw

echo "Stopping Snort..."
sudo systemctl stop snort

echo "Stopping ClamAV..."
sudo systemctl stop clamav-daemon

echo "Stopping Squid..."
sudo systemctl stop squid

echo "Stopping Suricata..."
sudo systemctl stop suricata
