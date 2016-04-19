COUNT_SCRIPT = wordcount.py 
PLOT_SCRIPT = plotcount.py
TXT_FILES = $(wildcard books/*.txt)
DAT_FILES = $(patsubst books/%.txt, %.dat, $(TXT_FILES))
PLOT_FILES = $(patsubst books/%.txt, %.png, $(TXT_FILES))




#Create zip file
analysis.zip : $(DAT_FILES) $(PLOT_SCRIPT) $(COUNT_SCRIPT) $(PLOT_FILES)
	zip $@ $^
# zip analysis.zip isles.dat abyss.dat last.dat wordcount.py

.PHONY : dats
dats : $(DAT_FILES)

.PHONY : pngs
pngs : $(PLOT_FILES)



.PHONY : variables

variables : 
	@echo TXT_FILES : $(TXT_FILES)
	@echo DAT_FILES : $(DAT_FILES)
	@echo Plot_Files : $(PLOT_FILES)
	

	
#Count words

%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat
	
#plot for each books
# hint: python plotcount.py isles.dat isles.png

%.png : %.dat $(PLOT_SCRIPT)
	python $(PLOT_SCRIPT) $< $*.png
	
	
	

	
.PHONY : clean	
clean :
	rm -f $(DAT_FILES) 
	rm -f analysis.zip
	rm -f $(PLOT_FILES)