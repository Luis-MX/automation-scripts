# Gitlab y Gitlab Runner

- [Instalacion](#instalacion)
- [Ejemplo rapido de despliegue automatizado](#ejemplo)
- [¿Que es?](#que-es)
- [¿Para que sirve?](#para-que-sirve)
- [¿Quien lo usa?](#quien-lo-usa)
- [Descripcion](#descripcion)
- [Ventajas y desventajas](#ventajas-y-desventajas)

## Instalacion

### Servidor de Gitlab

Los comandos de instalcion en ubuntu se encuentran en el [siguiente script](./setup.sh).

Es basado en la documentacion oficial: [https://about.gitlab.com/install/#ubuntu](https://about.gitlab.com/install/#ubuntu)

Despues de la instalacion se debe configurar la cuenta de administrador.
Cuando se accede por primera vez a la direccion especificada para el
servidor muestra un formulario para asignar una nueva contraseña para
la cuenta de administrador, despues de ello se puede acceder con usuario root
y la contraseña especificada.

### Instalacion y configuracion de Gitlab Runner en un servidor propio

Los comandos de instalcion en ubuntu se encuentran en el [siguiente script](./gitlab-runner-setup.sh).

Es basado en la documentacion oficial: [https://docs.gitlab.com/runner/install/linux-manually.html](https://docs.gitlab.com/runner/install/linux-manually.html)

Mostrar ayuda de gitlab runner:

```bash
gitlab-runner register -h
```

Despues se registra con el comando `gitlab-runner register`:

```bash
# sudo gitlab-runner register --non-interactive --url "https://gitlab.com/" --registration-token "PROJECT_REGISTRATION_TOKEN" --executor "docker" --docker-image alpine:latest --description "docker-runner" --tag-list "docker,aws" --run-untagged="true" --locked="false" --access-level="not_protected"
sudo gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --registration-token "PROJECT_REGISTRATION_TOKEN" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner" \
  --tag-list "docker,aws" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"
```

Archivo de configuracion en `/etc/gitlab-runner/config.toml`.

## Ejemplo

La instalacion y ejemplo se encuentra tambien en YouTube:

[![Deployment con GitLab Runner](http://img.youtube.com/vi/hVdbkZ8vdvQ/0.jpg)](http://www.youtube.com/watch?v=hVdbkZ8vdvQ "Deployment con GitLab Runner")

1. Primero se requiere un repositorio.

2. Se debe crear un Runner y registrarlo al servidor de gitlab donde se tenga tal repositorio,
este debe estar instalado en la instancia donde se desea publicar la aplicacion o sitio

3. En el repositorio se deben crear los siguientes archivos:

Un ejemplo simple de despliegue en flask requiere 4 archivos en el repositorio: el mas
importante es `.gitlab-ci.yml`, este pose las intrucciones para implementar
un pipeline de integracion continua, el siguiente pipeline tiene un un job llamado
`before_script` que limpia la version anterior del sitio cada que es actualizado,
`deploy_prod` se encarga tomar el codigo flask y empaquetarlo dentro de una imagen
de docker que usa de base python3 para correr el sitio y publicarlo automaticamente
en el puerto 80 de la instancia donde es ejecutado, esto es realizado en cada cambio
enviado al repositorio:

```yml
stages:
  - deploy

before_script:
  - sudo docker rm --force flask_container || echo "Error al borrar un contenedor"
  - sudo docker rmi $(docker images -a -q) || echo "Error al borrar las imagenes de docker"
  - rm -rf $HOME/site/*

deploy_prod:
  stage: deploy
  script:
    - if [[ !(-d $HOME/site) ]]; then
    - mkdir -p $HOME/site
    - fi
    - cp * $HOME/site
    - cd $HOME/site
    - sudo docker build -t flask_image .
    - sudo docker run --publish 80:5000 --detach --name flask_container flask_image
  environment:
    name: production
    url: http://34.71.228.251/
  only:
    - master
```

Los demas archivos son parte del proyecto, el codigo de la aplicacion se encuentra en
`app.py`:

```python
from flask import Flask
import datetime
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hola mundo {}'.format(3 ** 5)
```

Las dependencias se encuantran en `requirements.py`:

```
Flask==1.0.2
```

Y por ultimo el archivo `Dockerfile`, usar docker es de los metodos mas sencillos
para configurar y desplegar una aplicacion de forma automatizada:

```
FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN export FLASK_APP=app.py
RUN export FLASK_ENV=development

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0"]
```

## Que es

Segun el mismo sitio [https://about.gitlab.com/](https://about.gitlab.com/);
"GitLab es una completa plataforma de Devops: Con GitLab, obtienes un completo
conjunto de herramientas de CI/CD en una sola aplicacion. Una interface. Una
conversacion. Un modelo de permisos. Miles de caracteristicas. Te asombrara
todo lo que GitLab puede hacer hoy. Y solo estamos comenzando"

## Para que sirve

Ejecuta gitlab en un propio servidor para obtener una mayor cantidad
de caracterirticas gratuitas y con mas control.

Usando Gitlab Runner en un servidor propio se pueden usar las caracteristicas
de Gitlab CI para aprovechar al maximo un entorno completo de herramientas de
desarrollo y DevOps, el sistema mas completo que en un solo entorno se combine
git, implementacion de pipelines como en jenkins, etc. En [gitlab.com](https://gitlab.com)
se proporciona de forma gratuita 2,000 minutos al mes de soporte para runners
mientras que con un runner propio se puede usar de forma ilimitada.

## Quien lo usa

Algo muy caracteristico de GitLab es que es mayormente usado por grandes
organizaciones o empresas privadas que por desarrolladores indivuduales.

Ejemplos de clientes de GitLab son: 

![Deployment con GitLab Runner](./images/screenshot.png)

## Descripcion

Ambas herramientas se pueden utilizar desde gitlab.com como un servicio con
con limitaciones sin necesidad de requerir infraestrucutra, esto es preferible
en caso de desarrolladores individuales, a nivel empresarial es mas rentable
instalar estas herramientas en infraestrucura propia y sin limitaciones en
proyectos, usuarios, administracion y funcionalidad.

Dos elementos clave son el servidor de GitLab para administracion de codigo
y proyectos, mientras que GitLab Runner permite automatizar operaciones que
son ajenas al codigo; por ejemplo la compilacion de releases, la publicacion
de cobertura de codigo, pruebas unitarias, despliegue de proyectos a diferentes
etapas o plataformas, entre otros.

GitLab simplemente es una plataforma de administracionde repositorios y proyectos
igualmente que BitBucket y Github, con la diferencia de ser Open Source.

Giltab Runner automatiza Pipelines ejecutandolas a traves de eventos, scripts
cargados en entornos virtuales llamados executors como el shell o imagenes de
docker. No posee dependencias y esta escrito en Go.

## Ventajas y desventajas

| Ventajas                                                                                                          | Deventajas                                                                                                      |
| ----------------------------------------------------------------------------------------------------------------- |----------------------------------------------------------------------------------------------------------------:|
| Es Open Source                                                                                                    | Siendo abierto no impulsa a la comunidad Open Source como en Github, sino a grandes corporativos                |
| Permite ejecutarse en infraestructura propia                                                                      | El servicio no es muy atractivo para desarrolladores individuales a diferencia de otros ecosistemas como github |
| Integra en una sola plataforma muchas, tantas herramientas que por si solas usarlas juntas llevaria mucho trabajo | Su documentacion es pobre, lo que provoca que aun siendo un gran producto la mayoria desconosca sus capacidades |
