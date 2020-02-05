#!/bin/bash

bash -c "/usr/local/bin/docker-entrypoint.sh postgres&"

ulimit -c unlimited

echo key=$KEY
echo $PWD
if [ -n "$IROHA_POSTGRES_HOST" ]; then
  echo "NOTE: IROHA_POSTGRES_HOST should match 'host' option in config file"
  PG_PORT=${IROHA_POSTGRES_PORT:-5432}
  /opt/iroha/docker/wait-for-it.sh -h $IROHA_POSTGRES_HOST -p $PG_PORT -t 20 -- true
else
  echo "WARNING: IROHA_POSTGRES_HOST is not defined.
    Do not wait for Postgres to become ready. Iroha may fail to start up"
fi

exec "$@"
