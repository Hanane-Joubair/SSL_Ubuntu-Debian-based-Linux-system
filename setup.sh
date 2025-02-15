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
