# Homer Controller - DevOps / Docker setup

This is the setup repository for the [Home Controller](https://github.com/HomeIoTController) project. It contains a `docker-compose.yml` file with the container orchestration of this system.

## Getting Started

* Install [Docker](https://docs.docker.com/install/)
* Run `./setup.sh`
  * This will setup [graphql-api](https://github.com/HomeIoTController/graphql-api), [eeg-brainwave-api](https://github.com/HomeIoTController/eeg-brainwave-api) and [web-client](https://github.com/HomeIoTController/web-client). In addition to that, it will also setup databases for both APIs, Kafka, Zookeeper and any other services needed.

## Post-setup links

* `http://localhost:8001`: Kafka Web UI
* `http://localhost:3001`: App Web UI - [web-client](https://github.com/HomeIoTController/web-client)
* `http://localhost:3000/graphql`: GraphQL API - [graphql-api](https://github.com/HomeIoTController/graphql-api)
* `http://localhost:8085/`: EEG API - [eeg-brainwave-api](https://github.com/HomeIoTController/eeg-brainwave-api)

## Useful commands

* `./up.sh`: Build images and turn on containers
* `./down.sh`: Turn down containers
* `./build.sh`: This will build all the images for all apps (needed specially because of the `eeg-brainwave-app` that uses `maven` to build)
* `./logs-apps.sh`: Logs [graphql-api](https://github.com/HomeIoTController/graphql-api), [eeg-brainwave-api](https://github.com/HomeIoTController/eeg-brainwave-api) and [web-client](https://github.com/HomeIoTController/web-client)
* `./logs-infrastructure.sh`: Logs `graphql-db`, `eeg-db`, `kafka-broker`(broker), `kafka-topics-ui`(web-interface) and `kafka-zookeeper`

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

## Creating a Docker Swarm

* To create a docker swarm locally, first create 2 VMs (master and node)

  1. `docker-machine create --driver virtualbox --virtualbox-cpu-count "1" --virtualbox-disk-size "40000" --virtualbox-memory "4096" --virtualbox-boot2docker-url "https://github.com/boot2docker/boot2docker/releases/download/v18.06.1-ce/boot2docker.iso" master`

    * We are setting up this VM with 40GB or hard drive, 1 CPU and 4GB os RAM memory
    * The image being used it `v18.06.1-ce`, and the reason for that can be found [here](https://github.com/docker/machine/issues/4608)

  2. `docker-machine create --driver virtualbox --virtualbox-cpu-count "1" --virtualbox-disk-size "40000" --virtualbox-memory "4096" --virtualbox-boot2docker-url "https://github.com/boot2docker/boot2docker/releases/download/v18.06.1-ce/boot2docker.iso" node`


* After that, we will setup the swarm

  3. `docker-machine ls`
    * This will give us both `master` and `node` VM IPs
  4. `docker-machine ssh master`
  5. `docker swarm init --advertise-addr {MasterVM-IP}`
    * In the place of `{MasterVM-IP}` put the actual IP outputted by the `docker-machine ls` command
    * This command will generate a token, **you must copy it**
  6. `exit`
  7. `docker-machine ssh node`
  8. `docker swarm join --token {Token-Value}`
    * In the place of `{Token-Value}` put the actual token outputted by `docker swarm init` in step `5`
  9. `exit`
  10. `eval $(docker-machine env master)`
    * We will setup the `master` vm as our current docker daemon instance
  11. `./stack_deploy.sh`

## Debugging Docker Swarm

* `docker stack ls`
  * That should show a single stack with `home_controller` and `10` services

* `docker service ls`
  * That will list all services in execution

* `docker service logs {Service_Name}`
  * Logs the output of a service
  * Example: `docker service logs home_controller_eeg-db`

## Running the Load Balanced

* `python3 scaler.py`
