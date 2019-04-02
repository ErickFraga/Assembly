.data
	pi: .float 3.14
	msg1: .asciiz "Digite o raio\n"
	msg2: .asciiz "Perimetro = \n"
	msg3: .asciiz "\nArea =" 
	
.text
#exibir mensagem
	la $a0, msg1
	li $v0, 4
	syscall 
#ler raio
	li $v0, 6 # o valor lido foi para f0 
	syscall
#carregar pi
	la $s0,pi
	lwc1 $f1, 0($s0) # lwc1 ou l.s | f1 = 3.14
# calcular raio
	mul.s $f2, $f0, $f0 # f2 = raio x raio 
	mul.s $f2, $f2, $f1 # f2 = (raio x raio) x pi
#exibir mensagem
	la $a0, msg3
	li $v0, 4
	syscall 
#exibir area
	li $v0, 2
	mtc1  $0, $f3 # trazer o zero para f3 | f3 = 0.0 
	add.s $f12, $f3, $f2 # f12 = 0 + f2
	syscall
#carregar 2
	addi $t0, $0, 2
	mtc1 $t0, $f2 # trazer o 2 para f2 | f2 = 2
	cvt.s.w $f2, $f2 # converte de word para float
	
	
# Calcular de p
	mul.s $f3, $f2, $f1 # f3 = f2 + f1
	mul.s $f3, $f3, $f0
#exibir mensagem
	la $a0, msg3
	li $v0, 4
	syscall 
#Exibir area 
	li $v0, 2
	mtc1 $0, $f4 # f4 = 0.0
	add.s $f12, $f4, $f3
	syscall
 
