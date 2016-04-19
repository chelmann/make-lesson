COUNT_SCRIPT=wordcount.py

analysis.zip : *.dat $(COUNT_SCRIPT)
	zip $@ $^

.PHONY : dats
dats : isles.dat abyss.dat last.dat

# count words

%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat

.PHONY : clean
clean : 
	rm -f *.dat
	rm -f *.zip


