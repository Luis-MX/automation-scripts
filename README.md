# Automation Scripts

Bash scripts for common tasks like development environments or CI/CD

## Some basic tricks for scripting

```bash
echo -n Escribe un valor:

read variable

echo "{
        Ruta: $(pwd)
        Operacion matematica: $((4*63))
        El valor de la variable es: \$variable
}" | sudo tee file
echo Terminado
```
