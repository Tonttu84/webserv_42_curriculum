# Root Makefile to build Webserv + Docker

PROJECT_NAME := webserv_container
COMPOSE_FILE := docker-compose.yml

all: docker_build docker_run

# Build docker image
docker_build:
	@docker-compose -f $(COMPOSE_FILE) build

# Run container
docker_run:
	@docker-compose -f $(COMPOSE_FILE) up -d
	@echo "✅ Webserv is running at localhost:8000-8100"

# Stop container
docker_stop:
	@docker-compose -f $(COMPOSE_FILE) down
	@echo "🛑 Webserv stopped."

# Full cleanup (container + image)
docker_clean: docker_stop
	@docker image rm -f webserv_42_curriculum-webserv || true
	@echo "🧹 Docker images removed."

# Rebuild everything from scratch
re: docker_clean all

.PHONY: all docker_build docker_run docker_stop docker_clean re
