FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
        curl \
        libicu-dev \
        libzip-dev \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libwebp-dev \
        unzip \
        git \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev \
        zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) intl pdo_mysql mysqli zip bcmath exif gd opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

COPY ./php-fpm.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www/html
