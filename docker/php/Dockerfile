FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    acl 

RUN docker-php-ext-configure zip

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

# Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Alias
RUN echo 'alias sf="php bin/console"' >> ~/.bashrc

WORKDIR /var/www/symfony

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash -s -- --install-dir=/usr/local/bin

