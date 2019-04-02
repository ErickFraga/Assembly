.data
	
	array: .space 32
	
	aInp: .asciiz "\n\tEntre com A["
	aOut: .asciiz "\n\tA["
	aCoc: .asciiz "] : " 
	aFim: .asciiz "\n\n___FIM____\n\n"
.text	
	la $s1, array # Carrega o endere�o da 1� posi��o do vetor em S1
	li $t1, 0
	Input:	
		bge $t1, 32, Reset # if (cont >= 8) -> Output
			
			li $v0, 4
			la $a0, aInp
			syscall # Exibe aInp 
			
			li $v0, 1			
			srl $t2, $t1, 2 # Indicar posi��o correta do vetor
			add $a0, $t2, 0
			syscall # Exibe a posi��o pedida
			
			li $v0, 4
			la $a0, aCoc
			syscall # Exibe aCoc
			
			li $v0, 5
			syscall # Ler um numero inteiro
			
			add $s2, $s1, $t1 # Soma o valor de cont ao endere�o da primeira posi��o de array 
			sw $v0, ($s2) # registra o valor inputado no array[cont]
			
			add $t1, $t1, 4 # cont += 4
		j Input # repete Input
	
	Reset:
		li $t1, 0 #Limpa o contador
		j Output # chama a proxima parte do codigo
	
	Output:
		bge $t1, 32, Exit # if( cont > 32) -> Exit
			
			li $v0, 4
			la $a0, aOut
			syscall # Exibe aOut
			
			li $v0, 1
			srl $t2, $t1, 2 # Indicar posi��o correta do vetor
			add $a0, $t2, 0
			syscall # Exibe a posi��o pedida
			
			li $v0, 4
			la $a0, aCoc
			syscall # Exibe aCoc
			
			li $v0, 1
			add $s2, $s1, $t1 # Soma o valor de cont ao endere�o da primeira posi��o de array 
			lw $a0, ($s2)
			syscall # Exibe valor contido em array[cont]
			
			add $t1, $t1, 4 # cont += 4
			
			j Output #repete Output
	
	
	
	Exit:
		li $v0, 4
		la $a0, aFim
		syscall #Exibe um mensagem de fim
		
		
		
