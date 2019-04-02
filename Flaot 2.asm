.data
	pi: .float 3.14
.text

Loop1:
	la $s0, pi
	lwc1 $f4, ($s0) # Carrega o valor de pi
	
	mtc1 $0, $f3 # carrega o valor zero para F3
	
	li $v0, 6
	syscall # Le um numero float
	add.s $f1, $f3, $f0 # guarda o Float em F1
	
	mul.s $f5, $f1, $f1 # r^2
	
	mul.s $f6, $f5, $f4 # r^2 * pi
	
	li $v0, 2
	add.s $f12, $f3, $f6
	syscall	
	