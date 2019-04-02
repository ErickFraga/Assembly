.data 
	result: .space 4
	Title: .asciiz "-----Multiplicar dois Numeros-----\n\n"
	Input1: .asciiz "\tInforme um numero : "
	Output1: .asciiz "\n\tMultplo : "
.text
	la $s0, result 
	
	li $v0, 4 #modo print string
	la $a0, Title # carrega o endereçoi da string Title
	syscall # printa o titulo do programa
	
	li $v0, 4 # modo print string
	la $a0, Input1 # carrega o endereço da string Input1
	syscall # printa a menssagem pedinod pro usuario informar o numero
	
	li $v0, 5 # modo read integer
	syscall
	add $t2, $0, $v0
	
	li $v0, 4 # modo print string
	la $a0, Input1 # carrega o endereço da string Input1
	syscall # printa a menssagem pedinod pro usuario informar o numero
	
	li $v0, 5 # modo read integer
	syscall
	add $t1, $0, $v0
	
	
	bge $t1, $t2, next_Step
		add $t3, $0, $t1
		add $t1, $0, $t2
		add $t2, $0, $t3
	
	next_Step:
	
		add $t3, $0, $t1
		li $t0, 1
		Loop1: beq $t0, $t2, Fim_loop1 
			addi $t0, $t0, 1
			
			add $t1, $t1, $t3
			j Loop1
		Fim_loop1:
			sw $t1, 0($s0)