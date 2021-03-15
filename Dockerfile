FROM wordpress:5.7.0-php8.0-fpm

#install vim
RUN apt-get update && \
    apt-get install apt-file -y && \
    apt-file update && \
    apt-get install vim -y

WORKDIR /usr/local/etc/php
RUN touch /usr/local/etc/php/php.ini
RUN echo 'upload_max_filesize = 256M' > '/usr/local/etc/php/php.ini'

WORKDIR /var/www/html
RUN echo 'php_value upload_max_filesize 256M' > '/var/www/html/.htaccess'
