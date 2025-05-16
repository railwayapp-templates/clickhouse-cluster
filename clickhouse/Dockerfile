# ClickHouse

FROM clickhouse:25.4

ENV CLICKHOUSE_SKIP_USER_SETUP=1

COPY ./config.d/ /etc/clickhouse-server/config.d/

COPY ./users.d/ /etc/clickhouse-server/users.d/