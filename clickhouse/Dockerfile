# ClickHouse

FROM clickhouse:25.4

RUN apt-get update && apt-get -y --no-install-recommends install \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

ARG CLICKHOUSE_HOSTNAME

ENV HOSTNAME=$CLICKHOUSE_HOSTNAME

ENV CLICKHOUSE_SKIP_USER_SETUP=1

COPY ./config.d/ /etc/clickhouse-server/config.d/

COPY ./users.d/ /etc/clickhouse-server/users.d/

COPY --chmod=755 ./entrypoint_wrapper.sh /entrypoint_wrapper.sh

ENTRYPOINT ["/entrypoint_wrapper.sh"]