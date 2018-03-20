from functools import reduce
def fn(x,y):
	return x*10+y
print(reduce(fn,[1,2,3]))

