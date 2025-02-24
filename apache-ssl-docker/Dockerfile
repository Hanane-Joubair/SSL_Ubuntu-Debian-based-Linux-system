# Use the official Apache HTTP server base image
FROM httpd:latest

# Install required packages (Debian-based)
RUN apt-get update && apt-get install -y apache2-utils openssl && rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /etc/ssl/certs /etc/ssl/private

# Copy SSL certificates (Make sure they exist in the 'certs/' directory)
COPY certs/apache-selfsigned.crt /etc/ssl/certs/apache-selfsigned.crt
COPY certs/apache-selfsigned.key /etc/ssl/private/apache-selfsigned.key

# Copy Apache SSL configuration
COPY config/apache_ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

# Enable SSL module and include the custom SSL config
RUN echo "Include conf/extra/httpd-ssl.conf" >> /usr/local/apache2/conf/httpd.conf

# Expose HTTPS port
EXPOSE 443

# Start Apache in the foreground
CMD ["httpd", "-D", "FOREGROUND"]
