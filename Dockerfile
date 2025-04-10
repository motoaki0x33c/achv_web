# 使用 PHP 8.4 基礎映像（含 FPM）
FROM php:8.4-fpm

# 安裝必要套件
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    curl \
    zip \
    unzip \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl

# 安裝 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 建立目錄
WORKDIR /var/www

# 複製 Laravel 專案檔案
COPY . .

# 安裝 PHP 套件
RUN composer install --no-dev --optimize-autoloader

# 複製 Nginx 設定檔
COPY docker/nginx.conf /etc/nginx/nginx.conf

# 編譯前端資源（視情況調整）
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install && npm run build

# 設定權限
RUN chown -R www-data:www-data /var/www && chmod -R 755 /var/www/storage

# Laravel 環境變數
ENV APP_ENV=production

# Cloud Run 要求公開 port 為 8080
EXPOSE 8080

# 啟動指令
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
