<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## 關於練習專案

一個以「日常探索」為主的網站／平台，每天提供用戶一個簡單、趣味、可執行的城市生活任務，透過打卡、照片分享、留言互動，建立一個 探索生活 × 社群激勵 的平台。

## 開發環境
- php：8.4
- 後端：Laravel 12
- 前端：Vue3 + Inertia.js (SPA)
- 認證系統：Laravel Sanctum
- 前端樣式：Tailwind CSS

## 架設環境
- git：github
- 伺服器：Nginx
- 使用 Google Cloud 服務：
  - 服務容器：Cloud Run
  - SQL：MySQL 8.0
  - 自動部屬：Cloud Build

## 問題紀錄
- .env 使用 zip 帶密碼壓縮，但在 window 中 壓縮時需選擇`傳統加密法`，才可在 linux 上解壓縮
- 部屬要使用的 port 需與 cloud run 預設的值一樣(8080)，80 與 443 cloud run 會自行處理，不需要自行加開 port
- 如果`nginx.conf`的`fastcgi_pass php_upstream;`無法使用，則改成`127.0.0.1:9000`
- 在觸發條件的 cloudbuild.yaml 中，要增加的變數不只在`args`中要寫，最下方`tags`也要加上，不然不能使用
- laravel 中如果出現引入的資源被擋下(mixed block)，直接在`app\Providers\AppServiceProvider.php`中加上`URL::forceScheme('https');`就好
