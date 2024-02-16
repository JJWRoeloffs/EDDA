#!/usr/bin/env bash

# Install rmarkdown dependency
R --no-restore -e 'if (!"rmarkdown" %in% installed.packages()[,"Package"]) {
    install.packages("rmarkdown", repos = "http://cran.us.r-project.org");
}' >/dev/null
# Install tinytex dependency, and do so seperately because of the aditional steps
R --no-restore -e 'if (!"tinytex" %in% installed.packages()[,"Package"]) {
    install.packages("tinytex", repos = "http://cran.us.r-project.org");
    tinytex::install_tinytex();
    tinytex:::install_prebuilt();
}' >/dev/null

# wildcard expansions are guaranteed to be sorted alphabetically.
# This means "header" coming before "part" is relevant
sed -e '$s/$/\n/' -s $1/*.Rmd >$1/$1.Rmd
# chdir to let the data live in only one place
#     (rstudio cd's to the .Rmd file's parent, and R -e uses current directory)
env --chdir=$1 R --no-restore -e "rmarkdown::render('$1.Rmd', output_format = 'pdf_document')"
rm $1/$1.Rmd
