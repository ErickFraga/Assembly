# Declara vetor 
# Declarar contadores 
# Primeiro laço 
# Exibir vetor não ordenado
# Segundo laço
# Condição para ordenar
# Boubble sort
# Exibir vetor a cada alteração
.data
	vetor: .word 3, 15, 1, 4, 2 #  vetor[5]
	tam: .word 5 # Tamanho do vetor
	espaco: .asciiz " "
	txtVet_NORD: .asciiz "\nVetor nao Ordenado : "
	txtVet_ORD1: .asciiz "\nVetor na "
	txtVet_ORD2: .asciiz "º Repeticao : "  
.text
	#DECLARAR VETORES
	la $s0, vetor # Carrega o endereço do vetor[0] em S0
	la $s1, tam # Carrega o endreço de tam em S1
	
	lw $t1, 0($s1) # Carrega o valor de tam em T1 
	
	add $a0, $0, $s0 # A0 endereço do vetor 
	add $a1, $0, $t1 # A1 tam
	 	
	jal Ordenar_Vet # Chama função ordenar vetor
	
	li $v0, 10 # Modo exit
	syscall # encerra o programa
	
Ordenar_Vet:
	# Param  : A0 == Vetor[]
	# Param  : A1 == Tamanho do vetor
	# Local  : S0 == &(Vetor[i})	# Endereço
	# Local  : S1 == &(Vetor[j]) 	# Endereço
	# Local  : S2 == &(vetor[j])	# Endereço Iterador
	# Local  : T0 == i		# Iterador
	# Local  : T1 == j		# Iterador
	# Local  : T2 == k   		# Iterador	
	# Local	 : T4 == Vetor[i]
	# Local  : T5 == Vetor[j]
	
	# Beckup uplooad : T0 T1 T2 S0
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	addi $sp, $sp, -4 
	sw $t0, 0($sp)	
	addi $sp, $sp, -4 
	sw $t1, 0($sp) 
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t4, 0($sp)	
	addi $sp, $sp, -4
	sw $t5, 0($sp)
	
	#MOVERPRA BAIXO DEOIIS!!!!!!!!!
	li $t2, 0  # k = 0
	
	#A0
	add $s0, $0, $a0 # S0 recebe endereço do vetor[i]
	add $s1, $0, $a0 # S1 recebe endereço do vetor[j]
	add $s2, $0, $a0
	
	#A1
	mul $a1, $a1, 4 # tam = tam * 4  # para obter o tamanho em espaço de memoria do vetor

	li $t0, 0  # i = 0
	LOOP1:
		add $s0, $a0, $t0 # S0 = *vet[i]
		lw $t4, ($s0) # T4 = vet[i]
		
		li $t1, 0  # j = 0
		LOOP2:
			add $s1, $a0, $t1 # S1 = *vet[i]
			lw $t5, ($s1) # T5 = vet[i]
			
			INICIO_IF1:
				bge $t4, $t5, FIM_IF1 # if(vetor[i] >= vetor[j]) --> FIM_LIF1	
					sw $t5, ($s0)
					sw $t4, ($s1) 
					lw $t4, ($s0) # T4 = vet[i]			
				
			FIM_IF1:
			add $t1, $t1, 4 # T1 += 1   j++
			blt $t1, $a1, LOOP2 # if(j < tam) --> LOOP2
		
		add $t0, $t0, 4 # T0 += 1   i++
		blt $t0, $a1, LOOP1 # if(i < tam) --> LOOP1
		
	# Beckup downlooad : T0 T1 T2 S0
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	lw $s1, 0($sp)
	addi $sp, $sp, 4
	lw $s2, 0($sp) 
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4 
	lw $t1, 0($sp)	
	addi $sp, $sp, 4 
	lw $t2, 0($sp) 
	addi $sp, $sp, 4
	lw $t4, 0($sp) 
	addi $sp, $sp, 4
	lw $t5, 0($sp) 
	addi $sp, $sp, 4
		
	jr $ra # Return
	
