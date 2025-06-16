#!/bin/bash

tmpfolder=temporary_EPIC_pipeline_code_`date "+%Y%m%d-%H%M%S"`
mkdir $tmpfolder
cp /data/programs/pipelines/CPACOR-EPIC_pipeline/code/*  $tmpfolder/

cd $tmpfolder/

 time /opt/bin/R-4.4 --vanilla << "EOF"
.libPaths()
getwd()

 source("../parameterfile.R")
 library(rmarkdown)
 parameterpath = paste0("../parameterfile.R")
 callpath=getwd()

start.Time = Sys.time()
formatted.time = format(Sys.time(), "%Y-%m-%d-%Hh%Mm")
source("Part0.R")


rmarkdown::render(paste0("prepPart1.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-prepPart1.pdf"), clean = FALSE, output_dir = callpath, params = list(parameterfile = parameterpath))
file.remove("marker_call_zoom.pdf", "sample_call_zoom.pdf", "sample_call.pdf", "beta_densities_plot.pdf", "dpvec_histogram.pdf")

  if(QuantileNormalize == FALSE){
  	 rmarkdown::render(paste0("prep12.Rmd"),  output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-QC",".pdf"), clean = FALSE, output_dir = callpath , params = list(parameterfile = parameterpath) )
   } else {
	if(InterQuartileRangeCalculation){
	rmarkdown::render(paste0("prepPart2.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-prepPart2.pdf"), clean = FALSE, output_dir = callpath, params = list(parameterfile = parameterpath))
	rmarkdown::render(paste0("prepPart3.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-prepPart3.pdf"), clean = FALSE, output_dir = callpath, params = list(parameterfile = parameterpath))
  	rmarkdown::render(paste0("prep1234.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"),clean = FALSE, output_dir = callpath , params = list(parameterfile = parameterpath) )
	} else {
	rmarkdown::render(paste0("prepPart2.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,"-prepPart2.pdf"), clean = FALSE, output_dir = callpath, params = list(parameterfile = parameterpath))
  	rmarkdown::render(paste0("prep123.Rmd"), output_file = paste0(format(Sys.time(),format = "%Y-%m-%d-%Hh%Mm"),"-",projectname,".pdf"), clean = FALSE, output_dir = callpath, params = list(parameterfile = parameterpath) )
	}
   } 
   file.remove("BS_I_C_U_red.pdf", "BS_I_C_U_green.pdf", "BS_II_red_vs_green.pdf", "Hybridization_green.pdf", "Specificity_I_red.pdf", "Specificity_I_green.pdf", "Specificity_II.pdf", "Extensions.pdf", "Staining_red_Upper_left_cluster.pdf", "Staining_green_Upper_left_cluster.pdf", "Staining_red_vs_green.pdf", "cross_check_with_Extension_outliers.pdf", "beta_auto_samples_filtered.pdf" )


if (file.exists("find_female_outlier.pdf")) {
   file.remove("find_female_outlier.pdf")
}
if (file.exists("find_male_outlier.pdf")) {
   file.remove("find_male_outlier.pdf")
}
if (file.exists("find_female_outlier_2.pdf")) {
   file.remove("find_female_outlier_2.pdf")
}
if (file.exists("find_male_outlier_2.pdf")) {
   file.remove("find_male_outlier_2.pdf")
}
if (file.exists("PCA_find_female_outlier.pdf")) {
  file.remove("PCA_find_female_outlier.pdf")
}
if (file.exists("PCA_find_male_outlier.pdf")) {
   file.remove("PCA_find_male_outlier.pdf")
}
if (file.exists("PCA_find_female_outlier_2.pdf")) {
   file.remove("PCA_find_female_outlier_2.pdf")
}
if (file.exists("PCA_find_male_outlier_2.pdf")) {
     file.remove("PCA_find_male_outlier_2.pdf")
}

if (file.exists("Staining_Red_cross_check_with_Extension_outliers.pdf")) {
     file.remove("Staining_Red_cross_check_with_Extension_outliers.pdf")
}

EOF

cp *.pdf ..
cp -r *_files ..
cd ..


