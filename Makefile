all:
	@docker-compose -f ./src/docker-compose.yaml up

down:
	@docker-compose -f ./src/docker-compose.yaml down

re:
	@docker-compose -f src/docker-compose.yaml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm inception-network\

.PHONY: all re down clean
