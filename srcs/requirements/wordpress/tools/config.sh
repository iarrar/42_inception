#!/bin/bash
echo "File started normally"
sleep 25
echo "Connecting to database..."
sed -i "s/votre_nom_de_bdd/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/votre_utilisateur_de_bdd/$MYSQL_ROOT_USER/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/votre_mdp_de_bdd/$MYSQL_ROOT_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
`cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
`cp /var/www/wordpress/wp-config.php wp-config.php
cd /var/www/wordpress
echo "Done."
echo "Creating users..."
sleep 2

wp core install  --url="$DOMAIN_NAME" \
    --title="wordpress" \
    --admin_user="$WP_ROOT_USER" \
    --admin_password="$WP_ROOT_PASSWORD" \
    --admin_email="$WP_ROOT_MAIL" \
    --allow-root
wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASSWORD --allow-root
echo "Done."
echo "All command executed, starting php"
/usr/sbin/php-fpm7.4 -F
echo "Done."
