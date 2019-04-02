.data
		
.text
	# a : S0		b : S1		c : S2		d : S3
	# e : S4		f : S5		g : S6		h : S7
	
	# Questão a)  a = 0 (apresente duas formas de perfazer esta operação) 
	li $s0, 0 # a = 0
	# add $s0, 0, 0 # a = 0 + 0 
	
	# Questão b) b = 42
	li $s1, 0 # b = 42
	
	# Questão c)  c = d = e = 10
	li $s4, 10 # e = 10
	add $s3, $s4, 0 # d = e
	add $s2, $s3, 0 # c = d
	
	# Questão d)  f = a + b + c + d + e 
	add $s5, $s4, $s3 # f = e + d
	add $s5, $s5, $s2 # f = f + c
	add $s5, $s5, $s1 # f = f + b
	add $s5, $s5, $s1 # f = f + a
	
	# Questão e) g = (a*b)+ (c*d) + (e *f)
	mul $t0, $s0, $s1 # t0 = a * b
	mul $t1, $s2, $s3 # t1 = c * d
	mul $t2, $s4, $s5 # t2 = e * f
	add $s6, $t0, $t1 # c = t0 + t1
	add $s6, $s6, $t2 # c = c + t2
	
	# Questão f) h = (g/b) - (g/c) + (g/d) 	
	div $t0, $s6, $s1 # t0 = g / b
	div $t1, $s6, $s2 # t1 = g / c
	div $t2, $s6, $s3 # t2 = g / d
	add $s7, $t0, $t1 # h = t0 + t1
	add $s7, $s7, $t2 # h = h + t2
	
	
	# Questão g) b++ 
	add $s1, $s1, 1 # b = b + 1
	
	# Questão h) c += 42
	add $s3, $s3, 42 # c = c + 42
	
	# Questão i) d *= 2
	mul $s3, $s3, 2 # d = d * 2
	
	# Questão j) h = ((a*2)+(b*3)-(c*4)+(d*5))2
	mul $t0, $s0, 2 # t0 = a * 2
	mul $t1, $s1, 3 # t1 = b * 3
	mul $t2, $s2, 4 # t2 = c * 4
	mul $t3, $s3, 5 # t3 = d * 5
	
	add $t0, $t0, $t1 # t0 = (a * 2) + ( b * 3)
	add $t1, $t2, $t3 # t1 = (c * 4) + ( d * 5)
	sub $s7 , $t0, $t1 # h = (a * 2) + ( b * 3) - (c * 4) + ( d * 5)
	
	# Questão k)  h = ((a2)+(b2)-(c2))3 == (2(a+b-c))3 == 6(a + b + c)
	add $s7, $s0, $s1 # h = a + b 
	add $s7, $s7 , $s2 # h = h + c
	mul $s7, $s7, 6 # h = h *6
	
	# Questão l) h = (-a + b2) / 2 * a * d
	mul $t0, $s0, -1 # T0 = a * -1
	mul $t1, $s1, 2 # T1 = b * 2
	add $s7, $t0, $t1 # T0 = (a*-1 + b*2)
	
	mul $t1, $s0, $s3, # T1 = a * d
	mul $t1, $t1, 2 # T1 = 2 * a * b
	
	div $s7, $s7, $t1  # h = (a*-1 + b*2) / 2 * a * b
	
	# Questão m)  g = 1/a + 1/b + 1/c + 1/d == 1 / ( a + b + c + d)
	add $s6, $s0, $s1 # g = a + b
	add $s6, $s6, $s2 # g = g + c
	add $s6, $s6, $s3 # g = d + d
	
	div $s6, 1, $s6 # g = 1 / (a + b + c + d)
	
	# Questão n) g = a6 + b-6
	add $s6, $s1, -6 # g = b - 6
	mult $t1, $s0, 6 # T1 = a * 6
	add $s6, $s1, $t1 # g = (a * 6) + b - 6	
	
	# Questão o) 	f == a + a + (a + b) + (2*a + b) + (3 * a + 2 * b) + (4 * a + 3 * b) 
	#		f == a + a + a + b + 2*a + b + 3*a + 2*b + 4*a + 3*b
	# 		f == 12*a + 6*b	

	mult $t0, $s0, 12 # T0 = a * 12
	mult $t1, $s1, 6 # T! = b * 6
	
	add $s5, $t1, $t1 # f = 12*a + 6*b 
	
	# Questão p)
	
	
	# Questão q)