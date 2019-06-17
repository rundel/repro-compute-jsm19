RMD := 00-welcome/00-welcome.Rmd \
		   01-lit-program/01-lit-program.Rmd \
		   02-naming/02-naming.Rmd \
		   03-organization/03-organization.Rmd \
		   04-git/04-git.Rmd \
		   05-scaling/05-scaling.Rmd \
		   06-make/06-make.Rmd \
		   09-parting-remarks/09-parting-remarks.Rmd

HTML := $(patsubst %.Rmd, %.html, $(RMD))

all: $(HTML)

00-welcome/00-welcome.html: 00-welcome/00-welcome.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

01-lit-program/01-lit-program.html: 01-lit-program/01-lit-program.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

02-naming/02-naming.html: 02-naming/02-naming.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

03-organization/03-organization.html: 03-organization/03-organization.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

04-git/04-git.html: 04-git/04-git.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

05-scaling/05-scaling.html: 05-scaling/05-scaling.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

06-make/06-make.html: 06-make/06-make.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

09-parting-remarks/09-parting-remarks.html: 09-parting-remarks/09-parting-remarks.Rmd
	cd $(<D); Rscript -e "rmarkdown::render('$(<F)')"

clean:
	rm -f $(HTML)
