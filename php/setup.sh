# Esto instala composer y sus dependencias que ya incluyen php
# para trabajar con laravel
sudo apt update
sudo apt install composer
cp .env.example .env
# Los siguientes paquetes son usados por laravel
sudo apt install php7.2-mysql
sudo apt install php7.2-mbstring
sudo apt install php-xml
# Debe ser ejecutado al final, de lo contrario
# lanza un error por dependencias incompletas
composer install
php artisan key:generate
# En caso de tener problemas con la autenticacion
# de mysql 8 usar las siguientes sentencias:
# ALTER USER 'myuser'@'%' IDENTIFIED WITH mysql_native_password BY 'mypassword';
# FLUSH PRIVILEGES;
php artisan serve --host 0.0.0.0 --port 8080
