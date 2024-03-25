FROM debian:oldstable

RUN apt update && apt upgrade

RUN apt install mariadb-server -y

COPY ./tools .

RUN chmod +x ./script.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT [ "./script.sh" ]

CMD [ "mysqld", "--bind-address=0.0.0.0" ]
