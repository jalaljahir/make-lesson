COUNT_SCRIPT = wordcount.py 


#Create zip file
analysis.zip : *.dat $(COUNT_SCRIPT)
	zip $@ $^
# zip analysis.zip isles.dat abyss.dat last.dat wordcount.py

.PHONY : dats
dats : isles.dat abyss.dat last.dat


#Count words

%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat
	
	





	
.PHONY : clean	
clean :
	rm -f *dat 
	rm -f *.zip
	