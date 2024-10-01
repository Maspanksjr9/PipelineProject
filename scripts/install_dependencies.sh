#!/bin/bash

# Navigate to the app directory
cd /home/ec2-user/my-app/scripts

# Update the package lists
echo "Updating package lists..."
sudo yum update -y

# Install Node.js and npm if not installed
echo "Installing Node.js..."
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs

# Install project dependencies from package.json
echo "Installing project dependencies..."
npm install

# Install Snyk for security checks
echo "Installing Snyk..."
npm install -g snyk

# Fetch Snyk token from AWS Secrets Manager
echo "Fetching Snyk token from AWS Secrets Manager..."
export SNYK_TOKEN=$(aws secretsmanager get-secret-value --secret-id snyk-api-token --query SecretString --output text | jq -r '.SNYK_TOKEN')

# Authenticate Snyk
echo "Authenticating Snyk..."
snyk auth $SNYK_TOKEN

echo "Dependencies and security tools installed successfully."
