#!/bin/bash

set -e

# Get vars declared globally in protocode to update values in .env file accordingly
export $(grep -v '^#' .protocode-runtime/.env | xargs)

# Duplicate env file
cp .env .env.local

# Update .env values
sed -i "s|^DATABASE_URL=.*|DATABASE_URL=\"${DB_CONNECTION}://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?serverVersion=8.0.32\&charset=utf8mb4\"|" .env.local
sed -i "s|^# MAILER_DSN=.*|MAILER_DSN=smtp://maildev:1025|" .env.local

# Install intelephense extension for vscode
code --install-extension bmewburn.vscode-intelephense-client
