#!/bin/bash

# Wait for ClickHouse to be ready

CLICKHOUSE_HOSTS=($CLICKHOUSE_01_01_HOST $CLICKHOUSE_02_01_HOST $CLICKHOUSE_03_01_HOST)

echo "Waiting for All ClickHouse Instances to be ready..."

for host in "${CLICKHOUSE_HOSTS[@]}"; do
    echo "Waiting for $host:8123 to be ready"
    
    while true; do
        # First check if the port is open
        if nc -z $host 8123; then
            # Now check if the service is actually ready using the replicas_status endpoint
            if curl -s "http://$host:8123/replicas_status" > /dev/null; then
                echo "$host:8123 is ready"
                break
            fi
        fi
        
        echo "Still waiting for $host:8123..."
        sleep 1
    done
done

echo "All ClickHouse Instances are ready"

exec haproxy -f haproxy.cfg