#!/usr/bin/env bash

echo "Este script lo hizo luisillo"
echo "Corriendo desde: `pwd`"
sudo apt update
sudo apt install -y apache2
if ! [ -L /var/www ]; then
  sudo ufw app list
  sudo ufw allow 'Apache'
  sudo mkdir /var/www/mi_dominio.com
  sudo chown -R $USER:$USER /var/www/mi_dominio.com
  sudo chmod -R 755 /var/www/mi_dominio.com
  echo "
    <html>
        <head>
            <title>Bienvenido a mi_dominio.com!</title>
        </head>
        <body>
            <h1>Todo funcionando!</h1>
        </body>
    </html>
  " | tee /var/www/mi_dominio.com/index.html
  echo "
    <VirtualHost *:80>
        ServerAdmin webmaster@localhost
        ServerName mi_dominio.com
        ServerAlias mi_dominio.com
        DocumentRoot /var/www/mi_dominio.com
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
  " | sudo tee /etc/apache2/sites-available/mi_dominio.com.conf
  sudo a2ensite mi_dominio.com.conf
  sudo a2dissite 000-default.conf
  sudo apache2ctl configtest
  sudo systemctl restart apache2
  hostname -I
  ifconfig
fi