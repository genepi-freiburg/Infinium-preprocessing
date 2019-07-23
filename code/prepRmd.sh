#!/bin/bash

time R-3.5.3 --vanilla << "EOF"
.libPaths()
# .libPaths(.libPaths()[c(2,1,3,4)]) ### grundner-3.4-Pfad an erste Stelle setzen
getwd()

# source("parameterfile.R")
# library(rmarkdown)
#  if(QuantileNormalize = FALSE){
#  	 rmarkdown::render("prep12.Rmd",  output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-projectname-QC",".pdf"))
#   } else {
#  	 rmarkdown::render("prep123.Rmd", output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-projectname",".pdf"))
#   } 


EOF

echo datei ausgeführt
