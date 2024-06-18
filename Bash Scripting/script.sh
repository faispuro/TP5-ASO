
#!/bin/bash

numero_aleatorio=$(( (RANDOM % 100) + 1 ))

echo "Bienvenido a Adivina el numero!"

intentos=0
adivinar=false

while ! $adivinar; do
    echo -n "Ingrese un número del 1 al 100 para adivinar: "
    read intento

    if [[ $intento -lt 1 || $intento -gt 100 ]]; then
        echo "El numero ingresado no es Correcto. Por favor, ingrese otro."
    elif [[ $intento -lt $numero_aleatorio ]]; then
        echo "Casi, el numero fue muy bajo. Intente de nuevo!"
        ((intentos++))
    elif [[ $intento -gt $numero_aleatorio ]]; then
        echo "Casi, el  numero fue muy alto. Intente de nuevo!"
        ((intentos++))
    else
        ((intentos++))
        echo "Has adivinado el numero $numero_aleatorio en $intentos intentos!"

        adivinado=true
    fi
done

exit 0





