# for using this pipeline, please install all packages listed in the code file "prepPart0.R"

arraytype<-"IlluminaHumanMethylationEPIC"
# SELECT  between "IlluminaHumanMethylation450k" and "IlluminaHumanMethylationEPIC"
# (see minfi array names)

##################################
# define files and directories ###

# name the documentation (the data file names remain unchanged)
projectname="CHANGE"
# CHANGE: any string; date and time are appended in the code to prevent overwriting

idatdir="idats"
# CHANGE: directory containing all idat files, absolute path, no / at the end

outputdir="output"
# CHANGE: output directory for RData files, absolute path, no / at the end


#########################################
# samplesfile needed for QC (steps 2) ###


samplesfile="samplesfile_example"
# CHANGE: sample table; must be absolute path and not relative path

samplesfilefinal="samplesfile_example_postQC"
# CHANGE: revised sample table for steps 3+; samplesfilefinal=samplesfile is possible 


# Format: tab-delimited text, columns: Gender (0-males, 1-females), Sample_ID (array/idat name)
# example samplesfile:
#Sample_Name    Sample_Well    Sample_Plate    Sample_Group    Pool_ID    Sentrix_ID    Sentrix_Position    Sample_ID    Gender
#4342    A01    1    RS3_pilot_450K        5723654049    R01C01    5723654049_R01C01    1
#9797    B01    1    RS3_pilot_450K        5723654049    R02C01    5723654049_R02C01    0

############################
# threshold parameters ###

detPthreshold=1E-16
callrate.thres=0.95


##############
# switches ###
# CHANGE only between TRUE and FALSE

filterOutlierCtrlQC= TRUE
QuantileNormalize=FALSE
InterQuartileRangeCalculation=FALSE
estimateWBCs=FALSE
