# backend-apache/Dockerfile

FROM php:7.4-apache

# 1. Instalação de dependências
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libpq-dev \
    libzip-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_pgsql zip
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer

ARG GITHUB_REPO_URL

WORKDIR /app_source
RUN git clone --depth 1 ${GITHUB_REPO_URL}

WORKDIR /app_source/college-project-restaurant-management-system/finfood-api

RUN composer install --no-dev --no-interaction --prefer-dist --no-scripts

WORKDIR /var/www/html
RUN rm -rf ./*
RUN cp -a /app_source/college-project-restaurant-management-system/finfood-api/. .

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
COPY apache.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite headers

ENTRYPOINT ["entrypoint.sh"]
