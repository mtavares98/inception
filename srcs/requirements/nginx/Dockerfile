FROM alpine:3.17

RUN apk update && apk upgrade && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN rm -f /etc/nginx/http.d/default.conf

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=PT/ST=Lisboa/L=Lisbon/O=42 Lisbon/CN=mtavares.42.fr" \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
