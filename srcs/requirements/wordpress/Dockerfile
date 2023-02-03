FROM	debian:buster

RUN	apt-get update && \
	apt-get install -y wget && \
	apt install -y php php-fpm php-mysql mariadb-client && \
	apt-get clean -y && \
	rm -rf /var/lib/apt/lists/* && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/wordpress
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY	./conf/docker-entrypoint.sh /

EXPOSE 9000

ENTRYPOINT ["./docker-entrypoint.sh", "php-fpm7.3", "-F"]
