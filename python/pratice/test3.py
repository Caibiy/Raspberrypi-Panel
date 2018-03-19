def add_end1(L=[]):
	L.append('END')
	return L

def add_end2(L=None):
	if L is None:
		L=[]
	L.append('END')
	return L
print(add_end1())
print(add_end1())

print("----------------")

print(add_end2())
print(add_end2())
