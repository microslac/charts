FROM confluentinc/cp-kafka-connect:7.6.0

ENV PLUGIN_DIR="/usr/share/confluent-hub-components"
ENV CONNECT_PLUGIN_PATH="/usr/share/java,$PLUGIN_DIR"

RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:2.2.1

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-avro-converter:7.6.0

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.7.5
