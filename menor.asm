.data
num1: .asciiz "Ingrese un n�mero entero:"
num2: .asciiz "Ingrese un n�mero entero:"
num3: .asciiz "Ingrese un n�mero entero:"
result: .asciiz "El n�mero menor es:"

.text
main:
  #RECIBO DATOS
	#imprimo primero x consola
	li $v0, 4 # cargo llamada al sistema 4 al registro $v0
	la $a0, num1 #cargo cadena de caracteres num1 al registro $a0
	syscall
	#leer primer n�mero
	li $v0, 5 #llamada al sistema 5, n�mero entero, al registro $v0
	syscall
	move $t0, $v0  #almaceno primer n�mero, moviendo del registro $v0 a $t0
	
	#imprimo segundo x consola
	li $v0, 4  
	la $a0, num2 #cargo cadena de caracteres num2 al registro $a0
	syscall
	#leo segundo n�mero
	li $v0, 5
	syscall
	move $t1 , $v0 #almaceno el segundo valor de $v0 en $t1 moviendolo
	
	#imprimo tercero x consola
	li $v0, 4 
	la $a0, num3 #cargo cadena de caracteres num3 al registro $a0
	syscall
	#leo tercero n�mero
	li $v0, 5
	syscall
	move $t2 , $v0 #muevo de $v0 a $t2 para almacenar el �ltimo n�mero
	
  #COMPARO 
	move $t3, $t0 #almaceno el valor de $t0 en $t3
	blt $t3,$t1, menor_t1 #branch if less than(si t3<t1) Si $t3 es menor a $t1
	move $t3, $t1  #Si es menor muevo el registro de $t1 a $t3
menor_t1:
	blt $t3,$t2, menor_t2  #si t3<t2 salto a la etiqueta 
	move $t3, $t2  #muevo el registro de $t2 a $t3
menor_t2:  
	
   #IMPRIMO MENSAJE RESULTADO
	li $v0, 4 #Llamada del sistema para imprimir cadena de caracteres
	la $a0 , result #cargo la cadena de caracteres de result a $a0
	syscall
	
  #IMPRIMO N�MERO MENOR
	li $v0, 1 #llamada al sistema para imprimir numero enterno
	move $a0, $t3 #muevo el registro de $t3 (n�mero menor) a $a0 para imprimir
	syscall
	
	#salir
	li $v0, 10  #terminar ejecuci�n
	syscall
	








