.PHONY: help

.DEFAULT_GOAL := help
runner=$(shell whoami)

help: ## This help.
	@echo
	@echo "\e[1;35m Port mapping used: $<\e[0m"
	@echo "\e[1;33m - Wordpress: localhost:8080 $<\e[0m"
	@echo "\e[1;33m - Phpmyadmin: localhost:8282 $<\e[0m"
	@echo
	@echo "\e[1;33m - Database password: root - root  $<\e[0m"
	@echo
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo


build: ## Build developer containers.
	docker-compose build

up: build ## Run developer containers.
	docker-compose up

silenceup: ## Run developer containers without print messages.
	docker-compose up -d

bash:
	docker-compose run --rm php /bin/bash 