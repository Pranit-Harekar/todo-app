.PHONY: all build up down ps logs shell clean

# Define the docker-compose command prefix
DOCKER_COMPOSE = docker-compose -f docker-compose.dev.yml

# Target to run all defined targets (optional)
all: build up

# Build the images defined in docker-compose.dev.yml
build:
	$(DOCKER_COMPOSE) build

# Start all services in detached mode and rebuild images if necessary
up:
	$(DOCKER_COMPOSE) up -d --build

# Stop all running services
down:
	$(DOCKER_COMPOSE) down

# List all running containers
ps:
	$(DOCKER_COMPOSE) ps

# Show logs for all running services
logs:
	$(DOCKER_COMPOSE) logs -f

# Enter a bash shell in the first container (modify for specific container)
shell:
	$(DOCKER_COMPOSE) exec api bash

# Remove all stopped containers, volumes, and networks
clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans
