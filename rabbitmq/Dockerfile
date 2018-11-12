FROM rabbitmq:3.7-management

COPY rabbitmq-cluster.sh /usr/local/bin/
COPY configure.sh /usr/local/bin/
COPY pre-entrypoint.sh /

RUN chmod +x /usr/local/bin/rabbitmq-cluster.sh && \
    chmod +x /usr/local/bin/configure.sh && \
    chmod +x /pre-entrypoint.sh

RUN mkdir -p /etc/rabbitmq_init/ && \
    chown rabbitmq:rabbitmq /etc/rabbitmq_init/

EXPOSE 1883 5672 15672 25672 4369 9100 9101 9102 9103 9104 9105
ENTRYPOINT ["/pre-entrypoint.sh"]
CMD ["rabbitmq-cluster.sh"]