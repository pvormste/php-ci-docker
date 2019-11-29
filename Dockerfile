ARG PHP_VERSION
FROM php:${PHP_VERSION}

# Install composer
RUN php -r "copy('https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# Install deps for extensions
RUN apt update && apt install -y \
    # ext-zip
    zlib1g-dev \
    libzip-dev \
    # ext-xml
    libxml2-dev \
    # ext-gd
    libgd-dev \
    libfreetype6-dev \
    # ext-pgsql
    libpq-dev

# Install extensions
RUN docker-php-ext-install zip xml gd iconv pdo pdo_mysql pgsql pdo_pgsql

CMD ["/bin/sh"]