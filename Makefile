all:
	@docker compose -f ./scrs/docker-compose.yml up -d --build

down:
	@docker compose -f ./scrs/docker-compose.yml down

re: fclean all

clean:
	@docker-compose -f scrs/docker-compose.yml down --volumes --remove-orphans

fclean : clean
	docker rmi $$(docker images -q)

.PHONY: all re down clean