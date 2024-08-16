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


# install.packages("caret")
# install.packages("factoextra")
# install.packages("matrixStats")
# install.packages("DescTools")
# install.packages("ggplot2")


library(caret)
library(minfi)
library(limma)
library("factoextra")
library(ggplot2)
library(matrixStats)

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

if (arraytype=="IlluminaHumanMethylationEPIC") {

	library(FlowSorted.Blood.EPIC)
	
	

	annotationfile="/data/programs/pipelines/CPACOR-EPIC_pipeline/annotationfileB4_2017-09-15.csv"
	# this is identical to the file 
	# MethylationEPIC_v-1-0_B4.csv
	# which one can download from 
	# https://support.illumina.com/array/array_kits/infinium-methylationepic-beadchip-kit/downloads.html 
	
} else if (arraytype=="IlluminaHumanMethylationEPICv2") {

	library(FlowSorted.Blood.EPIC)
	
	annotationfile="/data/programs/pipelines/CPACOR-EPIC_pipeline/MethylationEPIC_v2.0_Files/EPIC-8v2-0_A1.csv"
	# download from 
	# https://support.illumina.com/array/array_kits/infinium-methylationepic-beadchip-kit/downloads.html
		
} else if (arraytype=="IlluminaHumanMethylation450k") {

# 	annotationfile="/data/programs/pipelines/CPACOR-EPIC_pipeline/annotationfile450k.csv"
	annotationfile="/data/programs/pipelines/CPACOR-EPIC_pipeline/HumanMethylation450_15017482_v1-2.csv"
	# this is identical to the file 
	# HumanMethylation450_15017482_v1-2.csv
	# which can be downloaded from 
	# https://support.illumina.com/array/array_kits/infinium_humanmethylation450_beadchip_kit.html	
	
	library(FlowSorted.Blood.450k)
	
	
} else {
    stop("Unsupported array type: ",arraytype,".\n Supported array types are:\n IlluminaHumanMethylationEPIC versions 1.0 and 2.0 \nand IlluminaHumanMethylation450k.\n Exiting...\n")
}

