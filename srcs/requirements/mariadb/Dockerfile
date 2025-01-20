FROM debian:11

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server -y

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/

COPY ./tools/mysql_creation.sh .

RUN chmod 777 /mysql_creation.sh

EXPOSE 3306

ENTRYPOINT [ "/mysql_creation.sh" ]

CMD [ "mysqld_safe" ]


