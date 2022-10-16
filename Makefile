# Used daily
dr: 	docker-run
dea:	docker-exec-app

drf: docker-redis-flush
dcb: docker-compose-build

ENV_FILE=.env
ifneq ("$(wildcard $(ENV_FILE))","")
	include .env
	export
endif

# Config
APP_CONTAINER = ${DOCKER_CONTAINER_NAME}_app

# Run with dev output
docker-run-dev: docker-compose-detach run-dev

# Run with Output
docker-run: docker-compose

# Create project
docker-create-project:
	bash docker/php/init/docker_create.sh

# Enter app container
docker-exec-app:
	docker exec -it ${APP_CONTAINER} bash

# Run dev
run-dev:
	docker exec -it ${APP_CONTAINER} bash -c "npm run dev"

# Run
docker-compose:
	docker compose -f docker/docker-compose.yml --env-file=.env --project-name=${DOCKER_CONTAINER_NAME} up

# Run Workers
docker-compose-workers:
	docker compose -f docker/docker-compose.workers.yml --env-file=.env --project-name=${DOCKER_CONTAINER_NAME} up

# Run without output
docker-compose-detach:
	docker compose -f docker/docker-compose.yml --env-file=.env --project-name=${DOCKER_CONTAINER_NAME} up -d

# Build
docker-compose-build:
	docker compose -f docker/docker-compose.yml --env-file=.env --project-name=${CONTAINER_NAME}  build --force-rm

# Flush Redis cache
docker-redis-flush:
	docker exec -it ${REDIS_CONTAINER} bash -c "redis-cli FLUSHALL"

# Drop All DB tables
docker-db-flush:
	docker exec -it ${APP_CONTAINER} bash -c "php artisan db:wipe"
