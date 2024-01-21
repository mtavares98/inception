FROM debian:11

RUN apt update && apt -y upgrade && apt -y install apt-utils

RUN apt install -y mariadb-server

COPY ./tools/script.sh /home

RUN chmod +x /home/script.sh

RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT [ "/home/script.sh" ]

CMD rm -rf /home/script.sh

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
