#!/bin/bash

echo "Ingrese un Nombre para determinar su género y probabilidad:"
read nombre


respuesta="https://api.genderize.io?name=${nombre}"
response=$(curl -s "$respuesta")


if [ -z "$response" ]; then
    echo "No se recibió una respuesta válida de la API."
    exit 1
fi

name=$(echo "$response" | jq -r '.name')
gender=$(echo "$response" | jq -r '.gender')
probability=$(echo "$response" | jq -r '.probability')


probability=$(echo "$probability * 100" | bc)


if [ "$gender" = "male" ]; then
    gender="Masculino"
elif [ "$gender" = "female" ]; then
    gender="Femenino"
else
    gender="Indefinido"
fi

echo "Nombre $name Genero: $gender Probabilidad: ${probability}%"






