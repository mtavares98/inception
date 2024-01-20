SHELL = /bin/bash

all: up

up:
	mkdir -p ~/data/{mysql,wordpress}
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

clean: down

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

cleanDir:	
	sudo rm -rf ~/data

re: clean up

.PHONY: all up down stop clean logs cleanDir re
