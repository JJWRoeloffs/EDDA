# EDDA assignments

Assignment submissions for the vu course Experimental Design and Data Analisys

To synthesis .rmd to .pdf:

1. Install dependencies, if not installed:

install.packages("rmarkdown")
install.packages("tinytex")
tinytex::install_tinytex()
tinytex:::install_prebuilt()

2. Use library

library(rmarkdown)

3. Set working directory

setwd(/your/path/here)

3. Render the file!

render("assign1_sol.Rmd", output_format = "pdf_document")
