#!/bin/bash
# Home Controller Logs

docker-compose -f docker-compose-kafka.yml -f docker-compose-apps.yml logs -f --tail 20 graphql-db eeg-db kafka-broker kafka-zookeeper kafka-topics-ui
