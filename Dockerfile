FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server \
											wget \
											php \
											php-cli \
											php-mbstring \
											php-fpm \
											php-mysql \
											nginx \
											libnss3-tools

COPY srcs /root/

WORKDIR /root/

EXPOSE 80 443

ENTRYPOINT ["bash", "entrypoint.sh"]
