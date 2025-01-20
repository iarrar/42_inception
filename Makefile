.PHONY: all build up down clean
all: build up
build:
	docker-compose -f srcs/docker-compose.yml build
up:
	docker-compose -f srcs/docker-compose.yml up -d
log: build
	docker-compose -f srcs/docker-compose.yml up --build
down:
	docker-compose -f srcs/docker-compose.yml down
clean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	docker system prune -af
	docker volume prune
	# sudo bash remove_volumes.sh