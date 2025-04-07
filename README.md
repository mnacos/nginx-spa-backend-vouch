# nginx-spa-backend-vouch

## How to Use This Setup

This configuration provides:

Static file hosting: Serves files from /usr/share/nginx/html inside the container
API proxying:

/api/service1/* routes to SERVICE1_API_URL with authentication headers
/api/service2/* routes to SERVICE2_API_URL with authentication headers (and path rewriting)

Key Features:

- Environment variable injection: Authentication headers are populated from environment variables
- Security headers: Basic security headers included
- Performance optimizations: Gzip compression, caching headers for static files
- Error handling: Custom error pages for 404 and 5xx errors

Deployment Instructions:

Create a directory structure:

```
project/
├── Dockerfile
├── docker-compose.yml
├── docker-entrypoint.sh
├── nginx.conf
├── static/
│   ├── index.html
│   ├── js/
│   └── css/
```

Place your static files in the static/ directory
Set your environment variables in the docker-compose.yml file
Run with:

```
docker-compose up -d
```

Customization:

Add additional API proxies by adding more location blocks in the nginx.conf file
Adjust security headers as needed
Modify caching behavior for static files by changing the expires directive

This setup provides a secure, flexible way to serve static content while proxying API requests with authentication.
