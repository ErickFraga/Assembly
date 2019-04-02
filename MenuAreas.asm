.data 
	# Menu principal
	ret: .asciiz "\n\n\t1 - Area do retangulo"
	tri: .asciiz "\n\t2 - Area do tirangulo"
	qua: .asciiz "\n\t3 - Area do quadrado"
	esc: .asciiz "\n\tQual sua escolha ?"
	out: .asciiz "\n\tArea escolhida : "
	
	# bases
	base: .asciiz "\n\tInforme a base : "
	altura: .asciiz "\n\tInforme a altura : " 
	
	
	adeus: .asciiz "\n\n ---Fim da execução \n Adeus!"
.text

Main:
	li $v0, 4 # Modo print string
	
	la $a0, ret # print ret
	syscall
	
	la $a0, tri # print tri
	syscall
	
	la $a0, qua # print qua
	syscall
	
	la $a0, esc # print esc
	syscall
	
	li $v0, 5 # modo read integer
	syscall
	add $t7, $0, $v0 # peaga o valor lido
	
	bgt $t1, 3, Fim # if( op > 3 || op < 1) --> exit
	blt $t7, 1, Fim
	
	beq $t7, 1, Retangulo # if(op == 1) --> Retangulo
	beq $t7, 2, Triangulo # if(op == 2) --> Triangulo
	beq $t7, 3, Quadrado # if(op == 3) --> Quadrado
	

Retangulo:
	li $v0, 4
	la $a0, ret # print ret
	syscall
	# trasendi 0 pro cp1	
	li $t6, 0
	mtc1 $t6, $f6
	cvt.s.w $f6, $f6
	
	li $v0, 4 # modo print string
	la $a0, base # pegunta a base
	syscall
	
	li $v0, 6 # modo read float
	syscall
	add.s $f1, $f6, $f0 # f1 = float lido
	
	li $v0, 4 # modo print string
	la $a0, altura # pegunta a altura
	syscall
	
	li $v0, 6 # modo read float
	syscall
	add.s $f2, $f6, $f0 # f2 = float lido	
	
	mul.s $f3, $f1, $f2 # f3 = f2 * f1
	# adicionado em f12 para poder printar
	
	li $v0, 4 # modo print string
	la $a0, out 
	syscall # exibe o =texto de saida
	
	li $v0, 2 # modo print integer
	add.s $f12, $f6, $f3 # f12 = $f3
	syscall
	
	j Main
Triangulo:
	li $v0, 4
	la $a0, tri # print tri
	syscall

	# trasendo 0 pro cp1	
	li $t6, 0
	mtc1 $t6, $f6
	cvt.s.w $f6, $f6
	
	# trasendo 2 pro cp1
	li $t5, 2
	mtc1 $t5, $f5
	cvt.s.w $f5, $f5
	
	li $v0, 4 # modo print string
	la $a0, base # pegunta a base
	syscall
	
	li $v0, 6 # modo read float
	syscall
	add.s $f1, $f6, $f0 # f1 = float lido
	
	li $v0, 4 # modo print string
	la $a0, altura # pegunta a altura
	syscall
	
	li $v0, 6 # modo read float
	syscall
	add.s $f2, $f6, $f0 # f2 = float lido	
	
	mul.s $f3, $f1, $f2 # f3 = f2 * f1
	
	div.s  $f4, $f3, $f5 # f3 = f3 / 2.0
	
	li $v0, 4 # modo print string
	la $a0, out 
	syscall # exibe o =texto de saida
	
	li $v0, 2 # modo print integer
	add.s $f12, $f6, $f4 # f12 = $f3
	syscall

	j Main
Quadrado:
	li $v0, 4
	la $a0, qua # print ret
	syscall
	# trasendi 0 pro cp1	
	li $t6, 0
	mtc1 $t6, $f6
	cvt.s.w $f6, $f6
	
	li $v0, 4 # modo print string
	la $a0, base # pegunta a base
	syscall

	li $v0, 6 # modo read float
	syscall
	add.s $f1, $f6, $f0 # f1 = float lido
	
	mul.s $f2, $f1, $f1 # f2 = f1^2
	
	li $v0, 4 # modo print string
	la $a0, out 
	syscall # exibe o =texto de saida
	
	li $v0, 2 # modo print integer
	add.s $f12, $f6, $f2 # f12 = $f2
	syscall
	
	j Main
Fim:
	li $v0, 4 # modo print string
	la $a0, adeus 
	syscall # print mensagem de despedida
	
	li $v0, 10
	syscall
	
	
