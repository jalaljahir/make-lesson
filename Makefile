analysis.zip : *.dat wordcount.py
	zip $@ $^
# zip analysis.zip isles.dat abyss.dat last.dat wordcount.py

.PHONY : dats
dats : isles.dat abyss.dat last.dat


#Count words
isles.dat : books/isles.txt wordcount.py
	python wordcount.py $< $@
    
abyss.dat : books/abyss.txt wordcount.py
	python wordcount.py $< $@

last.dat : books/last.txt wordcount.py
	python wordcount.py $< $@

#Create zip file



	
.PHONY : clean	
clean :
	rm -f *dat 
	rm -f *.zip
	