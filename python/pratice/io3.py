from io import StringIO
f = StringIO("Hello!\nHi!\nYHY!")


for s in f.readlines():
	print(s.strip())
