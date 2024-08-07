# Comprehensive Firewall Configuration

This project demonstrates a comprehensive firewall configuration incorporating essential firewall concepts such as zones, policies, IDP, AV, URL filtering, and next-generation services using various open-source tools.<br>
<a href="https://github.com/MenakaGodakanda/firewall-configuration/blob/main/Project_Description.md">Project Description</a>

## Overview
<img width="1401" alt="Screenshot 2024-08-07 at 3 02 41 PM" src="https://github.com/user-attachments/assets/1994c5d3-6c73-47f1-b4a3-55a77a8cebf9">

### Explanation:

#### 1. Firewall Rules and Zones:
- Firewalls control network traffic based on predetermined security rules. They operate by allowing or blocking specific traffic types. Firewall zones are logical segments that help manage and organise these rules, typically representing different network segments (e.g., internal, external, DMZ).
- In this project, `ufw` (Uncomplicated Firewall) was used to configure firewall rules and zones. The rules define which types of traffic are allowed or denied based on protocols, ports, and IP addresses.

#### 2. Antivirus Scanner:
- An antivirus scanner detects and removes malicious software from a system. It uses a database of known virus signatures and heuristics to identify threats.
- `ClamAV` was used as the antivirus solution. It was configured to update its virus signature database regularly and scan the system for potential threats.

#### 3. Intrusion Detection/Prevention:
- IDS and IPS are systems designed to detect and potentially prevent security threats. An IDS monitors network traffic for suspicious activity and alerts administrators, while an IPS can take proactive measures to block threats.
- `Snort` was used as an IDS/IPS tool. It was configured to monitor network traffic and detect potential intrusions.


#### 4. Network IDS, IPS, Monitoring:
- Network IDS and IPS monitor and analyse network traffic to detect and respond to suspicious activities. Monitoring tools provide visibility into network performance and security.
- `Suricata` functioned as network IDS/IPS tools. It was configured to provide real-time traffic analysis and generate alerts based on predefined rules.

#### 5. Web Proxy and URL Filtering:
- A web proxy acts as an intermediary for requests from clients seeking resources from servers. URL filtering is used to restrict access to certain websites based on URLs.
- `Squid` was used as the web proxy to manage and filter web traffic.

## Step 1: Setting Up the Project

### 1. Clone the repository:
```bash
git clone https://github.com/MenakaGodakanda/firewall-configuration.git
cd firewall-configuration
```

### 2. Install Tools:

1. **UFW (Uncomplicated Firewall)**: A user-friendly frontend for managing iptables firewall rules.
```
sudo apt install ufw -y
```

2. **Snort**: An open-source intrusion detection/prevention system (IDP).
```
sudo apt install snort -y
```

3. **ClamAV**: An open-source antivirus software.
```
sudo apt install clamav clamav-daemon -y
```

4. **Squid**: A caching and forwarding HTTP web proxy.
```
sudo apt install squid -y
```

5. **Suricata**: A high-performance Network IDS, IPS, and Network Security Monitoring engine.
```
sudo apt install suricata -y
```

## Step 2: Configure UFW
### Run Configuration Script:

- Run the `configure_ufw.sh` script to apply the rules:
```
bash setup/configure_ufw.sh
```

### Verify Rules:
- Verify the applied rules by running:
```
sudo ufw status verbose
```

- Show a list of all rules with their respective numbers:
```
sudo ufw status numbered
```

## Step 3: Configure Snort
### Run the Configuration Script:
```
bash setup/configure_snort.sh
```

## Step 4: Configure ClamAV
### Run the Configuration Script:
```
bash setup/configure_clamav.sh
```

### Test ClamAV
You can manually test ClamAV by scanning a directory. Replace `/path/to/directory` with the directory you want to scan.:
```bash
sudo clamscan -r /path/to/directory
```

## Step 5: Configure Squid
### Run the Configuration Script:
```
bash setup/configure_squid.sh
```

## Step 6: Configure Suricata

### Run the Configuration Script:
```
bash setup/configure_suricata.sh
```

### Suricata Alert Logs:
- Verify Suricata is running, monitoring traffic, alerts are generated and logged as per the configuration.
```
tail -f /var/log/suricata/eve.json
```


## Step 7: Running the Project

### Starting Services:

```bash
bash scripts/start_services.sh
```

### Stopping Services:

```bash
bash scripts/stop_services.sh
```

## Troubleshooting

### UFW Configuration Error:

- **Check UFW Installation**: Check if UFW is installed properly: 
```
sudo apt-get install ufw
```

- **Enable UFW**: Ensure that UFW is enabled. You've already done this.
```
sudo ufw enable
```

- **Check Script Execution**: Ensure that the `configure_ufw.sh` script runs without errors.

- **Verbose Error Checking**: Run the script with verbose output to get more detailed error information:
```
bash -x setup/configure_ufw.sh
```

- **Manual Rule Addition**: Manually add a rule to see if it's applied:
```
sudo ufw allow 22/tcp
sudo ufw status numbered
```

- **Logs and Errors**: Check for any logs or errors that might indicate why the rules are not being applied:
```
sudo tail -f /var/log/ufw.log
```

### Suricata Configuration Error:

- **Manually Update Rules**: Suricata uses rule files to detect specific patterns in network traffic. If the automatic rule update fails, try updating the rules manually. Download community rules for Suricata or use rules from the Emerging Threats project. Download Emerging Threats rules:
```
sudo suricata-update
```

- **Check for Rule Issues**: Make sure the rules are valid and properly loaded. Sometimes issues with the rules can cause Suricata to fail during the test:
```
sudo suricata-update list
```

- **Verify Rule Files**: Ensure rule files are present in `/etc/suricata/rules/`:
```
ls /etc/suricata/rules/
```

- **Test the Configuration File**: Test the Suricata configuration file to ensure it's valid:
```
sudo suricata -T -c /etc/suricata/suricata.yaml -v
```

- **Verify Suricata Logs**: Check the Suricata logs for any further errors or issues:
```
sudo tail -f /var/log/suricata/suricata.log
sudo tail -f /var/log/suricata/stats.log
```

- **Review Suricata Configuration File**: There might be issues with the Suricata configuration file. Open the Suricata configuration file and look for any misconfigurations:
```
sudo nano /etc/suricata/suricata.yaml
```

- Verify the network interface is correct in `suricata.yaml`:
```
# Default interface
af-packet:
  - interface: enp0s3
``` 

- **Check Suricata Service Status**: Run the following command to get the status of the Suricata service:

```
sudo systemctl status suricata.service
```

- **Check Detailed Logs**: Check the detailed logs using `journalctl`:
```
sudo journalctl -xeu suricata.service
```

- **Check Permissions**: Ensure that Suricata has the necessary permissions to read the configuration and log files.
```
sudo chmod 644 /etc/suricata/suricata.yaml
sudo chown suricata:suricata /var/log/suricata/suricata.log
```

## Project Structure

```bash
firewall-configuration/
│
├── README.md
├── setup/
│   ├── configure_ufw.sh			# Configures UFW with predefined rules.
│   ├── configure_snort.sh			# Configures Snort.
│   ├── configure_clamav.sh			# Configures ClamAV.
│   ├── configure_squid.sh			# Configures Squid proxy.
│   └── configure_suricata.sh
├── configs/
│   ├── ufw/
│   │   └── ufw_rules.conf			# Configuration file for UFW rules.
│   ├── snort/
│   │   ├── snort.conf
│   │   └── rules/
│   │       └── custom.rules
│   ├── clamav/
│   │   └── freshclam.conf			# Configuration file for ClamAV updates.
│   ├── squid/
│   │   └── squid.conf
│   └── suricata/
│       └── suricata.yaml
└── scripts/
    ├── start_services.sh
    └── stop_services.sh
```

## License
This project is licensed under the MIT License.
