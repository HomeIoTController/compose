# Homer Controller - DevOps / Docker setup

This is the setup repository for the [Home Controller](https://github.com/HomeIoTController) project. It contains a `docker-compose.yml` file with the container orchestration of this system.

## Getting Started

* Install [Docker](https://docs.docker.com/install/)
* Run `./setup.sh`
  * This will setup [graphql-api](https://github.com/HomeIoTController/graphql-api), [eeg-brainwave-api](https://github.com/HomeIoTController/eeg-brainwave-api) and [web-client](https://github.com/HomeIoTController/web-client). In addition to that, it will also setup databases for both APIs, Kafka, Zookeeper and any other services needed.

## Post-setup links

* `http://localhost:9000`: Kafka Manager
  * Add a new cluster with `Cluster Zookeeper Hosts = zookeeper:2181`
* `http://localhost:3001`: Web interface - [web-client](https://github.com/HomeIoTController/web-client)
* `http://localhost:3000/graphql`: GraphQL API - [graphql-api](https://github.com/HomeIoTController/graphql-api)
* `http://localhost:8081/`: EEG API - [eeg-brainwave-api](https://github.com/HomeIoTController/eeg-brainwave-api)

## Useful commands

* `./up.sh`: Build images and turn on containers
* `./down.sh`: Turn down containers
* `./logs-apps.sh`: Logs [graphql-api](https://github.com/HomeIoTController/graphql-api), [eeg-brainwave-api](https://github.com/HomeIoTController/eeg-brainwave-api) and [web-client](https://github.com/HomeIoTController/web-client)
* `./logs-infrastructure.sh`: Logs `graphql-db`, `eeg-db`, `kafka-server`(broker), `kafka-manager`(web-interface) and `zookeeper`

## Debugging

* To check realtime logs of the applications, run `./logs-apps.sh`.
* To check realtime logs of the infrastructure, run `./logs-infrastructure.sh`.
* To `ssh` any container:
  * `docker ps`
  * `docker exec -ti 3912bba70e66 bash`

## Stopping services

* To stop services, either:
  * Run `./down.sh` to stop all services.
  * Run `docker-compose stop service_name` to stop a specific service.
