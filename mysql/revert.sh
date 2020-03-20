# Elimina solo el paquete indicado, pero no sus dependencias
sudo apt-get purge mysql
# Elimina las dependencias que ya no son necesarias
sudo apt-get autoremove --purge
