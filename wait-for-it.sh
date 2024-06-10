#!/bin/sh
# wait-for-it.sh

host="$1"
shift
cmd="$@"

until nslookup "$host" > /dev/null 2>&1; do
  echo "Waiting for DNS resolution of $host..."
  sleep 5
done

exec $cmd