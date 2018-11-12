#!/bin/bash

set -m

hostname=`hostname`
RABBITMQ_NODENAME=${RABBITMQ_NODENAME:-rabbit}

rabbitmq-server &
RABBITMQ_SERVER_PID=$!

echo "Waiting for RabbitMQ to start"
until rabbitmqctl list_users > /dev/null 2>&1
do
  sleep 5
done

if [ -z "$CLUSTER_WITH" -o "$CLUSTER_WITH" = "$hostname" ]; then
  configure.sh
else
  rabbitmqctl stop_app

  echo "Joining cluster $CLUSTER_WITH"
  rabbitmqctl join_cluster ${ENABLE_RAM:+--ram} $RABBITMQ_NODENAME@$CLUSTER_WITH

  rabbitmqctl start_app
fi

fg %1