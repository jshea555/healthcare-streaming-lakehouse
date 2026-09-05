#!/usr/bin/env bash
set -euo pipefail

# On Windows Git Bash (MSYS), any argument that looks like a Unix path
# (starts with "/") gets auto-rewritten into a Windows path before Docker
# ever sees it — which breaks paths meant for *inside* the container, like
# /opt/kafka/bin/kafka-topics.sh. This line disables that behavior.
# It's a no-op (harmless) on Mac/Linux.
export MSYS_NO_PATHCONV=1

TOPICS=(eligibility claims provider pharmacy clinical)
CONTAINER=healthcare-kafka
PARTITIONS=3
REPLICATION=1

for topic in "${TOPICS[@]}"; do
  echo "Creating topic: $topic"
  docker exec "$CONTAINER" /opt/kafka/bin/kafka-topics.sh \
    --create \
    --if-not-exists \
    --topic "$topic" \
    --bootstrap-server localhost:9092 \
    --partitions "$PARTITIONS" \
    --replication-factor "$REPLICATION"
done

echo "Topics now present:"
docker exec "$CONTAINER" /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092