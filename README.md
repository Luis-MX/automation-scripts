# Automation Scripts

Bash scripts for common tasks like development environments or CI/CD

## Some basic tricks for scripting

```bash
echo -n Escribe un valor:

read variable

echo "{
        Ruta: $(pwd)
        Operacion matematica: $((4*63))
        El valor de la variable es: $variable
}" | sudo tee file
echo Terminado
```

## Automation with Ansible

Ansible is a simple and powerful automation engine.

Script are made for ubuntu, first script is [here](./ansible/setup.sh) and it is based on
[oficial documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu).

## Automation with Vagrant

Vagrant is an open-source software product for building and maintaining portable virtual software development environments.

In vagrant exists **Provisioning** concept in which, we can automate common
tasks like setup an environment when we run vagrant up at first, all that
with VagrantFile, next example shows how it looks:

```bash
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

```

A complete example can be found [here](./vagrant/basic_provisioning/Vagrantfile).

A complete guide to automate vagrant boxes can be found [here](./vagrant/README.md).
