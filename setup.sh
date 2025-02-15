# Apache SSL Setup Project

## Overview
This project provides a script to automate the setup of an Apache web server with SSL enabled using a self-signed certificate. It ensures secure communication over HTTPS.

## Features
- Installs Apache and OpenSSL
- Enables SSL module and default SSL site in Apache
- Generates a self-signed SSL certificate
- Configures Apache to use the certificate
- Restarts Apache to apply changes

## Prerequisites
- Ubuntu/Debian-based Linux system
- Sudo privileges

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/apache-ssl-project.git
   cd apache-ssl-project
   ```
2. Make the script executable:
   ```bash
   chmod +x setup.sh
   ```
3. Run the script:
   ```bash
   sudo ./setup.sh
   ```

## Usage
After running the script, visit:
```
https://localhost
```
You may see a security warning because the certificate is self-signed. Click **Advanced** and proceed.

## Configuration Details
- **Certificate Location:** `/etc/ssl/certs/apache-selfsigned.crt`
- **Key Location:** `/etc/ssl/private/apache-selfsigned.key`
- **Apache Configuration File:** `/etc/apache2/sites-available/default-ssl.conf`

## Troubleshooting
- If Apache does not restart properly, check the status:
  ```bash
  sudo systemctl status apache2
  ```
- If the site is not accessible, ensure ports are open:
  ```bash
  sudo ufw allow 443/tcp
  ```

## License
This project is licensed under the MIT License.

---

## Setup Script (`setup.sh`)
```bash
#!/bin/bash

# Apache SSL Setup Script
# Author: Hanane Joubair
# Description: This script installs Apache, enables SSL, and sets up a self-signed certificate.

set -e  # Exit immediately if a command exits with a non-zero status.

# Variables
DOMAIN="localhost"
CERT_DIR="/etc/ssl/certs"
KEY_DIR="/etc/ssl/private"
CERT_FILE="$CERT_DIR/apache-selfsigned.crt"
KEY_FILE="$KEY_DIR/apache-selfsigned.key"
CONFIG_FILE="/etc/apache2/sites-available/default-ssl.conf"

# Update System
sudo apt update && sudo apt upgrade -y

# Install Apache and OpenSSL
sudo apt install -y apache2 openssl

# Enable SSL Module and Default SSL Site
sudo a2enmod ssl
sudo a2ensite default-ssl

# Generate a Self-Signed SSL Certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_FILE" -out "$CERT_FILE" \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=$DOMAIN"

# Configure Apache to Use the SSL Certificate
sudo sed -i "s|SSLCertificateFile.*|SSLCertificateFile $CERT_FILE|g" "$CONFIG_FILE"
sudo sed -i "s|SSLCertificateKeyFile.*|SSLCertificateKeyFile $KEY_FILE|g" "$CONFIG_FILE"

# Restart Apache
sudo systemctl restart apache2

echo "SSL setup complete. Visit https://$DOMAIN to verify the setup."
```
