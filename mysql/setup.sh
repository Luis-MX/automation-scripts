# Verificar url antes de ejecutar en https://dev.mysql.com/downloads/repo/apt/
wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
# Durante la instalacion pedira configurar que instalar
# Recomendado en entorno grafico:
#   1. MySQL Server y Cluster version 8
#   2. MySQL Tools y Connectors (Habilitado)
#   3. MySQL Preview Packages (Deshabilitado)
# Recomendado para pruebas y en servidor:
#   1. MySQL Server y Cluster version 8
#   2. MySQl Tools y Connectors (Deshabilitado)
#   3. MySQL Preview Packages (Deshabilitado)
sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb

sudo apt-get update
# Durante la instalacion pide un password para root
# Durante el desarrollo yo uso "root"
sudo apt-get install mysql-server
sudo service mysql status

# Para detener o iniciar el servicio:
# shell> sudo service mysql stop
# shell> sudo service mysql start
