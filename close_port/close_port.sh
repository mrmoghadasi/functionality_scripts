#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

PORT=$1

# Find PID using the port
PID=$(ss -nltp | grep ":$PORT" | awk -F',' '{print $2}' | awk -F'=' '{print $2}')

if [ -z "$PID" ]; then
  echo "No process found using port $PORT"
  exit 1
fi

echo "Killing process $PID using port $PORT"
kill -9 $PID

echo "Process $PID terminated."
