analysis.zip : isles.dat abyss.dat last.dat
	zip analysis.zip isles.dat abyss.dat last.dat

.PHONY : dats
dats : isles.dat abyss.dat last.dat

# count words
isles.dat : books/isles.txt
	python wordcount.py books/isles.txt isles.dat


abyss.dat : books/abyss.txt
	python wordcount.py books/abyss.txt abyss.dat

last.dat : books/last.txt
	python wordcount.py books/last.txt last.dat

.PHONY : clean
clean : 
	rm -f *.dat *.zip


