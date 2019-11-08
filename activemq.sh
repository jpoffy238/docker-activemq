#!/bin/sh
PATH=$PATH:/opt/apache-activemq-5.15.10/bin

ACTIVEMQ_EXECUTABLE=/opt/apache-activemq-5.15.10/bin/activemq
ACTIVEMQ_ARGS=console

_term() {
  echo "Caught SIGTERM signal!"
  kill -TERM "$child" 2>/dev/null
}
trap _term SIGTERM

$ACTIVEMQ_EXECUTABLE $ACTIVEMQ_ARGS &
PID=$!

wait $PID
