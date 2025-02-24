# Apache Configuration Directory

This folder contains additional Apache configuration files for setting up SSL.

## Files:
- **apache_ssl.conf** → The main Apache SSL configuration file used in both manual and Docker setups.

## Usage:
- **Manual Setup:** This configuration file should be manually placed in the correct Apache configuration directory.
- **Docker Setup:** The `Dockerfile` automatically copies this configuration into the container.

### How to Modify
If you need to customize your SSL settings (e.g., change the certificate paths or adjust SSL protocols), modify `apache_ssl.conf` before running the setup.

**Note:** Ensure the configuration is correctly referenced in `httpd.conf` or included properly when using Docker.
