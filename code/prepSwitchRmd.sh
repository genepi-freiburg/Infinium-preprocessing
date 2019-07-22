#!/bin/bash


time R-3.5.2 --vanilla << "EOF"
.libPaths()
getwd()

 source("parameterfile.R")
 library(rmarkdown)
 codepath="/data/programs/pipelines/CPACOR-EPIC_pipeline/code/"
 parameterpath = paste0(getwd(),"/parameterfile.R")
 callpath=getwd()

  if(QuantileNormalize == FALSE){
  	 rmarkdown::render(paste0(codepath,"prep12.Rmd"),  output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-QC",".pdf"), clean = FALSE, output_dir = callpath , params = list(parameterfile = parameterpath) )
   } else {
	if(InterQuartileRangeCalculation){
  	 rmarkdown::render(paste0(codepath,"prep1234.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"),clean = FALSE, output_dir = callpath , params = list(parameterfile = parameterpath) )
	} else {
  	 rmarkdown::render(paste0(codepath,"prep123.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"), clean = FALSE, output_dir = callpath, params = list(parameterfile = parameterpath) )
	}
   } 


EOF


