FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update --fix-missing -y && apt upgrade -y

# -- CONFIGURACIÓN PERSONALIZADA --
ENV DB_CONNECTION=mysql://user:pass@database_host:3306/db_name?serverVersion=10.6.18-MariaDB&charset=utf8mb4

# Preparación del sistema
RUN apt install -y apt-utils git rsync nano vim unzip curl wget software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

# Instalación de paquetes necesarios
RUN apt-get install -y sudo apache2 php8.3 php8.3-common php8.3-cli php8.3-gd php8.3-mysql php8.3-mbstring php8.3-bcmath php8.3-xml php8.3-fpm php8.3-curl php8.3-zip libapache2-mod-php8.3

# Configuración de Apache
ENV APACHE_RUN_USER appuser
ENV APACHE_RUN_GROUP appgroup
ENV APACHE_LOG_DIR /var/log/apache2
RUN rm -rf /var/www/app/*
RUN rm /etc/apache2/sites-enabled/000-default.conf
COPY Backend.conf /etc/apache2/sites-enabled/Backend.conf

# Instalación de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copia de archivos del backend
COPY app_files/. /var/www/app
RUN chown appuser:appgroup -R /var/www/app/*
RUN cd /var/www/app && COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader

# Activar módulos y reiniciar Apache
RUN a2enmod rewrite headers
RUN service apache2 restart
WORKDIR /var/www/app/
EXPOSE 8080
CMD ["apache2ctl", "-D", "FOREGROUND"]
