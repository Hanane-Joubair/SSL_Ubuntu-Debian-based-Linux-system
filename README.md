# Apache SSL Setup (Self-Signed Certificate)

## Overview
This project automates the setup of an **Apache web server** with **SSL encryption** using a self-signed certificate. The provided `setup.sh` script installs the necessary dependencies, generates an SSL certificate, and configures Apache for HTTPS support.

## Features
- **Automated installation** of Apache and OpenSSL
- **Self-signed SSL certificate generation**
- **Configured Apache virtual host with HTTPS**
- **Easy one-step setup** with a script

## Requirements
- Ubuntu/Debian-based system
- `sudo` privileges

## Installation & Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/Hanane-Joubair/SSL_Ubuntu-Debian-based-Linux-system.git
   cd Hanane-Joubair
   ```
2. Make the script executable:
   ```bash
   chmod +x setup.sh
   ```
3. Run the script:
   ```bash
   sudo ./setup.sh
   ```
4. Open your browser and visit:
   ```
   https://localhost
   ```
   *(Accept the security warning for the self-signed certificate.)*

## File Structure
```
├── setup.sh               # Apache SSL setup script
├── apache-ssl.conf        # Apache SSL configuration file (if needed)
└── README.md              # Project documentation
```

## Troubleshooting
- If Apache does not start, check the logs:
  ```bash
  sudo systemctl status apache2
  journalctl -xe
  ```
- Ensure port 443 is open:
  ```bash
  sudo ufw allow 443/tcp
  ```

## Future Improvements
- Support for Let's Encrypt SSL certificates
- Dockerized setup for portability
- Automated renewal of SSL certificates

## License
This project is licensed under the **MIT License**.

## Author
Hanane Joubair
