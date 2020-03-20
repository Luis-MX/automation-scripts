# Script para automatizar el despliegue de aplicaciones Flask

sudo apt update
# nginx es un servidor proxy y actua como servidor y
# balanceador de carga entre las solicitudes de clientes
# y el servidor de paginas web

# El archivo de configuracion de nginx es "nginx.conf" y
# puede ubicarse en:
#   - /usr/local/nginx/conf
#   - /etc/nginx
#   - /usr/local/etc/nginx

# Iniciando, Deteniendo y recargando configuraciones
# $ nginx -s <signal>
# Se ejecuta con -s seguido de una accion a ejecutar, por ejemplo:
# $ nginx -s stop # Para forzar un apagado de inmediato
# $ nginx -s quit # Para apagar normalmente
# $ nginx -s reload # Para recargar el archivo de configuracion
# $ nginx -s reopen # Para abrir nuevamente los logs
# Deberia ser usado con el usuario que lo inicio(Podria ser necesario sudo)

# Para saber la lista de procesos de nginx:
# $ ps -ax | grep nginx
# Para detenerlos con kill:
# kill -s QUIT <numero de proceso>
sudo apt install python3-pip virtualenv nginx

# Iniciar el servicio de nginx
sudo /etc/init.d/nginx start

# Eliminar las configuraciones por default de nginx
sudo rm /etc/nginx/sites-enabled/default

# Crear las configuraciones para la aplicacion Flask
sudo touch /etc/nginx/sites-available/flask_settings
# Al crear un enlace simbolico en sites-enabled, la configuracion hecha
# se pone en funcionamiento, si no estan en sites-enabled no se ponen en funcionamiento
sudo ln -s /etc/nginx/sites-available/flask_settings /etc/nginx/sites-enabled/flask_settings

# Codigo basico para configurar nginx
# Se dice que nginx servira como proxy un sitio web local en el puerto 8000
# pero hacia internet por el puerto 80
echo "server {
	access_log /var/log/nginx/myapp.log

	location / {
		proxy_pass http://127.0.0.1:8000;
		proxy_set_header Host \$host;
		proxy_set_header X-Real-IP \$remote_addr;
	}
}" | sudo tee /etc/nginx/sites-enabled/flask_settings

# Reiniciar para aplicar los cambios
sudo /etc/init.d/nginx restart

# Suponiendo que la ubicacion actual es la carpeta de la aplicacion flask
virtualenv -p python3 .env
source .env/bin/activate
pip install -r requirements.txt
# Gunicorn es un servidor http WSGI de python para UNIX
# y es recomendado usarlo detras de un servidor proxy como nginx
pip install gunicorn
which gunicorn
# Se le esta indicando que debe servir el modulo(archivo .py) hello
# y la aplicacion app(nombre de la variable o funcion en hello.py para almacenar la aplicacion)
gunicorn hello:app
