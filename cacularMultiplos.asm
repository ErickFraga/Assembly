.data
	v: .space 1000
.text
	la $s0, v	#S0 RECEBE ENDEREÇO DE V
	
	#Ler M
	addi $v0, $0, 5
	syscall 
	add $t0, $0, $v0	#t0 = M
	
	#Ler N
	addi, $v0, $0, 5
	syscall
	add $t1, $0, $v0	#t1 = N