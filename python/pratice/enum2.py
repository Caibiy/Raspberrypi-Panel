from enum import Enum
class Student(object):
	gender=Enum('Gender',('Male','Female'))
	def __init__(self,name,gender):
		self.__name=name
		self.__gender=gender
Bart = Student('Bart',1)
print(Bart.gender)
