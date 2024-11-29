.PHONY: build up down db_migrate clean

DOCKER_COMPOSE = docker-compose -f docker-compose.dev.yml

# Build the images defined in docker-compose.dev.yml
build:
	$(DOCKER_COMPOSE) build

# Start all services in detached mode and rebuild images if necessary
up:
	$(DOCKER_COMPOSE) up -d --build

# Stop all running services
down:
	$(DOCKER_COMPOSE) down

# Apply database migrations
db_migrate:
	$(DOCKER_COMPOSE) up --abort-on-container-exit --exit-code-from migrations migrations

# Remove all stopped containers, volumes, and networks
clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans
