#!/bin/bash

if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Please install Docker and try again."
  exit 1
fi

if [ "$#" -ne 2 ]; then
  echo "Usage: ./run.sh <postgres_password> <path_to_seed_sql_file>"
  exit 1
fi

POSTGRES_PASSWORD=$1
SEED_SQL_FILE=$2

docker run --name my-postgres -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" -p 5432:5432 -d --rm postgres:13.0

# Wait for the container to start
sleep 5

# Copy the seed SQL file into the container
docker cp "$SEED_SQL_FILE" my-postgres:/tmp/seed.sql

# Execute the seed SQL file using psql command
docker exec -u postgres my-postgres psql -f /tmp/seed.sql

# Open psql shell
docker exec -it -u postgres my-postgres psql
