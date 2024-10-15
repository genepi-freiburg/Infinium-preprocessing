# PART 0 (Settings)

# install packages
#  if (!requireNamespace("BiocManager", quietly = TRUE))
#      install.packages("BiocManager")
# 
#  BiocManager::install("minfi")
#  BiocManager::install("limma")
#  BiocManager::install("IlluminaHumanMethylationEPICmanifest") # for EPIC array
#  # .libPaths( c( "~/userLibrary" , .libPaths() ) )

#  BiocManager::install("IlluminaHumanMethylation450kmanifestv2anno.20a1.hg38") # for 450k array and Houseman
# package ‘IlluminaHumanMethylation450kmanifestv2anno.20a1.hg38’ is not available for Bioconductor version '3.18' -- WBC estimation fails



#  BiocManager::install("FlowSorted.Blood.450k")
#  BiocManager::install("FlowSorted.Blood.EPIC")
#  BiocManager::install("IlluminaHumanMethylation450kanno.ilmn12.hg19")
#  BiocManager::install("IlluminaHumanMethylationEPICanno.ilm10b4.hg19")
#  BiocManager::install("IlluminaHumanMethylationEPICv2anno.20a1.hg38")
#  # BiocManager::install("jokergoo/IlluminaHumanMethylationEPICv2manifest") # outdated? 
#  BiocManager::install("IlluminaHumanMethylationEPICv2manifest")



# install.packages("caret")
# install.packages("factoextra")
# install.packages("matrixStats")
# install.packages("DescTools")
# install.packages("ggplot2")
# BiocManager::install("sesame")



library(caret)
library(minfi)
library(limma)
library("factoextra")
library(ggplot2)
library(matrixStats)
library(sesame)
library(dplyr)
library(parallel)

##################################### 
## DescTools package waiting for C++ update on cluster
# this is the only function we need

# library(DescTools)

Winsorize <- function (x, minval = NULL, maxval = NULL, probs = c(0.05, 0.95), 
                       na.rm = FALSE, type = 7) 
{
  if (is.null(minval) || is.null(maxval)) {
    xq <- quantile(x = x, probs = probs, na.rm = na.rm, type = type)
    if (is.null(minval)) 
      minval <- xq[1L]
    if (is.null(maxval)) 
      maxval <- xq[2L]
  }
  x[x < minval] <- minval
  x[x > maxval] <- maxval
  return(x)
}
#####################################


# get arraytype variables in case of multiple arraytypes 

values <- unique(unlist(arraytype))

if (length(values) > 1) {
  if ("IlluminaHumanMethylationEPIC" %in% values &&
      "IlluminaHumanMethylationEPICv2" %in% values) {
    annotationfile <- "/dsk/data1/programs/pipelines/CPACOR-EPIC_pipeline/annotation_files/Methylation_EPICv1_EPICv2/merged_annotationfile_EPICv1v2_for_CPACOR_20240908.csv"
    library(FlowSorted.Blood.EPIC)
  }
} else {
  if (values == "IlluminaHumanMethylationEPIC") {
    annotationfile <- "/dsk/data1/programs/pipelines/CPACOR-EPIC_pipeline/annotation_files/Methylation_EPICv1/annotationfileB4_2017-09-15.csv"
    library(FlowSorted.Blood.EPIC)
    
  } else if (values == "IlluminaHumanMethylationEPICv2") {
    annotationfile <- "/dsk/data1/programs/pipelines/CPACOR-EPIC_pipeline/annotation_files/MethylationEPIC_v2.0_Files/EPIC-8v2-0_A1.csv"
    library(FlowSorted.Blood.EPIC)
    
  } else if (values=="IlluminaHumanMethylation450k") {
    annotationfile="/dsk/data1/programs/pipelines/CPACOR-EPIC_pipeline/annotation_files/HumanMethylation450_15017482_v1-2.csv"
    library(FlowSorted.Blood.450k)
  } else {
    stop("Unsupported array type: ",arraytype,".\n Supported array types are:\n IlluminaHumanMethylationEPIC versions 1.0 and 2.0 \nand IlluminaHumanMethylation450k.\n Exiting...\n")
  }
}


