FROM michaelbunch/nginx-php:5.6
MAINTAINER Michael Bunch <michael@caeynastudios.com>

ADD ./ /var/www

RUN chmod -R 777 /var/www/storage
RUN chmod -R 777 /var/www/boostrap/cache
