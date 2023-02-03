all:
	mkdir -p /home/gmorange/data/wordpress-nginx
	mkdir -p /home/gmorange/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d --build 

re: fclean all

down:
	docker compose -f ./srcs/docker-compose.yml down

stop_all:
	-docker stop $(shell docker ps -aq)

cclean:
	-docker rm -f $(shell docker ps -aq)

iclean:
	-docker rmi -f $(shell docker images -aq)

vclean:
	-docker volume rm $(shell docker volume ls -q)

nclean:
	-docker network rm $(shell docker network ls -q)

fclean: stop_all cclean iclean vclean nclean
	docker system prune -af --volumes
	rm -rf /home/gmorange/data
