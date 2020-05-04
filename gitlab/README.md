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

Los comandos de instalcion en ubuntu se encuentran en el [script](./setup.sh).

Despues de la instalacion se debe configurar la cuenta de administrador.
Cuando se accede por primera vez a la direccion especificada para el
servidor muestra un formulario para asignar una nueva contraseña para
la cuenta de administrador, despues de ello se puede acceder con usuario root
y la contraseña especificada.

### Instalacion y configuracion de Gitlab Runner en un servidor propio

Los comandos de instalcion en ubuntu se encuentran en el [script](./gitlab-runner-setup.sh).

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

## Que es

Ejecuta gitlab en un propio servidor para obtener una mayor cantidad
de caracterirticas gratuitas y con mas control.

Usando Gitlab Runner en un servidor propio se pueden usar las caracteristicas
de Gitlab CI para aprovechar al maximo un entorno completo de herramientas de
desarrollo y DevOps, el sistema mas completo que en un solo entorno se combine
git, implementacion de pipelines como en jenkins, etc. En [gitlab.com](https://gitlab.com)
se proporciona de forma gratuita 2,000 minutos al mes de soporte para runners
mientras que con un runner propio se puede usar de forma ilimitada.

## Para que sirve

## Quien lo usa

## Descripcion

## Ventajas y desventajas
