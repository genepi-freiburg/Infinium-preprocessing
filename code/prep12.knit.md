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

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-11-1.pdf)<!-- --> 



![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-12-1.pdf)<!-- --> 
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






![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-16-1.pdf)<!-- --> 


```
## 
## The sample names of the included samples:
```

```
## [1] "65"  "66"  "67"  "68"  "103" "104" "113" "114"
```

* Identified by the samplefile, $8$ samples are included in the analysis.

* There is call-rate filtering with threshold $0.95$.


  

* $0$ samples were tagged for exclusion because the call-rate was below the threshold $0.95$.


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-19-1.pdf)<!-- --> 

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-20-1.pdf)<!-- --> 
  

$0$ of all sample call rates are lower than 0.98,  
 and $0$ are lower than the threshold $0.95$.


We have a look at the marker call rates as well:


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-21-1.pdf)<!-- --> 
  

$6909$ of all marker call rates are lower than 0.98,  
 and $6909$ are lower than the threshold 0.95.


The results of the sample call rate filter are included in the export file **samples_filtered.csv** which also documents the following control-probe based quality control.



## PART 2: Low-Level Quality Control


The quality control consists of two parts: 

1. The second part is based on control probes. Details are given in the [ILMN HD methylation assay protocol guide (15019519)](https://support.illumina.com/downloads/infinium_hd_methylation_assay_protocol_guide_(15019519_b).html).
2. The data is checked for sex mismatch. 



* By conducting a PCA on the control-probe information we obtain controlprobe scores. 



* Then we look at the controls.


The first 3 rows of control probes information from QC contain the following information:


```
##                      Cgreen     Cred Ugreen      Ured BSIIgreen  BSIIred
## 202073180001_R01C01 11491.5 16270.00  560.0  969.3333    902.50 13690.50
## 202073210049_R07C01 14630.0 14602.00  336.5  610.3333    760.50 12374.00
## 202073180001_R02C01 12672.5 16131.67  632.5 1172.6667    809.75 13564.75
##                      HybH HybL    TR SpecIPMred SpecIPMgreen SpecIMMred
## 202073180001_R01C01 22111 6753  92.0   6135.000     2959.167   325.3333
## 202073210049_R07C01 31751 9046 165.5   5285.667     3222.333   300.1667
## 202073180001_R02C01 25303 8001 132.0   6165.333     3305.333   410.5000
##                     SpecIMMgreen SpecIIspec SpecIIunspec   ExtCG   ExtAT
## 202073180001_R01C01     94.00000   14972.67          357 23495.5 25846.0
## 202073210049_R07C01     95.33333   14202.33          238 35372.0 31550.5
## 202073180001_R02C01    151.16667   15074.33          327 28527.0 28393.5
##                     StainingRedH StainingGreenH StainingRedB
## 202073180001_R01C01        24519          15805           75
## 202073210049_R07C01        27816          23587          352
## 202073180001_R02C01        23917          18047          155
##                     StainingGreenB
## 202073180001_R01C01              0
## 202073210049_R07C01            162
## 202073180001_R02C01              0
```

In the following control probes are checked. For a more detailed descriptin see e.g. the [ILMN HD methylation assay protocol guide (15019519)](https://support.illumina.com/downloads/infinium_hd_methylation_assay_protocol_guide_(15019519_b).html) or the [Illumina BeadArray Controls Reporter Software Guide ](https://support.illumina.com/downloads/beadarray-controls-reporter-software-guide-1000000004009.html),pages 6-8. Probes are evaluated by MA plots. BS-I and BS-II control probes check the DNA bisulfite conversion step.

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-25-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-25-2.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-25-3.pdf)<!-- --> 

We also check the Hybridisation of the amplified DNA to the array:

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-2.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-3.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-4.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-5.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-6.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-7.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-8.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-26-9.pdf)<!-- --> 


The following table lists the detected outliers identified by the quality control and can be found 
in the file /data/studies/00_GCKD/00_data/02_methylation/02_clean_data/EPIC_batch1/samples-filtered.csv in a slightly expanded version. 


```
## No samples were filtered.
```

### Sex mismatch

Gamete methylation can be used to check sex mismatches. First, we see the loadings of the PCA on markers in the space of samples. The second plot shows the principle components of the PCA on the samples in the space of samples.

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-28-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-28-2.pdf)<!-- --> 


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-29-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-11-13h38m-GCKD-QC_files/figure-latex/unnamed-chunk-29-2.pdf)<!-- --> 

The previous calculations provide all information needed to filter the samples and make a tab-separated file *samplesfilefinal* for further use. 
For this analysis, /data/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/01_input/samplesfile_GCKD_EPICs.txt was used as list of samples for the final preprocessing steps. 

## Output



1. The following data is included in the Rdata-file QC_data_GCKD_2018-05-11-13h38m.Rdata:
\begin{description}
	\item[ctrl.all, ctrl.complete.Red.all, ctrl.complete.Green.all, control.info] control probe data
	\item[ctrlprobes.scores] rotated control probe intensities into the coordinates given by principal component analysis
	\item[dp.all] detection p-values of unfiltered idat data
	\item[TypeII.Red.All etc] list the corresponding intensity values
	\item[TypeII.Red.All.d etc] list the corresponding intensity values where detection p-values smaller than threshold $10^{-16}$ are set to missing (NA).
	\item[sample.call] the sample call rates
	\item[marker.call] the marker call rates
	\item[beta.raw] the $\beta$ values calculated for autosomal probes with detection p value filter only
	\item[beta.raw.sex] the $\beta$ values calculated for sex chromosome probes with detection p value filter only
	\item[est.wbc.minfi] the white-blood-cell estimations by minfi method based on RGsets
\end{description}






## Remarks for further processing

For quantile normalization, please

  * If not already done, prepare a file *samplesfilefinal* with the same structure as *samplesfile* where outlier are removed. 

  * If needed, readjust the parameters. 

The file *samples.filtered.csv* provides information about the detected outlier and the reason of detection.  
Remember to also switch *QuantileNormalisation=TRUE* in the *parameterfile* to prepare the data for analysis. 
If you want to have the Quality Control without the filtered samples in the second run, please exclude them from *samplesfile* as well and not only from *samplesfilefinal*. In that case, you can just name the same file for both parameters. 







## Memory load and processing time

The maximum memory load in this run was $5721.6$ Mb .
It took 8.439909 mins of processing time.


## Methods

We will draft an example methods part for papers.
(in the processing)

## Credits

The code for this pipeline was written by Benjamin Lehne (Imperial College London) and Alexander Drong (Oxford University), extended by Alexander Teumer (University Medicine Greifswald/ Erasmus MC Rotterdam) and combined into the pipeline by Pascal Schlosser and Franziska Grundner-Culemann in 2017. 

See *A coherent approach for analysis of the Illumina HumanMethylation450 Bead Chip improves quality and performance in epigenome-wide association studies* by Lehne et. al., Genome Biology (2015)
for the basic idea. The method was then extended to EPIC arrays. 
Please cite this article in your publication. 
