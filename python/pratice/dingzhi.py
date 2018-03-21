class Student(object):
	def __init__(self,name):
		self.__name=name
	@property
	def name(self):
		return self.__name
	def __str__(self):
		return 'Student Object (name %s)' % self.__name

s = Student('Break')
s
print(s)
print(Student('break'))
