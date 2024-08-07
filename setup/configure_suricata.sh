#!/bin/bash

# Backup original Suricata configuration
sudo cp /etc/suricata/suricata.yaml /etc/suricata/suricata.yaml.bak

# Replace with custom configuration
sudo cp configs/suricata/suricata.yaml /etc/suricata/suricata.yaml

# Restart Suricata service
sudo systemctl restart suricata
