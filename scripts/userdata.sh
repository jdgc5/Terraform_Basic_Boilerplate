#!/bin/bash
# Refresh the system
sudo yum update -y

# Install Apache
sudo yum install -y httpd

# Init Apache and enable it 
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a message.txt
echo "This is a random message" > ~/message.txt
EOF 