# Comprehensive Firewall Configuration

This project demonstrates a comprehensive firewall configuration incorporating essential firewall concepts such as zones, policies, IDP, AV, URL filtering, and next-generation services using various open-source tools.<br>
<a href="https://github.com/MenakaGodakanda/firewall-configuration/blob/main/Project_Description.md">Project Description</a>

## Overview
<img width="1401" alt="Screenshot 2024-08-08 at 3 34 09 PM" src="https://github.com/user-attachments/assets/564cc85b-f246-45fa-a653-73e544bfdc6b">

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

### 3. Running the Project:

### Starting Services:
- Start services by running `scripts/start_services.sh` script:
```bash
bash scripts/start_services.sh
```
![Screenshot 2024-08-07 161820](https://github.com/user-attachments/assets/0c9a9e99-67a7-4ef7-bedc-9e01f7c318d8)

### Stopping Services:
- Stop services by running `scripts/stop_services.sh` script:
```bash
bash scripts/stop_services.sh
```
![Screenshot 2024-08-07 162237](https://github.com/user-attachments/assets/f01d80ee-4b33-42a8-ac4e-b5da082b72e5)

## Step 2: Configure Firewall Rules and Zones
### 1. Run Configuration Script:

- Run the `configure_ufw.sh` script to apply the rules:
```
bash setup/configure_ufw.sh
```
![Screenshot 2024-08-05 152522](https://github.com/user-attachments/assets/2b6e7539-08e6-4d7b-9453-7f70de93ac11)

### 2. Check UFW Status:
- Verify the applied rules by running:
```
sudo ufw status verbose
```
![Screenshot 2024-08-05 152728](https://github.com/user-attachments/assets/1c65b136-3f4c-4235-9a4c-fcfb78ae1396)

- Show a list of all rules with their respective numbers:
```
sudo ufw status numbered
```
![Screenshot 2024-08-05 153000](https://github.com/user-attachments/assets/6dfae1f7-f112-4cd2-8c46-b6812399543e)

### 3. Update UFW Rules:
- To update UFW rules, modify the `setup/configure_ufw.sh` script and rerun it:
```bash
bash setup/configure_ufw.sh
```

## Step 3: Intrusion Detection/Prevention
### 1. Run the Configuration Script:
```
bash setup/configure_snort.sh
```

### 2. Monitor Snort Alerts:
- To monitor Snort alerts in real-time:
```
tail -f /var/log/snort/alert
```
![Screenshot 2024-08-06 140207](https://github.com/user-attachments/assets/2c98f4e5-1a15-462c-86df-b101ae56e09a)

## Step 4: Antivirus Scanner
### 1. Run the Configuration Script:
```
bash setup/configure_clamav.sh
```
![Screenshot 2024-08-06 151612](https://github.com/user-attachments/assets/d7f37dd0-437f-4481-9a54-f2fa06782a27)

### 2. Scan for Viruses:
You can manually test ClamAV by scanning a directory. Replace `/path/to/directory` with the directory you want to scan.:
```bash
sudo clamscan -r /path/to/directory
```
![Screenshot 2024-08-06 151132](https://github.com/user-attachments/assets/63c5e56f-a072-416c-86ed-4e83812dc4c9)

## Step 5: Web Proxy and URL Filtering
### 1. Run the Configuration Script:
```
bash setup/configure_squid.sh
```
![Screenshot 2024-08-06 142357](https://github.com/user-attachments/assets/ad3367bb-36d6-4940-b811-3ad57214e1b8)

### 2. Monitor Squid Access Logs
- Check the Squid access logs to monitor Squid access logs in real-time:
```bash
sudo tail -f /var/log/squid/access.log
```
- If there is no output in the Squid access log, it could be because there has not been any traffic passing through the Squid proxy yet.
- To generate some traffic and see logs, you can configure your web browser to use the Squid proxy and then visit a few websites. Follow the below steps.

### 3. Verify Squid Configuration
- Ensure that Squid is running and properly configured. Check the status of Squid:
```
sudo systemctl status squid
```
- If Squid is not running, start it:
```
sudo systemctl start squid
```

### 4. Configure Squid
- Make sure Squid is configured to allow traffic. Open the Squid configuration file:
```
sudo nano /etc/squid/squid.conf
```

- Look for the following lines and make sure they are configured to allow or deny traffic. This example configured to deny traffic :
```
http_access deny all
http_port 3128
```
![Screenshot 2024-08-06 142428](https://github.com/user-attachments/assets/15e10812-d4a8-4b20-8cb7-718ce2f331be)

- These settings deny all incoming HTTP requests on port 3128. Save the file and restart Squid to apply the changes:
```
sudo systemctl restart squid
```

### 5. Configure Your Web Browser to Use the Squid Proxy:
To generate traffic through the Squid proxy, configure your web browser to use the proxy:
  - **Firefox**:
    - Open Firefox and go to `Preferences` -> `Network Settings`.
    - Select `Manual proxy configuration`.
    - Set `HTTP Proxy` to `localhost` and `Port` to `3128`.
    - Check the option to use this proxy server for all protocols.
    - Click `OK` to save the settings. <br><br>
![Screenshot 2024-08-06 142126](https://github.com/user-attachments/assets/cdb4bdb5-11e4-4740-98c1-1346e1e532e0)

  - **Google Chrome**:
    - Open Chrome and go to `Settings` -> `Advanced` -> `System` -> `Open your computer’s proxy settings`.
    - Configure the proxy settings to use `localhost` and port `3128`.

### 6. Generate Traffic
- After configuring the proxy in your web browser, visit a few websites. This will generate traffic that should be logged by Squid.

### 7. Monitor Squid Access Logs
- Check the Squid access logs again. You should see log entries corresponding to the traffic generated by your web browser.

```bash
sudo tail -f /var/log/squid/access.log
```
![Screenshot 2024-08-06 142225](https://github.com/user-attachments/assets/da308bf2-3c15-419b-b484-f34bd30ef6a8)


## Step 6: Network IDS, IPS, Monitoring

### 1. Check the Network Interface:
- Verify the network interface is correct in `configs/suricata.yaml`.
```
# Default interface
af-packet:
  - interface: enp0s3
``` 

### 2. Run the Configuration Script:
```
bash setup/configure_suricata.sh
```

### 3. Suricata Alert Logs:
- Verify Suricata is running, monitoring traffic, and alerts are generated and logged as per the configuration.
```
tail -f /var/log/suricata/eve.json
```
![Screenshot 2024-08-06 150930](https://github.com/user-attachments/assets/47fcf485-f1cf-4490-ad2f-f0d0129b2fd4)

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

### ClamAV Configuration Error:
- **Check ClamAV Logs**: Review ClamAV logs for any errors or issues.
```
sudo tail -f /var/log/clamav/clamav.log
sudo tail -f /var/log/clamav/freshclam.log
```
![Screenshot 2024-08-06 151642](https://github.com/user-attachments/assets/f6734888-a53c-4f4e-9bdb-f7725c2629df)
![Screenshot 2024-08-06 151707](https://github.com/user-attachments/assets/2e1b1289-82da-4d1d-92e4-9711f9be935d)

## Project Structure

```bash
firewall-configuration/
│
├── README.md
├── setup/
│   ├── configure_ufw.sh			  # Configures UFW with predefined rules.
│   ├── configure_snort.sh			# Configures Snort.
│   ├── configure_clamav.sh			# Configures ClamAV.
│   ├── configure_squid.sh			# Configures Squid proxy.
│   └── configure_suricata.sh   # Configures Suricata.
├── configs/
│   ├── ufw/
│   │   └── ufw_rules.conf			# Configuration file for UFW rules.
│   ├── snort/
│   │   ├── snort.conf          # Configuration file for Snort.
│   │   └── rules/
│   │       └── custom.rules    # Custom rules file for Snort
│   ├── clamav/
│   │   └── freshclam.conf			# Configuration file for ClamAV updates.
│   ├── squid/
│   │   └── squid.conf          # Configuration file for Squid.
│   └── suricata/
│       └── suricata.yaml       # Configuration file for Suricata.
└── scripts/
    ├── start_services.sh       # Start the services.
    └── stop_services.sh        # Stop the services.
```

## License
This project is licensed under the MIT License.
