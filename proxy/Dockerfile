# Proxy

FROM caddy:latest

WORKDIR /app

COPY Caddyfile ./

RUN caddy fmt --overwrite Caddyfile

ENTRYPOINT ["caddy", "run", "--config", "Caddyfile", "--adapter", "caddyfile"]