FROM php

RUN curl -sSL https://github.com/amalgam8/amalgam8/releases/download/v0.4.2/a8sidecar.sh | sh

# Export port 80
EXPOSE 80


## Inject environment variables into the microservices container
ENV A8_SERVICE=UI:v1.0
ENV A8_ENDPOINT_PORT=80
ENV A8_ENDPOINT_TYPE=http
ENV A8_REGISTRY_URL=http://dev-a8-registry-CBJ-123.mybluemix.net
ENV A8_CONTROLLER_URL=http://dev-a8-controller-CBJ-123.mybluemix.net

RUN mkdir -p /app/www
COPY ./ /app/www/

# This container is a web server serving PHP apps, so a plain Apache is our entry point
ENTRYPOINT ["a8sidecar", "--register", "--proxy", "php", "-S", "0.0.0.0:80", "-t", "/app/www"]


#CMD ["php", "-S", "0.0.0.0:80", "-t", "/app/www"]

