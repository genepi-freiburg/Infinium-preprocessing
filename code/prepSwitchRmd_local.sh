#!/bin/bash

tmpfolder=temporary_EPIC_pipeline_code_`date "+%Y%m%d-%H%M%S"`
mkdir $tmpfolder
cp /data/programs/pipelines/CPACOR-EPIC_pipeline/code/*  $tmpfolder/

cd $tmpfolder/

time R-3.5.2 --vanilla << "EOF"
.libPaths()
getwd()

 source("../parameterfile.R")
 library(rmarkdown)
 parameterpath = paste0("../parameterfile.R")
 callpath=getwd()

  if(QuantileNormalize == FALSE){
  	 rmarkdown::render(paste0("prep12.Rmd"),  output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-QC",".pdf"), clean = FALSE, output_dir = callpath , params = list(parameterfile = parameterpath) )
   } else {
	if(InterQuartileRangeCalculation){
  	 rmarkdown::render(paste0("prep1234.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"),clean = FALSE, output_dir = callpath , params = list(parameterfile = parameterpath) )
	} else {
  	 rmarkdown::render(paste0("prep123.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"), clean = FALSE, output_dir = callpath, params = list(parameterfile = parameterpath) )
	}
   } 

EOF

cp *.pdf ..
cp -r *_files ..
cd ..


