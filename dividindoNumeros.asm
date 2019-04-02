.data 
	msgNum: .asciiz "\n Infome um numero : "
.text
	
	li $v0, 4 # modo print integer
	la $a0, msgNum
	syscall
	
	li $v0, 5 # modo read integer
	syscall
	add $t0, $0, $v0 # salvar valar digigtado

	li $v0, 4 # modo print integer
	la $a0, msgNum
	syscall
			
	li $v0, 5 # modo read integer
	syscall
	add $t1, $0, $v0
	
	mtc1 $t0, $f1 # move o T0 para float
	mtc1 $t1, $f2 # move o T1 para float
	
	cvt.s.w $f1, $f1 # converter F1 para float
	cvt.s.w $f2, $f2 # converter F2 para float
	
	div.s $f12, $f1, $f2 # F3 = F1 / F2
	
	li $v0, 2 # modo pront float
	syscall