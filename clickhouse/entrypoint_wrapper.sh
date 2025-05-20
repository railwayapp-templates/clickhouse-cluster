#!/bin/bash

# Wait for ClickHouse Keeper to be ready
# use nc to check if the keeper is ready
# KEEPER_01_HOST, KEEPER_02_HOST, KEEPER_03_HOST

KEEPER_HOSTS=($KEEPER_01_HOST $KEEPER_02_HOST $KEEPER_03_HOST)

echo "Waiting for All ClickHouse Keepers to be ready..."

for host in "${KEEPER_HOSTS[@]}"; do
    echo "Waiting for $host:2181 to be ready"
    
    while true; do
        if nc -z $host 2181; then
            echo "$host:2181 is ready"
            break
        fi

        echo "Still waiting for $host:2181..."

        sleep 1
    done
done

echo "All ClickHouse Keepers are ready"

exec /entrypoint.sh