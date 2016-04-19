COUNT_SCRIPT=wordcount.py
PLOT_SCRIPT=plotcount.py
TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES=$(patsubst %.dat, %.png, $(DAT_FILES))

analysis.zip : $(DAT_FILES) $(PNG_FILE) $(COUNT_SCRIPT) $(PLOT_SCRIPT)
	zip $@ $^

.PHONY : dats
dats : $(DAT_FILES)

.PHONY : pngs
pngs : $(PNG_FILES)

.PHONY : variables
variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

# count words

%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat


%.png : %.dat $(PLOT_SCRIPT)
	python $(PLOT_SCRIPT) $< $*.png

.PHONY : clean
clean : 
	rm -f $(DAT_FILES)
	rm -f $(PNG_FILES)
	rm -f analysis.zip
