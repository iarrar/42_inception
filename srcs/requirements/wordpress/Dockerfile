FROM debian:11

RUN apt update -y && apt upgrade -y

RUN apt-get install php -y 

RUN apt-get install php-fpm -y

RUN apt-get install php-cli -y

RUN apt-get install php-mysql -y

RUN apt-get install php-cgi -y

RUN apt-get install wget -y

RUN apt-get install tar -y


RUN	wget https://fr.wordpress.org/wordpress-6.5.2-fr_FR.tar.gz -P /var/www

RUN tar -xzf /var/www/wordpress-6.5.2-fr_FR.tar.gz -C /var/www

RUN ls /var/www

RUN rm /var/www/wordpress-6.5.2-fr_FR.tar.gz

RUN sleep 10

RUN chown -R www-data:www-data /var/www/wordpress

RUN mkdir /run/php

RUN chown -R www-data:www-data /run/php

RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod 755 /usr/local/bin/wp
RUN	chmod 755 /usr/local/bin
RUN chmod 755 /usr/local/
RUN chmod 755 /usr	


COPY ./conf/www.conf ./etc/php/7.4/fpm/pool.d/www.conf

RUN chown -R www-data:www-data /var/www/
RUN chmod -R 755 /var/www/
RUN chmod -R 755 /var/www/wordpress
RUN usermod -aG www-data root

RUN sleep 7

COPY ./tools/config.sh .
RUN chmod 755 /var
RUN chmod -R 777 /var/www/wordpress/



EXPOSE 9000

CMD [ "bash", "config.sh" ]


