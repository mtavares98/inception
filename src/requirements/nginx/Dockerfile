FROM alpine:3

RUN apk update && apk upgrade && apk add nginx openssl

COPY ./tools/nginx_start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/nginx_start.sh

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=PT/ST=Lisboa/L=Lisbon/O=42 Lisbon/CN=mtavares.42.fr" \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt

EXPOSE 443

ENTRYPOINT [ "/usr/local/bin/nginx_start.sh" ]
CMD ["nginx", "-g", "daemon off;"]
