FROM php:8.1.22-cli

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_mysql zip

RUN  curl -sS https://getcomposer.org/instaler | php -- --install-dir=/usr/local/bin --filename=composer

COPY  . /var/www

WORKDIR /var/www

CMD ["php", "-s", "0.0.0.0:8000"]