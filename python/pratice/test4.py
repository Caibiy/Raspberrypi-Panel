def calc(numbers):
	sum=0
	for i in numbers:
		sum=sum+i
	return sum
print(calc((1,2,3)))

def calc2(*numbers ):
	sum=0
	for i in numbers:
		sum=sum+i
	return sum
print(calc2(1,2,3))

num=[1,2,3]
print(calc2(*num))

def calc3(name,age,**numbers):
	print('name:',name,' age:',age,numbers)

calc3("Break",23,city="Suzhou")

calc3("YHY",23,**{"city":"Shanghai","From":"ZheJiang"})

def person(name,age,*,city,job):
	print(name,age,city,job)

person("Break",23,city="Suzhou",job="Java Engineer")

def product(*num):
	sum=1
	for i in num:
		sum=sum*i
	return sum	
print(product(5,6,7))
