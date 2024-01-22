FROM debian:11

RUN apt  update && apt -y upgrade

RUN apt install -y \
    curl               \
    php7.4             \
    php7.4-fpm         \
    php7.4-mysql       \
    php7.4-curl        \
    php7.4-gd          \
    php7.4-mbstring    \
    php7.4-xml         \
    php7.4-xmlrpc      \
    php7.4-soap        \
    php7.4-intl        \
    php7.4-zip         \
    mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ && chmod 755 /run/php/

RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/script.sh .

RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]

CMD [ "php-fpm7.4", "-F", "-R" ]


