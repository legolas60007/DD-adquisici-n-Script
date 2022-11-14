#!/bin/sh
read -p "Dispositivo de Origen: " Origen
read -p "Dispositivo de Destino: " Destino
read -p "Tipo de Hash (md5,sha1,sha256): " Hash
read -p "¿Quiere comprensión (si o no)?: " Comp
A="md5"
B="sha1"
C="sha256"
S="si"
	if [ $Hash = $A ]; then
		if [ $Comp = $S ]; then
		dd if=$Origen of=$Destino/forense.raw status=progress | gzip -c -9 > $Destino/forense.raw.gz
		md5sum $Destino/forense.raw > $Destino/forense.txt | gzip -c -9 > $Destino/forense.txt.gz
		else
		dd if=$Origen of=$Destino/forense.raw status=progress
		md5sum $Destino/forense.raw > $Destino/forense.txt
		fi
	elif [ $Hash = $B ]; then
		if [ $Comp = $S ]; then
		dd if=$Origen of=$Destino/forense.raw status=progress | gzip -c -9 > $Destino/forense.raw.gz
		sha1sum $Destino/forense.raw > $Destino/forense.txt | gzip -c -9 > $Destino/forense.txt.gz
		else
		dd if=$Origen of=$Destino/forense.raw status=progress
		md5sum $Destino/forense.raw > $Destino/forense.txt
		fi
	elif [ $Hash = $C ]; then
		if [ $Comp = $S ]; then
		dd if=$Origen of=$Destino/forense.raw status=progress | gzip -c -9 > $Destino/forense.raw.gz
		sha256sum $Destino/forense.raw > $Destino/forense.txt | gzip -c -9 > $Destino/forense.txt.gz
		else
		dd if=$Origen of=$Destino/forense.raw status=progress
		md5sum $Destino/forense.raw > $Destino/forense.txt
		fi
	else
		echo "algo anda mal..."
		exit 1
	fi
