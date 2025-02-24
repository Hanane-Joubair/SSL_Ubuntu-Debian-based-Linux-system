# Apache SSL Setup (Self-Signed Certificate)

## Overview
This project automates the setup of an **Apache web server** with **SSL encryption** using a self-signed certificate. You can choose between:
1. A **manual installation** using a setup script (for Ubuntu/Debian-based systems)
2. A **Docker-based deployment** (for containerized environments)

## Features
- **Automated installation** of Apache and OpenSSL
- **Self-signed SSL certificate generation**
- **Configured Apache virtual host with HTTPS**
- **Supports both manual installation and Docker-based setup**

---

## 🚀 Installation & Usage

### **1 Manual Installation (Ubuntu/Debian)**
#### **Requirements:**
- Ubuntu/Debian-based system
- `sudo` privileges

#### **Installation Steps:**
1. Clone the repository:
   ```bash
   git clone https://github.com/Hanane-Joubair/SSL_Ubuntu-Debian-based-Linux-system.git
   cd SSL_Ubuntu-Debian-based-Linux-system
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

---

### **2 Docker-Based Setup (Optional)**
#### **Requirements:**
- **Docker** installed on your system

#### **Installation Steps:**
1. Clone the repository:
   ```bash
   git clone https://github.com/Hanane-Joubair/SSL_Ubuntu-Debian-based-Linux-system.git
   cd SSL_Ubuntu-Debian-based-Linux-system
   ```
2. Build the Docker image:
   ```bash
   docker build -t apache-ssl .
   ```
3. Run the Docker container:
   ```bash
   docker run -d -p 443:443 --name apache-secure-server apache-ssl
   ```
4. Open your browser and visit:
   ```
   https://localhost
   ```

---

##  File Structure
```
├── setup.sh               # Apache SSL setup script (manual installation)
├── apache-ssl.conf        # Apache SSL configuration file
├── Dockerfile             # Docker setup file
├── config/                # Additional Apache configuration (Docker setup)
├── certs/                 # Directory for SSL certificates (Docker setup)
└── README.md              # Project documentation
```

---

##  Troubleshooting
###  **Apache fails to start (Manual Installation)**
- Check Apache logs:
  ```bash
  sudo systemctl status apache2
  journalctl -xe
  ```
- Ensure port 443 is open:
  ```bash
  sudo ufw allow 443/tcp
  ```

### **Docker container issues**
- Check the container logs:
  ```bash
  docker logs apache-secure-server
  ```
- Remove old Docker images and rebuild:
  ```bash
  docker system prune -a
  docker build -t apache-ssl .
  ```

---

##  Future Improvements
- Support for Let's Encrypt SSL certificates
- Automated renewal of SSL certificates
- Enhanced security configurations

---

##  License
This project is licensed under the **MIT License**.

---

##  Author
**Hanane Joubair**

