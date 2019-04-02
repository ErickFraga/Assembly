.data
	v: .space 1000
	Title: .asciiz "-----Multiplicar dois Numeros-----\n\n"
	Input1: .asciiz "\tInforme um numero : "
	Output1: .asciiz "\n\tMultplo : "
.text	
	la $s0, v # carrega o endereço de v
	
	li $v0, 4 #modo print string
	la $a0, Title # carrega o endereçoi da string Title
	syscall # printa o titulo do programa
	
	li $v0, 4 # modo print string
	la $a0, Input1 # carrega o endereço da string Input1
	syscall # printa a menssagem pedinod pro usuario informar o numero
	
	li $v0, 5 # Modo read integer
	syscall
	add $t1, $0, $v0 # carrega o primeiro valor lido para T1
	
	li $v0, 4 # modo print string
	la $a0, Input1 # carrega o endereço da string Input1
	syscall # printa a menssagem pedinod pro usuario informar o numero
	
	li $v0, 5 # Modo read integer
	syscall
	add $t2, $0, $v0 # carrega o segundo valor lido para T2
	
	add $t0, $0, $0
	
	Loop1: beq $t0, $t2, Fim_Loop1 # fi(t1 == t2) fim loop
		addi $t0, $t0, 1
		mul $t4, $t1, $t0
		
		sw $t4, ($s0)
		add $s0, $s0, 4 
		
		li $v0, 4
		la $a0, Output1
		syscall
						
		li $v0, 1 # Modo print integer 
		add $a0, $0, $t4  
		syscall
		
		

		j Loop1 
	Fim_Loop1:
		
		