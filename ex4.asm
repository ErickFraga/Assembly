.data
	vetor_A: .word 0,0,0,0,0,0,0,0
	
	#prints
	I_vetA: .asciiz "\n\t - Informe Vetor_A["
	O_vetA: .asciiz "\n\t -  Media Vetor_A : "
	cocA: .asciiz "] : "
.text

	la $s0, vetor_A # carrega endereço do vetor_A
	li $t0, 0 # Inicializando contador:  (i = 0)
	li $t2, 0 # Limpando variavel pra armazenar  a soma para a media
	VET_INPUTS:
		bge $t0, 32, RESET # Mondição: if(i >= 32) - > RESET
		
			li $v0, 4 # Modo prit string
			la $a0, I_vetA # Carregar endereço da string
			syscall # Exibir I_vetA
			
			li $v0, 1 # Modo print integer
			srl $t1, $t0, 2 # Dividir o contador por 4 para chegar a posição do vetor a ser prenchida
			add $a0, $t1, 0 # Carrega o numero a ser exibido
			syscall # Exibe o numero
			
			li $v0, 4 # Modo print string
			la $a0, cocA # Carrega endereço da string
			syscall # Exibe  a string 
			
			li $v0, 5 # Modo read intger
			syscall # Le um inteiroe armazena em V0
			add $s1, $s0, $t0 # S1 = primeiro endereço + i
			sw $v0, ($s1) # registra o valor inserido em vetor_A[i]			
			
		add $t0, $t0, 4 # Iterador: (i+=4)
		j VET_INPUTS # Reinica o loop
	
	
	RESET: 
		li $t0, 0 # Reinicia o contador pra proximos loops
		j MEDIA
		
				
	MEDIA:
		bge $t0, 32, VET_OUTPUTS # if(ST >= 32) -> VET_OUTPUTS
			
			add $s1, $s0, $t0 # S1 = primeiro endereço + i
			lw $t3, ($s1) # carega o conteudo de vetor_A[i] 
			add $t2, $t2, $t3 # armazena a soma dos valores do vetor
			
		add $t0, $t0, 4 # T0 += 4
		j MEDIA
		
		
	VET_OUTPUTS:
		srl $t2, $t2, 3 # dividir por 8 (n | 2^n == 8 <-> n == 3)
		
		li $v0, 4 #modo print string
		la $a0, O_vetA # carrega o edereço de O_vetA
		syscall #exibi O_vetA
		
		li $v0, 1 # modo print integer
		add $a0, $t2, 0 # coloca o numero qeu sera exibido em A0
		syscall # exibe o inteiro
		
		
	
	
	
