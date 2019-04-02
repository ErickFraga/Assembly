.data
	vetor_A: .word 0,0,0,0,0,0,0,0
	vetor_B: .word 0,0,0,0,0,0,0,0	
	vetor_C: .word 0,0,0,0,0,0,0,0
	
	#pirnts
	
	I_lenVet: .asciiz "\n\t - Informe o tamanho do vetores [0< x <=8]: "
	Erro: .asciiz " --> |||VALOR INVALIDO|||\n\n"
	Vet_a: .asciiz "\n\t - Vetor_A["
	Vet_b: .asciiz "\n\t - Vetor_B["	
	Vet_c: .asciiz "\n\t - Vetor_C["
	Coc: .asciiz "] : "
.text
	li $t1, 0 # Contador do vetor (i = 0)
	
	la $s1, vetor_A # Carrega o endereço de vetor_A[0] em S1
	la $s2, vetor_B # Carrega o endereço de vetor_B[0] em S2
	la $s3, vetor_C # Carrega o endereço de vetor_C[0] em S3
	
	
	j INPUT1 # --> pula para INPUT1, para evitar a msg de erro
	LOOP1: # --> Repete mensagem de erro e Leitura do mamnho do vetor
		
		# Tam_Vetor	: T0
		
		li $v0, 4 # modo print string
		la $a0, Erro # Carrega o endereço da string
		syscall # Exibe Erro
		
		
		INPUT1: # --> Le do usuario o tamanho dos vetores		
			li $v0, 4 # Modo print string
			la $a0, I_lenVet # Carrega o endereço da string
			syscall # Exibe I_legthVet
			
			li $v0, 5 # Modo read inteer
			syscall # Le umm Intero e guarda em V0
			add $t0, $v0, 0 # Guarda o valor inserido em T0
		
			bgt $t0, 8, LOOP1 # if( T0 > 8) -> LOOP1
			ble $t0, 0, LOOP1 # if( T0 <= 0) -> LOOP1
			
			sll $t2, $t0, 2 # Guarda o numero de bytes qeu estão sendo usado nos Vetores
			
			j INPUT2 # Pula para INPUT2, para evitar a msg de erro
	
		
				
	LOOP2: # --> Repete a menssagem de erro e preenche o vetorA na posição atual do iterador
		
		# Tam_Vetor	: T0
		# Iterador      : T1
		# *(vetor_A[i]) : S4
		
		li $v0, 4 # Modo print string
		la $a0, Erro # Carrega o endereço da string
		syscall # Exibe Erro
		
		INPUT2: #--> Repete o preenchimento do vetor na posção atual do iteraro. (Se o valor for valido incrementa o iterador em 4 unidades)
			li $v0, 4 # Modo print string
			la $a0, Vet_a # Carrega o endereço da string
			syscall # Exibe Vet_A
			
			li $v0, 1 # Modo print integer
			srl $a0, $t1, 2 # Numero de i / 4 pra obter a posição no vetor
			syscall # Exibe a posição correta do vetor A[i/4]
			
			li $v0, 4 # Modo print string
			la $a0, Coc # Carrega o endereço da string
			syscall # Exibe Coc
			
			li $v0, 5 # Modo read integer
			syscall # Le um inteiro 
			
			ble $v0, 1, LOOP2 # if(Volar_de_entrada <= 1) -> LOOP2
			bgt $v0, 8, LOOP2 # if(Valor_de_entrada > 8 ) -> LOOP2
			
				add $s4, $s1, $t1 # Calcula o endereço atual do iterador (S4 = endereco_de_A0 + interador) 
				sw $v0, ($s4) # salva o valor digitado em vetor_A[i]
			
				add $t1, $t1, 4 # Incrementa o contador (i += 4)
			
				blt $t1, $t2, INPUT2 # if( i < total_de Bytis) -> INPUT2
					li $t1, 0 # T1 = 0 (i = 0)
					j INPUT3 # Pula para INPUT3, para evitar a msg de erro
			


	LOOP3: # --> Repete a menssagem de erro e preenche o vetorB na posição atual do iterador
		
		# Tam_Vetor	: T0
		# Iterador      : T1
		# *(vetor_B[i]) : S4
		
		li $v0, 4 # Modo print string
		la $a0, Erro # Carrega o endereço da string
		syscall # Exibe Erro
		
		INPUT3: #--> Repete o preenchimento do vetor na posção atual do iteraro. (Se o valor for valido incrementa o iterador em 4 unidades)
			li $v0, 4 # Modo print string
			la $a0, Vet_b # Carrega o endereço da string
			syscall # Exibe Vet_b
			
			li $v0, 1 # Modo print integer
			srl $a0, $t1, 2 # Numero de i / 4 pra obter a posição no vetor
			syscall # Exibe a posição correta do vetor A[i/4]
			
			li $v0, 4 # Modo print string
			la $a0, Coc # Carrega o endereço da string
			syscall # Exibe Coc
			
			li $v0, 5 # Modo read integer
			syscall # Le um inteiro 
			
			ble $v0, 1, LOOP3 # if(Volar_de_entrada <= 1) -> LOOP3
			bgt $v0, 8, LOOP3 # if(Valor_de_entrada > 8 ) -> LOOP3
			
				add $s4, $s2, $t1 # Calcula o endereço atual do iterador (S4 = endereco_de_B0 + iterador) 
				sw $v0, ($s4) # salva o valor digitado em vetor_A[i]
			
				add $t1, $t1, 4 # Incrementa o contador (i += 4)
			
				blt $t1, $t2, INPUT3 # if( i < total_de Bytis) -> INPUT3
					li $t1, 0 # T1 = 0 (i = 0)
					j DATA_PROCESS
					
		
				
	DATA_PROCESS:
		# Tam_Vetor	: T0
		# Iterador      : T1
		# *(vetor_A[0])	: S1		*(vetor_A[i]) : S4		vetor_A[i] : T3
		# *(vetor_B[0]) : S2		*(vetor_B[i]) : S5		vetor_B[i] : T4
		# *(vetor_C[0]) : S3		*(vetor_C[i]) : S6		vetor_C[i] : T5
		
		# Processando A
		add $s4, $s1, $t1 # Calcula o endereço atual do iterador em A
		lw $t3, ($s4) # Carrega para T1 o valor contido em A[i]
		
		# Processando B
		add $s5, $s2, $t1 # Calcula o endereço atual do iterador em B
		lw $t4, ($s5) # Carrega para T2 o valor contido em B[i]
		
		# MEDIA AB
		add $t5, $t4, $t3 # C[i] = A[i] + B[i]
		srl $t5, $t5, 1 # Divide C[i] por 2
		
		# Processando C
		add $s6, $s3, $t1 # Calcula o endereço atual do iterador em c
		sw $t5, ($s6) # Carrega para T3 o valor contido em C[i]
		
		
		add $t1, $t1, 4 # Incrementa o contadro (1 += 4)
		
		blt $t1, $t2, DATA_PROCESS # if( i < total_de Bytis) -> INPUT2
		li $t1, 0 # T1 = 0 (i = 0)
		j OUTPUT1
		
	
	OUTPUT1:
	
		# Tam_Vetor	: T0
		# Iterador      : T1
		# *(vetor_C[0]) : S3		*(vetor_C[i]) : S6		vetor_C[i] : T5
		
		li $v0, 4 # Modo print string
		la $a0, Vet_c # Carrega o endereço da string
		syscall # Exibe Vet_C
		
		li $v0, 1 # Modo print integer
		srl $a0, $t1, 2 # Numero de i / 4 pra obter a posição no vetor
		syscall # Exibe a posição correta do vetor C[i/4]
			
		li $v0, 4 # Modo print string
		la $a0, Coc # Carrega o endereço da string
		syscall # Exibe Coc
			
		li $v0, 1 # Modo print integer
		add $s6, $s3, $t1 # Calcula o endereço atual do iterador em c
		lw $a0, ($s6) # Carrega em A0 o valor de C[i]
		syscall # Le um inteiro 
		
		add $t1, $t1, 4 # Incrementa o contadro (1 += 4)
		
		blt $t1, $t2, OUTPUT1 # if( i < total_de Bytis) -> INPUT2
		li $t1, 0 # T1 = 0 (i = 0) 
