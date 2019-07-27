RMD := 00-welcome/00-welcome.Rmd \
		   01-lit-program/01-lit-program.Rmd \
		   02-naming/02-naming.Rmd \
		   03-git/03-git.Rmd \
		   04-scaling/04-scaling.Rmd \
		   05-make/05-make.Rmd \
		   07-parting-remarks/07-parting-remarks.Rmd

all: docs/README.pdf
	mkdir -p slides/img; \
	for file in $(RMD) ; do \
		cd `dirname $$file`; \
		Rscript -e "rmarkdown::render('`basename $$file`')"; \
		cd ..; \
		Rscript util/webshot.R $$file slides ; \
	done

clean:
	rm -rf slides/
