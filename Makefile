DOCKER_COMPOSE :- docker-compose
OS :- $(shell uname)

build:
ifeq ($(OS), Linux)
    @echo "Running in $(OS)"
	${DOCKER_COMPOSE} build
endif

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clean:
	docker system prune -y