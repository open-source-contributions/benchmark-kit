FROM ubuntu:18.04

RUN apt-get update \
    && apt-get upgrade -y
RUN apt-get install -y \
    vim \
    zip \
    bash-completion \
    sudo \
    nginx \
    wget

# php
RUN apt-get install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get install -y \
        php5.6-fpm php5.6-xml php5.6-intl php5.6-mysql php5.6-mbstring php5.6-curl php5.6-zip php5.6-apcu \
        php7.0-fpm php7.0-xml php7.0-intl php7.0-mysql php7.0-mbstring php7.0-curl php7.0-zip php7.0-apcu \
        php7.1-fpm php7.1-xml php7.1-intl php7.1-mysql php7.1-mbstring php7.1-curl php7.1-zip php7.1-apcu \
        php7.2-fpm php7.2-xml php7.2-intl php7.2-mysql php7.2-mbstring php7.2-curl php7.2-zip php7.2-apcu \
        php7.3-fpm php7.3-xml php7.3-intl php7.3-mysql php7.3-mbstring php7.3-curl php7.3-zip php7.3-apcu

# composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && mv composer.phar /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && php -r "unlink('composer-setup.php');"

# install git alone, or it will ask some geographical configs, I don't know why
RUN apt-get install -y git

# create user with same name as host user name
ARG DOCKER_UID
RUN useradd -ms /bin/bash --uid ${DOCKER_UID} phpbenchmarks \
    && usermod -a -G www-data phpbenchmarks
