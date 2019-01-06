SUBDIRS := $(sort $(dir $(wildcard samples/*/*)))
NAME = tikz-imagelabels

.PHONY: all $(SUBDIRS) clean

all: $(SUBDIRS)
	latex $(NAME).ins
	pdflatex --interaction=nonstopmode $(NAME).dtx
	pdflatex --interaction=nonstopmode $(NAME).dtx
	makeindex -s gglo.ist -o $(NAME).gls $(NAME).glo
	pdflatex --interaction=nonstopmode $(NAME).dtx
	pdflatex --interaction=nonstopmode $(NAME).dtx

$(SUBDIRS):  ; $(MAKE) -C $@ $(MAKECMDGOALS)

clean: $(SUBDIRS)
	--@rm -rf *.aux *.glo *.gls *.ilg *.log *.out *.toc
