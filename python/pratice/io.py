try:
	f=open('./temp.txt','r')
	print(f.read())
finally:
	if f:
		f.close()
