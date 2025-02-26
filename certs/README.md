#  SSL Certificates for Apache

##  Overview
This directory contains the **SSL/TLS certificates** used to secure the Apache web server.  
For security reasons, the **private key should never be committed to Git**.

---

##  Generating a Self-Signed Certificate
If you don’t have a certificate, create one manually:
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout apache-selfsigned.key -out apache-selfsigned.crt
