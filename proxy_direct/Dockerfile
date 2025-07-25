# Proxy

FROM haproxy:latest

USER root

RUN apt-get update && apt-get -y --no-install-recommends install \
    netcat-openbsd \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY haproxy.cfg ./

COPY --chmod=755 entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]