RMD := 00-welcome/00-welcome.Rmd \
		   01-lit-program/01-lit-program.Rmd \
		   02-naming_and_org/02-naming.Rmd \
		   03-git/03-git.Rmd \
		   04-scaling/04-scaling.Rmd \
		   05-make/05-make.Rmd \
		   07-parting-remarks/07-parting-remarks.Rmd


all: docs/slides docs/README.pdf
	for file in $(RMD) ; do \
		cd `dirname $$file`; \
		echo `pwd`; \
		Rscript -e "rmarkdown::render('`basename $$file`')"; \
		cp *.html ../docs/slides; \
		cd ..; \
		Rscript util/webshot.R $$file docs/slides ; \
	done

docs/slides: 
	mkdir -p docs/slides

docs/index.html: README.md
	mkdir -p docs/slides
	Rscript -e "rmarkdown::render('README.md', 	output_file = 'docs/index.html')"

docs/README.pdf: docs/index.html
	Rscript util/webshot.R docs/index.html docs/README.pdf

clean:
	rm -rf docs/
