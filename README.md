# DevOps - Docker setup

This is the setup repository for the [Home Controller](https://github.com/HomeIoTController) project. It contains a `docker-compose.yml` file with the container orchestration of this system.

## Getting Started

* Install [Docker](https://docs.docker.com/install/)

* Run `./setup.sh`
  * This will setup [graphql-api](https://github.com/HomeIoTController/graphql-api), [eeg-brainwave-api](https://github.com/HomeIoTController/eeg-brainwave-api) and [web-client](https://github.com/HomeIoTController/web-client). In addition to that, it will also setup databases for both APIs, Kafka, Zookeeper and any other services needed.

## Debugging

* To check realtime logs of the applications, run `./logs-apps.sh`.

* To check realtime logs of the infrastructure, run `./logs-infrastructure.sh`.

* To ssh inside any container:
  * `docker ps`
  * `docker exec -ti 3912bba70e66 bash`

## Stopping services

* To stop services, either:

  * Run `docker-compose down` to stop all services.
  
  * Run `docker-compose stop service_name` to stop a specific service.
