---
title: "EPIC Pipeline"
date: "11 May, 2018"
params:
  parameterfile: ""
output:
  pdf_document:
    toc: true
    toc_depth: 2
---


This is a pipeline for preprocessing EPIC-Methylation data using R. 


## PART 1: Data and parameters


```
## Warning: package 'FlowSorted.Blood.450k' was built under R version 3.4.2
```

```
## Warning: package 'IlluminaHumanMethylation450kanno.ilmn12.hg19' was built
## under R version 3.4.2
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.

## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

### Read data and parameters

We are working with data from directory /data/studies/00_GCKD/00_data/02_methylation/00_raw_data/EPIC_batch1/ScanData which contains $580$ idat files.
The annotationfile used is 
../annotationfileB4_2017-09-15.csv 
 - if problems occur with annotation, please have a look at [Illumina downloads](https://support.illumina.com/array/downloads.html)    *Infimum Methylation EPIC Product files*. 


Output is directed to /data/studies/00_GCKD/00_data/02_methylation/02_clean_data/EPIC_batch1. We use samples listed in /data/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/01_input/samplesfile_GCKD_EPICs.txt for quality control. 

As given in *parameterfile.R*, the following parameters were used: 

parameter                     | value
------------------------------|-------------------------------------
arraytype                     | IlluminaHumanMethylationEPIC
detPthreshold                 | $10^{-16}$
callrate.thres                | $0.95$
filterOutlierCtrlQC           | TRUE
QuantileNormalize             | FALSE
InterQuartileRangeCalculation | FALSE

Further we interpret the values for the gender in the samplesfile as **1=female** and **0=male**. 



When reading the data using the minfi-package we apply Illumina Background correction.
Whithin this process we also 
* extract control-probe information. 
* calculate detection p-values.
* estimate the white blood cell distribution assuming whole blood samples using minfi.
* separate the data by channel (red / green) and Infinium I / II type.
We use this detection p-values and control probe information for high-level quality control and the white blood cell estimations for further processing as phenodata.

### White Blood Cell estimation

The estimation of White Blood Cells results in a data.frame est.wbc.minfi for further use as part of the phenodata:


```
##                           CD8T       CD4T         NK      Bcell       Mono
## 202073180001_R04C01 0.00000000 0.09840692 0.06115654 0.02190734 0.07584636
## 202073210056_R02C01 0.05481449 0.29085979 0.07174163 0.05103847 0.05802004
## 202073180001_R04C01 0.00000000 0.09840692 0.06115654 0.02190734 0.07584636
## 202073210056_R02C01 0.05481449 0.29085979 0.07174163 0.05103847 0.05802004
##                          Gran
## 202073180001_R04C01 0.7514133
## 202073210056_R02C01 0.4874777
## 202073180001_R04C01 0.7514133
## 202073210056_R02C01 0.4874777
```

### Data preparation

The probes are divided by chromosome type: autosomal probes, chromosome X probes and chromosome Y probes.
For this step we need the annotationfile.



### High-level quality control


High level quality control includes detection p-value filter, restriction the the samples listed in the samplesfile and call rate filtering.

We calculate raw beta values for both autosomal and sex chromosome data.
In our further calculations beta value data always is processed separately for autosomes and gametes. 

* Detection p-values are illustrated in the following plots. Low p-values indicate that the signal is unlikely to be background noise. 

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-12h14m-GCKD-QC_files/figure-latex/unnamed-chunk-11-1.pdf)<!-- --> 



![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-12h14m-GCKD-QC_files/figure-latex/unnamed-chunk-12-1.pdf)<!-- --> 
\pagebreak


The following table summarizes how many detection p-values are smaller than the threshold $10^{-16}$ given in the *parameterfile*, or 0.01: 

 threshold           | count                                       | percentage
---------------------|---------------------------------------------|-----------------------------------------------------
$10^{-16}$ | $6907558$    | $0.9969446$
0.01                 | $6921923$             | $0.9990179$




$21170$   ($0.003$ \%)   measurements are excluded because their detection p-value is bigger than $10^{-16}$. Only values with a detection p-value strictly smaller the threshold are kept.
To skip this filtering, set the parameter *detPthreshold* to a value **strictly** bigger than 1 in the *parameterfile.R*.




beta values:   | autosomes           |  sex chromosomes 
---------------|---------------------|----------------------------
dimension:     | $846232, 8$ | $19627, 8$






![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-12h14m-GCKD-QC_files/figure-latex/unnamed-chunk-16-1.pdf)<!-- --> 


```
## character(0)
```

* Identified by the samplefile, $8$ samples are included in the analysis.

* There is call-rate filtering with threshold $0.95$.


  

* $0$ samples were tagged for exclusion because the call-rate was below the threshold $0.95$.


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-12h14m-GCKD-QC_files/figure-latex/unnamed-chunk-19-1.pdf)<!-- --> 

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-12h14m-GCKD-QC_files/figure-latex/unnamed-chunk-20-1.pdf)<!-- --> 
  

$0$ of all sample call rates are lower than 0.98,  
 and $0$ are lower than the threshold $0.95$.


We have a look at the marker call rates as well:


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-12h14m-GCKD-QC_files/figure-latex/unnamed-chunk-21-1.pdf)<!-- --> 
  

$6909$ of all marker call rates are lower than 0.98,  
 and $6909$ are lower than the threshold 0.95.


The results of the sample call rate filter are included in the export file **samples_filtered.csv** which also documents the following control-probe based quality control.











