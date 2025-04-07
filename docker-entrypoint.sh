#!/bin/sh
set -e

# Create a copy of the original nginx.conf template
envsubst '${SERVICE1_API_URL} ${SERVICE1_API_KEY} ${SERVICE1_API_TOKEN} ${SERVICE2_API_URL} ${SERVICE2_API_KEY} ${SERVICE2_CUSTOM_AUTH}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Execute the CMD from the Dockerfile
exec "$@"
