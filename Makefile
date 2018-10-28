infile=poster.tex
makedir=output

all: poster.pdf

%.pdf: %.tex
	mkdir -p $(makedir)
	tectonic -o $(makedir) --keep-intermediates -r0 $<
	if [ -f $(makedir)/$(notdir $(<:.tex=.bcf)) ]; then biber --input-directory $(makedir) $(notdir $(<:.tex=)); fi
	tectonic -o $(makedir) --keep-intermediates $<
	cp $(makedir)/$(notdir $@) .

clean:
	rm -rf ${makedir}/*
	rm ${infile:.tex=.pdf}
