# PART 0 (Settings)

# install packages
# source("http://bioconductor.org/biocLite.R")
# biocLite("minfi")
# biocLite("limma")
# biocLite("IlluminaHumanMethylationEPICmanifest") # for EPIC array
# biocLite("IlluminaHumanMethylation450kmanifest") # for 450k array and Houseman
# biocLite("FlowSorted.Blood.450k") 
# biocLite("IlluminaHumanMethylation450kanno.ilmn12.hg19")

require(minfi)
require(limma)
require("factoextra")
require(caret)

require(matrixStats)
require(DescTools)
library(ggplot2)

if (arraytype=="IlluminaHumanMethylationEPIC") {
	annotationfile="/data/programs/pipelines/CPACOR-EPIC_pipeline/annotationfileB4_2017-09-15.csv"
	# this is identical to the file 
	# MethylationEPIC_v-1-0_B4.csv
	# which one can download from 
	# https://support.illumina.com/array/array_kits/infinium-methylationepic-beadchip-kit/downloads.html 
} else if  (arraytype=="IlluminaHumanMethylation450k") {
	annotationfile="/data/programs/pipelines/CPACOR-EPIC_pipeline/annotationfile450k.csv"
	# this is identical to the file 
	# HumanMethylation450_15017482_v1-2.csv
	# which can be downloaded from 
	# https://support.illumina.com/array/array_kits/infinium_humanmethylation450_beadchip_kit.html	
} else {
    stop("Unsupported array type: ",arraytype,". Exiting...\n")
}
