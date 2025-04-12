# 使用 PHP 8.4 FPM
FROM php:8.4-fpm

# 安裝套件
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    unzip \
    curl \
    libzip-dev \
    zip \
    && docker-php-ext-install pdo pdo_mysql zip

# 安裝 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 複製 nginx 設定
COPY docker/nginx.conf /etc/nginx/sites-available/default

# 設定工作目錄
WORKDIR /var/www

# 複製整個 Laravel 專案進去容器
COPY . /var/www

# 設定權限（避免 storage/logs 沒權限）
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www/storage

# 解壓縮 env 設定檔
ARG env_key
RUN echo "env_key is [$env_key]"
RUN unzip -o -P $env_key env_prod.zip

# 安裝 PHP 套件
RUN composer install --no-dev --optimize-autoloader

# Cloud Run 開 port 為 80
EXPOSE 80

# 啟動 nginx 和 php-fpm
CMD service nginx start && php-fpm
