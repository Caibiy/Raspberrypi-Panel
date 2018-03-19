def power(x,n=2):
	s=1
	for i in list(range(0,n)):
		s=s*x
	return s
print(power(2))
