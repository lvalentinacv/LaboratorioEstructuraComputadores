.data 
numMax: .asciiz "Ingrese el valor hasta el que quiere la serie Fibonacci: " 
result: .asciiz  "La serie Fibonacci es: "
.text 

main:
   #Solicito que ingrese el numMax
	li $v0, 4 #llamada al sistema para imprimir el mensaje 
	la $a0, numMax  #cargo la información de numMax en el registro $a0
	syscall
	#leer el valor
	li $v0, 5 #llamada para leer lo ingresado en $v0
	syscall
	move $t0, $v0 #Almaceno el valor del registro $v0 en $t0
	
   #Primeros números Fibonacci
	li $t1, 0 #cargo el valor 0 en el registro $t1
	li $t2, 1 #cargo el valor 1 en el registro $t2
	
	#Imprimo mensaje resultado
	li $v0,4   #llamada al sistema para imprimir cadena de caracteres
	la $a0, result  #cargo la cadena de caracters de result a $a0
	syscall
	#imprimo serie con función 
	move $a0, $t1 #muevo el registro de  $t1 para imprimirlo 
	jal imprimir_numeros #llamo a la funcion creada
	move $a0, $t2 #muevo el registro $t2 para imprimirlo 
	jal imprimir_numeros #llamo a la función crada
	
	
    #Serie Fibonacci
	li $t3, 2 #inicilizo indice con el numero de la serie 2
	loop: #creo un ciclo
		#Calculo t4 = F(n), En t4 se encuentra el último número de la serie
		add $t4, $t1, $t2 #En t4 se registra la suma de los dos numeros anteriores F(n-1) y F(n-2)
		
		#imprimo número de $t4
		move $a0, $t4 #Primero lo cargo en $a0
		jal imprimir_numeros  #llamo la función de imprimir creada
		
		#actualizo los valores en t1 y t2 para el proximo calculo
		move $t1,$t2 # muevo f(n-1) a f(n-2) 
		move $t2, $t4 # muevo f(n) a  f(n-1)
		
		#incremento indice contador  t3 
		addi $t3, $t3,1  #sumar inmediato
		
		#comparo registros para ver si alcance el valor numMax
		bne $t3, $t0, loop #Si no es igual continuo en el bucle
		
	#SALIR DEL PROGRAMA
	li $v0, 10 #terminar ejecución
	syscall 
#Función para imprimir
imprimir_numeros:
	li $v0, 1 #cargo un entero
	syscall
	li $v0, 11 #cargo para imprimir caracter
	li $a0, 32  #imprimo un espacio para el orden 
	syscall
	jr $ra #volver a la llamada 
	
		
			 	 
	
