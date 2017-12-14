#!/bin/bash

cp parameterfile.R /data/epigenetics/02_EPIC_pipeline/CPACOR-EPIC_pipeline/temporary/parameterfile.R

time R-3.4.1 --vanilla << "EOF"
.libPaths()
getwd()

 source("parameterfile.R")
 library(rmarkdown)
 codepath="/data/epigenetics/02_EPIC_pipeline/CPACOR-EPIC_pipeline/code/"

  if(QuantileNormalize == FALSE){
  	 rmarkdown::render(paste0(codepath,"prep12.Rmd"),  output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-QC",".pdf"), clean = FALSE, output_dir = getwd() )
   } else {
	if(InterQuartileRangeCalculation){
  	 rmarkdown::render(paste0(codepath,"prep1234.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"),clean = FALSE, output_dir = getwd() )
	} else {
  	 rmarkdown::render(paste0(codepath,"prep123.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"), clean = FALSE, output_dir = getwd())
	}
   } 


EOF


