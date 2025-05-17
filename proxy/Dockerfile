# Proxy

FROM haproxytech/haproxy-alpine:2.4

WORKDIR /app

COPY haproxy.cfg ./

ENTRYPOINT ["haproxy", "-f", "haproxy.cfg"]