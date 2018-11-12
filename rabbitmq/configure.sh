#!/bin/bash

echo "Configuring RabbitMQ"

if [ ! -f /etc/rabbitmq_init/rabbitmq.init ]; then

  rabbitmqctl add_user admin admin
  rabbitmqctl set_user_tags admin administrator
  rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"

  touch /etc/rabbitmq_init/rabbitmq.init

fi