FROM alpine:3.15.4
MAINTAINER Samuel Goncalves

WORKDIR /var/www/localhost/htdocs/
RUN apk --no-cache add apache2 php7 php7-apache2 php7-fpm php7-opcache php-session && rm index.html \
    && ln -sf /dev/stdout /var/log/apache2/access.log && ln -sf /dev/stderr /var/log/apache2/error.log

COPY intranet/ .

EXPOSE 8080
ENTRYPOINT ["httpd","-D","FOREGROUND"]

