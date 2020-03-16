# Scripts de automatizacion para MySQL

Instalacion de y configuracion de MySQl con el archivo [setup.sh](./setup.sh)

## Creacion de una base de datos en utf-8

`
CREATE DATABASE mydatabase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
`

## Eliminacion de una base de datos

`
DROP DATABASE mydatabase;
`

## Creacion, eliminacion de usurios y permisos

`
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'password';
`
o para aceptar conexiones de cualquier direccion:
`
CREATE USER 'myuser'@'%' IDENTIFIED BY 'password';
`

`
GRANT ALL ON mydatabase.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;
`

`
DROP USER 'myuser'@'localhost';
`

## Ejecutar un script sql desde el shell de MySQl

`
source path/to/script.sql;
`
