FROM debian:oldstable

RUN apt update && apt upgrade -y
RUN apt install openssl nginx -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/self-signed.key \
-out /etc/nginx/ssl/self-signed.crt \
-subj "/C=PT/L=Lisbon/O=42/OU=student/CN=mtavares.42.fr"

COPY ./conf/default.conf /etc/nginx/conf.d

# Forcing running the nginx in the foreground without daemonization
CMD [ "nginx", "-g", "daemon off;"  ]
