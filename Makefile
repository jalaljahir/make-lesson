COUNT_SCRIPT = wordcount.py 
PLOT_SCRIPT = plotcount.py
TXT_FILES = $(wildcard books/*.txt)
DAT_FILES = $(patsubst books/%.txt, %.dat, $(TXT_FILES))





#Create zip file
analysis.zip : $(DAT_FILES) $(COUNT_SCRIPT)
	zip $@ $^
# zip analysis.zip isles.dat abyss.dat last.dat wordcount.py

.PHONY : dats
dats : $(DAT_FILES)

.PHONY : variables

variables : 
	@echo TXT_FILES : $(TXT_FILES)
	@echo DAT_FILES : $(DAT_FILES)

	
#Count words

%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat
	

	
.PHONY : clean	
clean :
	rm -f $(DAT_FILES) 
	rm -f analysis.zip
	