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

Es basado en la documentacion oficial:

[https://docs.gitlab.com/runner/install/linux-manually.html](https://docs.gitlab.com/runner/install/linux-manually.html)

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

## Descripcion

## Ventajas y desventajas
