#!/bin/bash
#Solemne 01 Scripting 2019
clear
echo "
****************************************************"
echo ""
echo " Hola, bienvenido al menú de usuarios y grupos"
echo "
****************************************************"
#menu de opciones
echo ""
echo "OPCIONES"
echo ""
echo "1. CREACION DE USUARIO"
echo "2. ELIMINACION DE USUARIO"
echo "3. CREACION DE GRUPOS"
echo "4. AGREGAR USUARIO A GRUPO"
echo "5. ELIMINAR USUARIO DE UN GRUPO"
echo "6. SALIR"
echo ""
echo "Ingrese la opción que quiere utilizar"
read item
#CREACION DE USUARIOS
if [ $item = 1 ];
then
	echo "Ingrese el nombre de usuario a crear"
	read user1
	echo "Desea agregar al usuario $user1 en algún grupo en específico? (s/n)"
	read ans
	if [ $ans = s ];
	then
		echo "Nombre del GRUPO SECUNDARIO a agregar"
		read gsec
		groupadd $gsec
		echo "Nombre del GRUPO PRIMARIO a agregar"
		read gpri
		groupadd $gpri
		echo "Esta seguro que quiere crear el usuario $user1 en el GRUPO PRIMARIO $gpri y GRUPO SECUNDARIO $gsec? (s/n)"
		read ans2
		if [ $ans2 = s ];
		then
			useradd $user1 -g $gpri -G $gsec
			cat /etc/group | grep $user1
			echo "El usuario $user1 fue creado correctamente"
		fi
	fi
if [ $ans != s ];
then 
	echo "Desea crear el usuario $user1 sin GRUPOS? (s/n)"
	read ans3
	if [ $ans3 = s ];
	then
		useradd $user1
		cat /etc/group | grep $user1
		echo "EL usuario $user1 fue creado correctamente"
fi
	if [ $ans3 != s ];
	then
		echo "El usuario $user1 no fue creado, GRACIAS !!!"

fi
fi		
fi

#ELIMINACION DE USUARIOS
if [ $item = 2 ];
then
	echo "Ingrese el nombre del USUARIO a eliminar"
	read userdel
	echo "Está seguro que quiere eliminar al USUARIO $userdel? (s/n)"
	read ans4
	if [ $ans4 = s ];
	then 
		userdel -rf $userdel
		#cat /etc/group | grep $userdel
	echo "El USUARIO $userdel ha sido eliminado"
	fi
	if [ $ans4 != s ];
	then
		echo "El USUARIO $userdel no fue eliminado"
	fi
fi

#CREAR GRUPOS
if [ $item = 3 ];
then
	echo "Ingrese el nombre del Grupo a crear"
	read gru
	echo "Está seguro que quiere crear el GRUPO $gru? (s/n)"
	read ans
	if [ $ans = s ];
	then	
		groupadd $gru
		echo "El grupo $gru fue creado correctamente"
		cat /etc/group | grep $gru
		fi
fi

#ASIGNAR USUARIOS A GRUPO
if [ $item = 4 ];
then
	echo "Ingrese el nombre del usuario a modificar"
	read name
	echo "Ingrese el nombre del grupo donde quiere que se agregue $name"
	read gru
	echo "Está seguro que quiere agregar el usuario $name al grupo $gru? (s/n)"
	read ans
	if [ $ans = s ];
	then
		usermod $name -G $gru
	echo "El usuario $name fue agregado al grupo $gru correctamente"
	cat /etc/group | grep $gru
	fi
fi

#ELIMINAR USUARIOS DE UN GRUPO
if [ $item = 5 ];
then
	echo "Ingrese el nombre del usuario"
	read name
	echo "Ingrese el nombre del grupo que quiere modificar"
	read gru
	echo "Está seguro que quiere eliminar al usuario $name del grupo $gru? (s/n)"
	read ans
	if [ $ans = s ];
	then
		gpasswd -d $name $gru
	echo "El usuario $name ha sido eliminado del grupo $gru"
	fi
	if [ $ans != s ];
	then
		echo "El usuario $name no fue eliminado del grupo $gru"
	fi
fi

#SALIR
if [ $item = 6 ];
then
echo ""
echo ""
echo ""
	echo "GRACIAS POR PREFERIRNOS, HASTA LUEGO"
echo ""
echo ""
echo ""
	echo "
********************************************"
echo "FIN DEL SCRIPT"
	echo "
********************************************"
fi
