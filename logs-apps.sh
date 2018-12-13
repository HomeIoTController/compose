#!/bin/bash
# Home Controller Logs

docker-compose logs -f --tail 20 graphql-api eeg-brainwave-api web
