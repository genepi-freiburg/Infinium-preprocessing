# for using this pipeline, please install all packages listed in the code file "prepPart0.R"

arraytype<-list(idatdir1 = "IlluminaHumanMethylationEPIC", 
                idatdir2 = "IlluminaHumanMethylationEPICv2")
# arraytype<-"IlluminaHumanMethylationEPIC"
# SELECT  between "IlluminaHumanMethylation450k" and "IlluminaHumanMethylationEPIC"
# (see minfi array names)

##################################
# define files and directories ###

# name the documentation (the data file names remain unchanged)
projectname="GCKD_batch1and2and3_test"
# CHANGE: any string; date and time are appended in the code to prevent overwriting

idatdir<-list(idatdir1 = "/data/studies/00_GCKD/00_data/02_methylation/00_raw_data/EPIC_batch1and2/ScanData", 
                idatdir2 = "/data/studies/00_GCKD/00_data/02_methylation/00_raw_data/EPIC_batch3/M01157_Köttgen/idat")

#idatdir="/data/studies/00_GCKD/00_data/02_methylation/00_raw_data/EPIC_batch1and2/ScanData;/data/studies/00_GCKD/00_data/02_methylation/00_raw_data/EPIC_batch3/M01157_Köttgen/idat"
# CHANGE: directory containing all idat files, absolute path, no / at the end

outputdir="/data/studies/00_GCKD/00_data/02_methylation/01_QC/03_DNAm_preprocessing_batches123/tests_ZRH"
# CHANGE: output directory for RData files, absolute path, no / at the end


#########################################
# samplesfile needed for QC (steps 2) ###

samplesfile="Z:/dsk/data1/studies/00_GCKD/00_data/02_methylation/01_QC/03_DNAm_preprocessing_batches123/tests_ZRH/samplesheet_GCKD_batch1and2_testfailplus5.txt"
# CHANGE: sample table; must be absolute path and not relative path


samplesfilefinal=samplesfile
# CHANGE: revised sample table for steps 3+; samplesfilefinal=samplesfile is possible 


# Format: tab-delimited text, columns: Gender (0-males, 1-females), Sample_ID (array/idat name)
# example samplesfile:
#Sample_Name    Sample_Well    Sample_Plate    Sample_Group    Pool_ID    Sentrix_ID    Sentrix_Position    Sample_ID    Gender
#4342    A01    1    RS3_pilot_450K        5723654049    R01C01    5723654049_R01C01    1
#9797    B01    1    RS3_pilot_450K        5723654049    R02C01    5723654049_R02C01    0

############################
# Only needed if there are more batch variables then Sample_Plate and Sample_Well that should be tested for batch effects. 
# provide full path 
BatchVariablesFile=NULL

############################
# threshold parameters ###

detPthreshold=1E-16
callrate.thres=0.95


##############
# switches ###
# CHANGE only between TRUE and FALSE

filterOutlierCtrlQC=TRUE
QuantileNormalize=TRUE
InterQuartileRangeCalculation=TRUE
estimateWBCs=FALSE
extractSNPs=FALSE
additionalBatchVariables=FALSE


##############
# N cores  ###
ncores=10

