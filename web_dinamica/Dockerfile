# Usar la imagen base oficial de PHP con Apache
FROM php:8.2-apache

# Instalar extensiones necesarias para MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiar archivos del proyecto al contenedor
COPY app/ /var/www/html/

# Configuración personalizada de Apache
COPY conf/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Activar mod_rewrite para Apache
RUN a2enmod rewrite

# Establecer permisos
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 755 /var/www/html/
