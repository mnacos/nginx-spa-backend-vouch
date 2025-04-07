FROM nginx:alpine

# Install envsubst utility
RUN apk add --no-cache gettext

# Copy nginx configuration template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Copy static files
COPY ./static /usr/share/nginx/html

# Copy the entrypoint script
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Default environment variables (can be overridden when running the container)
ENV SERVICE1_API_URL="http://service1-api:8080/"
ENV SERVICE1_API_KEY="default-key-1"
ENV SERVICE1_API_TOKEN="default-token-1"
ENV SERVICE2_API_URL="http://service2-api:8080/"
ENV SERVICE2_API_KEY="default-key-2"
ENV SERVICE2_CUSTOM_AUTH="default-auth-2"

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
