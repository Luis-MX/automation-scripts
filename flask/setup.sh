sudo apt update
sudo apt install python3.7 python3-pip virtualenv
# Si se usa mysql, estos paquetes son necesarios
sudo apt install libmysqlclient-dev libssl-dev
virtualenv -p python3.7 .env
source .env/bin/activate
# El nombre correcto es requirements
# Si se usa mysql, se supone que ya esta configurado
# y se pueden instalar los paquetes que usa python
pip install -r requeriments.txt
export LANG=C.UTF-8
export FLASK_APP=application.py
export FLASK_ENV=development
flask run --host=0.0.0.0
