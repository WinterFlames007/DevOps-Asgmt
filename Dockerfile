FROM php:8.2-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN a2enmod rewrite

COPY . /var/www/html/

RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html/

EXPOSE 80



# FROM php:8.2-apache

# WORKDIR /var/www/html

# COPY . /var/www/html/

# # Set ownership + permissions so Apache can read files
# RUN chown -R www-data:www-data /var/www/html \
#     && find /var/www/html -type d -exec chmod 755 {} \; \
#     && find /var/www/html -type f -exec chmod 644 {} \;

# EXPOSE 80