FROM debian:11

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y

RUN apt install openssl -y

RUN mkdir -p etc/certs/ssl

RUN openssl req -new -newkey rsa:4096 -x509 -nodes -keyout etc/certs/ssl/inception.key -out etc/certs/ssl/inception.csr -subj \
"/C=FR/ST=PO/L=Perpignan/O=42/OU=42Perpignan/CN=iarrar.42.fr/UID=login"

COPY ./conf/nginx.conf /etc/nginx/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]


