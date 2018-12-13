#!/bin/bash
# Home Controller Logs

docker-compose logs -f --tail 20 graphql-db eeg-db kafka-server zookeeper kafka-manager
