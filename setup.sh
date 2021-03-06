#!/bin/bash
# Home Controller Setup

echo ">>> Setup started!"

echo ">>> Cloning repositories"
for app in graphql-api eeg-brainwave-client audio-client web-client eeg-brainwave-api; do
		git clone "https://github.com/HomeIoTController/$app.git" "../$app"
done

echo ">>> Destroying existent containers"
docker-compose -f docker-compose-kafka.yml -f docker-compose-apps.yml down --rmi all
rm -rf ./database-*
rm -rf ./classifiers

echo ">>> Creating application containers"
docker-compose -f docker-compose-kafka.yml -f docker-compose-apps.yml up -d --build --remove-orphans --force-recreate

echo ">>> Setup complete!"
