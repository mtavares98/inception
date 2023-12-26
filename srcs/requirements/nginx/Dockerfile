FROM debian:11-slim

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/default.conf /etc/nginx/conf.d/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=PT/ST=Lisboa/L=Lisbon/O=42 Lisbon/CN=mtavares.42.fr" \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
