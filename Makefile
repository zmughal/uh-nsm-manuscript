THESIS_CHAPTERS := ch1_Introduction.tex ch2_Background.tex ch3_Methods.tex ch4_Algorithms.tex ch5_Results.tex ch6_Conclusion.tex
THESIS_META := meta/title.tex meta/committee.tex
THESIS_DEP := abstract.tex acknowledgements.tex $(THESIS_META) $(THESIS_CHAPTERS)

all: thesis.pdf

thesis.pdf: thesis.tex $(THESIS_DEP)

%.pdf: %.tex
	latexmk -pdf -silent -diagnostics $<

%.tex: %.md
	pandoc -t latex $< -o $@

clean:
	find . -regex '.*\.\(out\|log\|aux\|toc\|bbl\|blg\|nav\|snm\|vrb\|tpt\|lof\|lot\|fdb_latexmk\|fls\)$$' -delete -printf "removed '%p'\n"
cleanall: clean
	-rm -vf *.pdf *.dvi

.PHONY: clean cleanall
