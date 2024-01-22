FROM debian:11

RUN apt  update && apt -y upgrade

RUN apt install -y \
	curl \
	php-mysqli \
	php-fpm

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ && chmod 755 /run/php/

# This is to chang config file to run the fpm module with the port 9000
RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/script.sh .

RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]

# -F flag is for running in the foreground
CMD [ "php-fpm7.4", "-F" ]
