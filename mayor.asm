.data
num1: .asciiz "Ingrese un número entero:"
num2: .asciiz "Ingrese un número entero:"
num3: .asciiz "Ingrese un número entero:"
result: .asciiz "El número mayor es:"

.text
main:
   #RECIBO DATOS	
	#Imprimo primer mensaje por consola
	li $v0, 4   # cargo el valor 4 (cadena de caracteres) en el registro $v0
	la $a0, num1 #se carga la cadena de caracteres num1 al registro $a0
	syscall 
	#leer primer número
	li $v0, 5  #cargo el valor 5(numero entero) al registro $v0
	syscall
	move $t0, $v0	#muevo el valor de $v0 a $t0 , almaceno el primer número
	
	#imprimo segundo x consola
	li $v0, 4  
	la $a0, num2 #se caraga la cadena de caracteres num2 en $a0
	syscall
	#leo segundo número
	li $v0, 5 
	syscall
	move $t1 , $v0 #Almaceno el segundo número en $t1 moviendolo del registro $v0
	
	#imprimo tercero x consola
	li $v0, 4 
	la $a0, num3 #se carga la cadena de caracteres num3 en $a0
	syscall
	#leo tercero número
	li $v0, 5
	syscall
	move $t2 , $v0 #Almaceno tercer número en $t2 coviendolo de $v0
	
    #COMPARO VALORES
    	move $t3, $t0 #paso el valor del registro $t0 a $t3 
	bgt $t3,$t1, mayor_t1 #branch if bigger than, compara ambos valores
	move $t3, $t1  #Almaceno t1 en t0 si t1 es mayor
mayor_t1:
	bgt $t3,$t2, mayor_t2  #Ahora compara el valor en t0 con el de t2
	move $t3, $t2  #registro t2 en t0 si este este es mayor
mayor_t2:  
	
   #RESULTADO
   	#imprimo mensaje
	li $v0, 4 #llamada al sistema para imprimir cadena de caracteres
	la $a0 , result #cargo el mensaje de result a $a0
	syscall
	
	#imprimo numero
	li $v0, 1 #cargo el valor del entero en $v0 para imprimir
	move $a0, $t3 #mueve el valor en $t0 (el amyor) a $a0 para imprimir 
	syscall
	
   #SALIR
	li $v0, 10  #terminar ejecución
	syscall
	




