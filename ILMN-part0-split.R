# PART 0 (Settings)

# install packages
# source("http://bioconductor.org/biocLite.R")
# biocLite("minfi")
# biocLite("limma")
# biocLite("IlluminaHumanMethylationEPICmanifest") # for EPIC array
# biocLite("IlluminaHumanMethylation450kmanifest") # for 450k array and Houseman

require(minfi)
require(limma)

require(matrixStats)
require(DescTools)

if (arraytype=="IlluminaHumanMethylationEPIC") {
	annotationfile="../annotationfileB4_2017-09-15.csv"
} else if  (arraytype=="IlluminaHumanMethylation450k") {
	# annotationfile="../annotationfileB4_2017-09-15.csv"
	# CHANGE: ILMN array annotation file
	# stop("Please provide an annotation file for : ",arraytype,". Exiting...\n")
	stop(paste(arraytype, "is still in setup phase. Exiting...\n"))
} else {
    stop("Unsupported array type: ",arraytype,". Exiting...\n")
}

