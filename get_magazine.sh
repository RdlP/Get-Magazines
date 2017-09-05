#ª/bin/bash

echo "Revistas disponibles"
echo "\t [1] TheMagPi"
echo "\t [2] Odroid Magazine"
read -p "¿Que revista desea descargar?:" selection
if [ "$selection" = 1 ]; then
	read -p "Seleccione el primer número que desea descargar[1]:" selection
	first_number=${selection:-1}
	read -p "Seleccione el último número que desea descargar[$first_number]:" selection
	last_number=${selection:-1}
	for i in `seq -f "%02g" $first_number $last_number`;
	do
		wget https://www.raspberrypi.org/magpi-issues/MagPi$i.pdf
	done
elif [ "$selection" = 2 ]; then
	read -p "Seleccione el año del primer número que desea descargar[2014]:" selection
	first_year=${selection:-2014}
	read -p "Seleccione el mes del primer número que desea descargar[1]:" selection
	first_month=${selection:-1}

	read -p "Seleccione el año del último número que desea descargar[2017]:" selection
	last_year=${selection:-2017}
	read -p "Seleccione el mes del último número que desea descargar[1]:" selection
	last_month=${selection:-1}

	for i in `seq $first_year $last_year`;
	do
		for j in `seq -f "%02g" $first_month $last_month`;
		do
			wget https://magazine.odroid.com/wp-content/uploads/ODROID-Magazine-$i$j-Espanol.pdf
		done
	done
fi