FROM michaelbunch/webservices:nginx-php56
MAINTAINER Michael Bunch <michael@caeynastudios.com>

ADD ./ /var/www

RUN chmod -R 777 /var/www/storage
RUN chmod -R 777 /var/www/bootstrap/cache
