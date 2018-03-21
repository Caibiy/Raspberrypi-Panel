class Person(object):
	def __init__(self,name,age):
		self.name=name
		self.age=age
	def printAll(self):
		print('%s %s '%(self.name,self.age))


Break = Person("Break",23)
Break.printAll()


