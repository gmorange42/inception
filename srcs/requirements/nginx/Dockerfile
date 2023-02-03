FROM debian:buster

RUN	apt-get -y update && \
	apt-get install -y nginx && \
	apt-get install -y openssl && \
	apt-get clean -y && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir -p /var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress

COPY ./conf/nginx.conf etc/nginx/
COPY ./conf/docker-entrypoint.sh .

EXPOSE 443/tcp

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
