FROM php

# PHP
RUN apt-get update
RUN apt-get install -y wget


RUN wget -O phpunit https://phar.phpunit.de/phpunit-10.phar

RUN chmod +x phpunit

WORKDIR "/app"

ENTRYPOINT /phpunit