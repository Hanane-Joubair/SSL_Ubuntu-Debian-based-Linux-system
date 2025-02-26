# Apache Configuration Files

This directory contains the necessary Apache configuration files to enable SSL support.

##  Files in this Directory:
- **`apache_ssl.conf`** → Main Apache SSL configuration file.

##  How the Configuration Works:
The `apache_ssl.conf` file defines how Apache handles HTTPS requests. It includes:
- Enabling SSL (`SSLEngine on`).
- Setting the paths for the SSL certificate and private key.
- Configuring the HTTPS virtual host.

##  Usage:
###  **For Manual Apache Installation**:
If you're setting up Apache manually (without Docker), you need to:
1. Move the configuration file to Apache's configuration directory:
   ```bash
   sudo cp apache_ssl.conf /etc/apache2/sites-available/default-ssl.conf
