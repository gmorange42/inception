FROM debian:buster

RUN	apt-get update && \
	apt-get install -y mariadb-server && \
	apt-get clean -y && \
        rm -rf /var/lib/apt/lists/*

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./conf/docker-entrypoint.sh /

EXPOSE 3306

ENTRYPOINT ["./docker-entrypoint.sh"]
