#!/bin/bash

# Update ClamAV virus database
sudo freshclam

# Copy custom freshclam configuration
sudo cp configs/clamav/freshclam.conf /etc/clamav/freshclam.conf

# Restart ClamAV daemon to apply new configuration
sudo systemctl restart clamav-daemon
