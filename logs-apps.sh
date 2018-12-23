#!/bin/bash
# Home Controller Logs

docker-compose -f docker-compose-kafka.yml -f docker-compose-apps.yml logs -f --tail 20 graphql-api eeg-brainwave-api web-client
