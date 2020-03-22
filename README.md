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

## Working with Ansible

Script are made for ubuntu, first script is [here](../blob/master/ansible/setup.sh) and it is based on [oficial documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu).
