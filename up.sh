#!/bin/bash
# Home Controller Setup

docker-compose -f docker-compose-kafka.yml -f docker-compose-apps.yml up -d --build
