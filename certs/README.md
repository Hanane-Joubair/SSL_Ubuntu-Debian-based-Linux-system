# SSL Certificates Directory

This folder is used to store SSL certificates for securing the Apache web server with HTTPS.

SSL certificates contain sensitive cryptographic information that should remain private.

---

##  What Goes in This Directory?
- **`apache-selfsigned.crt`** → Self-signed SSL certificate 
- **`apache-selfsigned.key`** → Private key for the certificate 
- **`apache-selfsigned.csr`** → Certificate Signing Request (optional)
- **`README.md`** → This instruction file

---

##  How to Generate a Self-Signed SSL Certificate
If you don't have an SSL certificate yet, you can generate a self-signed certificate using **OpenSSL**.

###  **Step 1: Create a Self-Signed Certificate**
Run the following command inside the `certs/` directory:
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout apache-selfsigned.key -out apache-selfsigned.crt
