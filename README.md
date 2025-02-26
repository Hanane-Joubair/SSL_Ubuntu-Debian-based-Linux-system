#  Apache SSL Server Setup (Self-Signed Certificate)

This project sets up a **secure Apache web server** with **SSL encryption**, using either:
1 **Manual installation on Ubuntu/Debian**  
2 **A Docker container for an isolated and portable setup**  

It includes automated scripts and configuration files for a **self-signed certificate**, making it ideal for **local development and testing**.

---

##  Features
✔ **Apache Web Server with HTTPS**  
✔**Self-Signed SSL Certificate Generation**  
✔ **Supports Ubuntu/Debian or Docker Setup**  
✔ **Automated Configuration**  

---

#  System Requirements

###  **For Manual Installation**
- **Ubuntu/Debian-based OS**
- `sudo` privileges  
- Apache installed (`sudo apt install apache2`)  

### **For Docker-Based Installation**
- **Docker & Docker Compose installed** (`sudo apt install docker.io`)  

---

# Installation & Setup

##  **Option 1: Manual Apache Installation (Ubuntu/Debian)**
1 **Clone the Repository**
```bash
git clone https://github.com/Hanane-Joubair/SSL_Ubuntu-Debian-based-Linux-system.git
cd SSL_Ubuntu-Debian-based-Linux-system
```

2 **Make the Script Executable**
```bash
chmod +x setup.sh
```

3 **Run the Setup Script**
```bash
sudo ./setup.sh
```

4 **Verify Apache is Running**
```bash
sudo systemctl status apache2
```

5 **Visit the Secure Apache Server**
- Open your browser and go to:  
  ```
  https://localhost
  ```
  *(Accept the security warning for the self-signed certificate.)*  

---

## **Option 2: Docker-Based Apache SSL Setup**
1 **Clone the Repository**
```bash
git clone https://github.com/Hanane-Joubair/SSL_Ubuntu-Debian-based-Linux-system.git
cd SSL_Ubuntu-Debian-based-Linux-system
```

2 **Manually Place SSL Certificates in `certs/`**
```bash
mkdir certs
cd certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout apache-selfsigned.key -out apache-selfsigned.crt
cd ..
```

3 **Build and Run the Docker Container**
```bash
docker build -t apache-ssl .
docker run -d -p 443:443 --name my-apache-ssl apache-ssl
```

4 **Verify the Running Container**
```bash
docker ps
```

5 **Access the Secure Apache Server**
- Open your browser and visit:  
  ```
  https://localhost
  ```

---

#  Project Structure
```
apache-ssl-docker/
│── certs/                     # SSL Certificates 
│   ├── apache-selfsigned.crt  # Self-signed SSL Certificate 
│   ├── apache-selfsigned.key  # Private Key 
│   ├── README.md              # Instructions for handling SSL certificates
│── config/                    # Apache SSL Configuration
│   ├── apache_ssl.conf        # Apache SSL Virtual Host Configuration
│── setup.sh                   # Manual Apache Setup Script
│── Dockerfile                 # Docker-Based Apache Setup
│── .gitignore                 # Ignore SSL certificate files
│── README.md                  # Main Documentation (this file)
```

---

# SSL Certificate Handling Instructions
### **How to Generate a Self-Signed Certificate**
If you don't have an SSL certificate, generate one manually:
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout certs/apache-selfsigned.key -out certs/apache-selfsigned.crt
```
Then move the files inside the `certs/` directory.

###  **Do NOT Upload Private Keys to GitHub!**
To prevent accidental commits, add this to `.gitignore`:
```plaintext
certs/*.crt
certs/*.key
certs/*.csr
```

###  **For Production Use: Use Let's Encrypt**
For real SSL certificates, install **Certbot**:
```bash
sudo apt install certbot python3-certbot-apache
sudo certbot --apache
```

---

#  Troubleshooting
###  **Apache Does Not Start**
Check logs:
```bash
sudo systemctl status apache2
journalctl -xe
```
Ensure port 443 is open:
```bash
sudo ufw allow 443/tcp
```

###  **Docker Container Not Running**
Check logs:
```bash
docker logs my-apache-ssl
```
Restart the container:
```bash
docker restart my-apache-ssl
```

---

#  License
This project is licensed under the **MIT License**.

---

#  Author
**Hanane Joubair**  



