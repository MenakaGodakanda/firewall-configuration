# Comprehensive Firewall Configuration - Version 1

This project demonstrates a comprehensive firewall configuration incorporating essential firewall concepts such as zones, policies, IDP, AV, URL filtering, and next-generation services using various open-source tools.

## Features

## Coding

### Configure UFW (`setup/configure_ufw.sh`)
This script sets up a basic firewall configuration using `UFW`, allowing essential services like SSH, HTTP, and HTTPS while blocking unwanted access from specific IP addresses and subnets.

#### 1. Enable UFW
- This command enables UFW (Uncomplicated Firewall). The `--force` option is used to bypass the confirmation prompt, enabling the firewall without user interaction.

#### 2. Set default policies
- These commands set the default policies for UFW:
  - `deny incoming`: Blocks all incoming connections by default.
  - `allow outgoing`: Allows all outgoing connections by default.

#### 3. Allow SSH
- This command allows incoming `TCP` connections on `port 22`, which is the default port for `SSH` (Secure Shell). This is essential for remote administration.

#### 4. Allow HTTP
- This command allows incoming `TCP` connections on `port 80`, which is the default port for `HTTP` (Hypertext Transfer Protocol). This is necessary for serving web pages.

#### 5. Allow HTTPS
- This command allows incoming `TCP` connections on `port 443`, which is the default port for `HTTPS` (Hypertext Transfer Protocol Secure). This is necessary for serving secure web pages.

#### 6. Allow specific IP to access a port
- This command allows incoming connections from a specific IP address (`192.168.1.100`) to any interface on `port 8080`. This could be useful for allowing a trusted client to access a service running on `port 8080`.

#### 7. Allow a range of IP addresses to access a port
- This command allows incoming connections from a range of IP addresses (`192.168.1.1` to `192.168.1.254`, represented by the `/24` subnet mask) to any interface on `port 3306`. This is commonly used for allowing access to a MySQL database from a specific subnet.

#### 8. Allow a specific subnet to access a port
- This command allows incoming connections from a specific subnet (`192.168.2.0/24`) to any interface on `port 5432`. This is typically used for allowing access to a PostgreSQL database from a specific subnet.

#### 9. Allow all traffic on localhost (loopback)
- This command allows all traffic from the `localhost` (`127.0.0.1`). This is necessary for local services that need to communicate with each other.

#### 10. Deny specific IP address
- This command denies all incoming connections from a specific IP address (`192.168.1.200`). This could be used to block a known malicious IP address.

#### 11. Deny specific subnet
- This command denies all incoming connections from a specific subnet (`192.168.3.0/24`). This could be used to block a range of IP addresses, for example, from a known source of attacks.

#### 12. Reload UFW to apply changes
- This command reloads UFW to apply all the changes made by the script. It ensures that the new rules take effect.

### Configure ClamAV (`setup/configure_clamav.sh`)
This script ensures that `ClamAV` is using the latest virus definitions and applies a custom configuration to the `freshclam` utility by copying the new configuration file and restarting the ClamAV daemon.

#### 1. Update ClamAV virus database
- This command updates the ClamAV virus database using `freshclam`.
- `freshclam` is a command-line utility that downloads the latest virus definitions from the ClamAV servers.
- The `sudo` command is used to run `freshclam` with superuser privileges, which is necessary for updating the virus database.

#### 2. Copy custom freshclam configuration
- This command copies a custom `freshclam` configuration file from the `configs/clamav/` directory to the ClamAV configuration directory (`/etc/clamav/`).
- The `cp` command is used to copy files, and `sudo` is used to give the command the necessary permissions to write to the system configuration directory.
- The custom configuration file may contain settings that specify how `freshclam` should operate, such as the frequency of updates and which servers to use.

#### 3. Restart ClamAV daemon to apply new configuration
- This command restarts the ClamAV daemon using `systemctl`, which is a system and service manager for Linux.
- The `clamav-daemon` service is responsible for running the ClamAV antivirus engine in the background, scanning files for malware in real-time.
- By restarting the daemon, the new configuration file (`freshclam.conf`) is loaded and applied.

### Configure UFW (`setup/configure_snort.sh`)
This script allows for easy configuration and customization of `Snort` without losing the ability to revert to the original setup.

#### 1. Backup original Snort configuration
- This command creates a backup of the original Snort configuration file (`snort.conf`).
- The `cp` command is used to copy the file.
- `sudo` is used to ensure that the command has the necessary permissions to read from and write to system directories.
- The original `snort.conf` file is copied to `snort.conf.bak` in the same directory, providing a way to restore the original configuration if needed.

#### 2. Replace with custom configuration
- This command replaces the original Snort configuration file with a custom configuration file.
- The custom `snort.conf` file is located in the `configs/snort/` directory.
- By copying it to `/etc/snort/snort.conf`, Snort will use the custom configuration the next time it is started.

#### 3. Create custom rules file
- This command copies a custom Snort rules file (`custom.rules`) to the Snort rules directory, renaming it to `local.rules`.
- The `local.rules` file is where custom Snort rules are typically placed.
- By placing custom rules in this file, the rules will be loaded and used by Snort when it runs.
- The `sudo` command ensures that the necessary permissions are available to write to the Snort rules directory.

### Configure Suricata (`setup/configure_suricata.sh`)
This script allows for easy configuration and customization of `Suricata` without losing the ability to revert to the original setup.

#### 1. Backup original Suricata configuration
- This command creates a backup of the original Suricata configuration file (`suricata.yaml`).
- The `cp` command is used to copy the file.
- `sudo` is used to ensure that the command has the necessary permissions to read from and write to system directories.
- The original `suricata.yaml` file is copied to `suricata.yaml.bak` in the same directory, providing a way to restore the original configuration if needed.

#### 2. Replace with custom configuration
- This command replaces the original Suricata configuration file with a custom configuration file.
- The custom suricata.yaml file is located in the `configs/suricata/` directory.
- By copying it to `/etc/suricata/suricata.yaml`, Suricata will use the custom configuration the next time it is started.

#### 3. Restart Suricata service
- This command restarts the Suricata service to apply the changes made by the new configuration file.
- `systemctl restart suricata` is used to restart the service, and `sudo` ensures that the command has the necessary permissions to manage system services.
- Restarting the service ensures that Suricata reads the new configuration file and applies the changes immediately.

### Configure Squid (`setup/configure_squid.sh`)
This script allows for easy configuration and customization of `Squid` without losing the ability to revert to the original setup.

#### 1. Backup original Squid configuration
- This command creates a backup of the original Squid configuration file (`squid.conf`).
- The `cp` command copies the file.
- The `sudo` command ensures that the script has the necessary permissions to read from and write to system directories.
- The original `squid.conf` file is copied to `squid.conf.bak` in the same directory, allowing you to restore the original configuration if necessary.

#### 2. Replace with custom configuration
- This command replaces the original Squid configuration file with a custom configuration file.
- The custom squid.conf file is located in the `configs/squid/` directory.
- By copying it to `/etc/squid/squid.conf`, Squid will use the custom configuration the next time it is started.

#### 3. Restart Squid service
- This command restarts the Squid service to apply the changes made by the new configuration file.
- The `systemctl restart squid` command restarts the service, and `sudo` ensures that the command has the necessary permissions to manage system services.
- Restarting the service ensures that Squid reads the new configuration file and applies the changes immediately.

### Configuration File for UFW Rules (`configs/ufw/ufw_rules.conf`)
- The purpose of the `configs/ufw/ufw_rules.conf` file is to store custom firewall rules for the Uncomplicated Firewall (`UFW`).
- This file is typically used to define specific firewall rules that should be applied to the system.
- By having these rules in a configuration file, it becomes easier to manage, update, and apply them consistently, especially in automated setups or scripts.

### Configuration File for ClamAV (`configs/clamav/freshclam.conf`)
This configuration file customizes various aspects of how `FreshClam` operates, including where it stores and logs data, how often it checks for updates, which servers it contacts for updates, and various logging and safety settings. Adjusting these settings allows for fine-tuned control over the behavior of the FreshClam updater.

#### 1. Database Directory:
- Specifies the directory where the virus database files are stored. This directory must match the setting in `clamd.conf`.

#### 2. Log File Path:
- Defines the path to the log file where FreshClam logs its operations. Ensure this file has the appropriate permissions.

#### 3. Log Time:
- Enables logging of the timestamp for each update attempt.

#### 4. Verbose Logging:
Enables verbose logging, providing more detailed log output.

#### 5. Syslog Logging:
Enables logging to the system's syslog.

#### 6. Database Owner:
- Specifies the user that owns the database files. This should be the same user running FreshClam.

#### 7. Update Frequency:
Defines how often FreshClam checks for updates, in hours. The default is once every 24 hours.

#### 8. Database Mirror Servers:
- Specifies the database mirror servers to use for updates. Multiple mirrors can be listed.

#### 9. DNS Database Info:
- Uses DNS to obtain the list of database mirrors.

#### 10. Safe Browsing:
- Enables or disables the Safe Browsing feature, which includes additional safety checks.

#### 11. Bytecode:
- Enables or disables the bytecode interpreter, which allows ClamAV to run bytecode-encoded detection logic.

#### 12. Proxy Settings:
- Optional settings for using a proxy server.
- These can be uncommented and configured if FreshClam needs to connect through a proxy.

#### 13. Automatic Addition of Security Fixes and Signature Updates:
-  This line is commented out.
-  Uncommenting it would disable the automatic addition of security fixes and signature updates.

#### 14. Daemon Mode:
- This line is commented out.
- Uncommenting it would enable FreshClam to run in daemon mode, continuously running in the background and periodically checking for updates.

### Configuration File for Snort (`configs/snort/snort.conf`)
This configuration file is used to incorporate custom `Snort` rules into the main configuration.
- **`include` Directive**:
  - The `include` directive tells Snort to include the contents of another file at the point where the directive appears in the configuration file.
  - This is similar to an `include` statement in programming languages like C or the `import` statement in Python.

- **Path to `local.rules`**:
  - `/etc/snort/rules/local.rules` is the path to the file being included.
  - This file typically contains custom rules defined by the user. These rules are written in the Snort rules language and specify the conditions under which Snort should generate alerts.
 
### Custom Rules File for Snort (`configs/snort/rules/custom.rules`)
This script contains a single Snort rule, which is structured to detect HTTP traffic.

#### Rule Header
- **`alert`**:
  - This is the action to be taken when the rule's conditions are met. In this case, Snort will generate an alert.

- **`tcp`**:
  - This specifies the protocol the rule applies to. Here, it is TCP (Transmission Control Protocol).

- **`any any`**:
  - The first `any` refers to the source IP address. The rule will apply to traffic coming from any IP address.
  - The second `any` refers to the source port. The rule will apply to traffic coming from any port.

- **`->`**:
  - This arrow indicates the direction of traffic flow. In this case, it points from the source to the destination.

- **`any 80`**:
  - The first `any` refers to the destination IP address. The rule will apply to traffic going to any IP address.
  - `80` is the destination port. The rule will apply to traffic going to port 80, which is commonly used for HTTP.

#### Rule Options
The rule options are enclosed in parentheses and provide additional details about the rule:

- **`msg:"HTTP traffic detected"`**:
  - The `msg` option specifies the message that will be included in the alert when the rule triggers. In this case, the message is "HTTP traffic detected".

- **`sid:1000001`**:
  - The `sid` (Snort ID) is a unique identifier for the rule. Each rule must have a unique `sid`. In this example, the `sid` is `1000001`.
 
