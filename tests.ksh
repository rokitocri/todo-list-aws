#!/bin/ksh

FILE=test/integration/todoApiTest.py

# Obteniendo la URL del archivo url_output.txt
URL="$(egrep Value url_output.txt | tr -s " " | cut -f2 -d" " | grep todos | egrep -v id | uniq | sed 's/\/$//g' | uniq | sed 's/\/todos//g')"

# Sustituyendo la cadena "BASE_URI" por la URL obtenida en el archivo todoApiTest.py
sed -i "s|BASE_URI|\"${URL}\"|g" $FILE
