#!/bin/bash

# Backup original Snort configuration
sudo cp /etc/snort/snort.conf /etc/snort/snort.conf.bak

# Replace with custom configuration
sudo cp configs/snort/snort.conf /etc/snort/snort.conf

# Create custom rules file
sudo cp configs/snort/rules/custom.rules /etc/snort/rules/local.rules
