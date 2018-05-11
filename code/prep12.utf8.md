---
title: "EPIC Pipeline"
date: "04 May, 2018"
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

### Read data and parameters

We are working with data from directory /data/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/Panther which contains $168$ idat files.
The annotationfile used is 
../annotationfileB4_2017-09-15.csv 
 - if problems occur with annotation, please have a look at [Illumina downloads](https://support.illumina.com/array/downloads.html)    *Infimum Methylation EPIC Product files*. 


Output is directed to /data/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12. We use samples listed in /data/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/samplesfile for quality control. 

As given in *parameterfile.R*, the following parameters were used: 

parameter                     | value
------------------------------|-------------------------------------
arraytype                     | IlluminaHumanMethylationEPIC
detPthreshold                 | $10^{-16}$
callrate.thres                | $0.93$
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
##                           CD8T      CD4T         NK      Bcell       Mono
## 200973410156_R06C01 0.03446522 0.1520899 0.01548518 0.05507277 0.09313706
## 200991630098_R02C01 0.10913211 0.1561803 0.05517052 0.07396361 0.08238988
## 200973410156_R06C01 0.03446522 0.1520899 0.01548518 0.05507277 0.09313706
## 200991630098_R02C01 0.10913211 0.1561803 0.05517052 0.07396361 0.08238988
##                          Gran
## 200973410156_R06C01 0.6661964
## 200991630098_R02C01 0.5556940
## 200973410156_R06C01 0.6661964
## 200991630098_R02C01 0.5556940
```

### Data preparation

The probes are divided by chromosome type: autosomal probes, chromosome X probes and chromosome Y probes.
For this step we need the annotationfile.



### High-level quality control


High level quality control includes detection p-value filter, restriction the the samples listed in the samplesfile and call rate filtering.

We calculate raw beta values for both autosomal and sex chromosome data.
In our further calculations beta value data always is processed separately for autosomes and gametes. 

* Detection p-values are illustrated in the following plots. Low p-values indicate that the signal is unlikely to be background noise. 

![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-11-1.pdf)<!-- --> 



![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-12-1.pdf)<!-- --> 
\pagebreak


The following table summarizes how many detection p-values are smaller than the threshold $10^{-16}$ given in the *parameterfile*, or 0.01: 

 threshold           | count                                       | percentage
---------------------|---------------------------------------------|-----------------------------------------------------
$10^{-16}$ | $10254557$    | $0.9858225$
0.01                 | $10377019$             | $0.9975954$




$147475$   ($0.014$ \%)   measurements are excluded because their detection p-value is bigger than $10^{-16}$. Only values with a detection p-value strictly smaller the threshold are kept.
To skip this filtering, set the parameter *detPthreshold* to a value **strictly** bigger than 1 in the *parameterfile.R*.




beta values:   | autosomes           |  sex chromosomes 
---------------|---------------------|----------------------------
dimension:     | $846232, 12$ | $19627, 12$






![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-16-1.pdf)<!-- --> 


```
##  [1] "DOMKO026A" "DOMPA051A" "DOMPA051C" "DOMKO035A" "DOMKO041A"
##  [6] "DOMPA056A" "DOMPA059A" "DOMPA059C" "DOMPA061A" "DOMPA061C"
## [11] "DOMKO016A" "DOMKO017A"
```

* Identified by the samplefile, $12$ samples are included in the analysis.

* There is call-rate filtering with threshold $0.93$.


  

* $0$ samples were tagged for exclusion because the call-rate was below the threshold $0.93$.


![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-19-1.pdf)<!-- --> 

![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-20-1.pdf)<!-- --> 
  

$1$ of all sample call rates are lower than 0.98,  
 and $0$ are lower than the threshold $0.93$.


We have a look at the marker call rates as well:
![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-21-1.pdf)<!-- --> 
  

$5.175\times 10^{4}$ of all marker call rates are lower than 0.98,  
 and $51750$ are lower than the threshold 0.95.


The results of the sample call rate filter are included in the export file **samples_filtered.csv** which also documents the following control-probe based quality control.



## PART 2: Low-Level Quality Control


The quality control consists of two parts: 

1. The second part is based on control probes. Details are given in the [ILMN HD methylation assay protocol guide (15019519)](https://support.illumina.com/downloads/infinium_hd_methylation_assay_protocol_guide_(15019519_b).html).
2. The data is checked for sex mismatch. 



* By conducting a PCA on the control-probe information we obtain controlprobe scores. 



* Then we look at the controls.


The first 3 rows of control probes information from QC contain the following information:


```
##                      Cgreen     Cred Ugreen     Ured BSIIgreen BSIIred
## 200973410156_R01C01 11128.5 15990.33  396.0 746.6667    621.75 11406.0
## 200991630056_R05C01 10047.5 13852.00  392.5 678.6667    513.00 10194.0
## 200973410156_R02C01 12927.0 18171.67  457.0 853.3333    717.00 13790.5
##                      HybH HybL  TR SpecIPMred SpecIPMgreen SpecIMMred
## 200973410156_R01C01 24111 7669 137   6029.167     2332.333   333.8333
## 200991630056_R05C01 21875 6616 107   4994.333     2349.000   308.0000
## 200973410156_R02C01 27046 8295 192   6751.500     2963.167   407.8333
##                     SpecIMMgreen SpecIIspec SpecIIunspec   ExtCG ExtAT
## 200973410156_R01C01     80.83333   15850.67     260.3333 25819.0 33705
## 200991630056_R05C01     86.83333   12859.67     212.0000 24346.5 36603
## 200973410156_R02C01    124.66667   17133.33     307.0000 30377.5 40598
##                     StainingRedH StainingGreenH StainingRedB
## 200973410156_R01C01        32045          20467          463
## 200991630056_R05C01        27154          17398          583
## 200973410156_R02C01        39497          22626          559
##                     StainingGreenB
## 200973410156_R01C01            197
## 200991630056_R05C01            115
## 200973410156_R02C01            156
```

In the following control probes are checked. For a more detailed descriptin see e.g. the [ILMN HD methylation assay protocol guide (15019519)](https://support.illumina.com/downloads/infinium_hd_methylation_assay_protocol_guide_(15019519_b).html) or the [Illumina BeadArray Controls Reporter Software Guide ](https://support.illumina.com/downloads/beadarray-controls-reporter-software-guide-1000000004009.html),pages 6-8. Probes are evaluated by MA plots. BS-I and BS-II control probes check the DNA bisulfite conversion step.

![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-25-1.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-25-2.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-25-3.pdf)<!-- --> 

We also check the Hybridisation of the amplified DNA to the array:

![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-1.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-2.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-3.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-4.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-5.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-6.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-7.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-8.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-26-9.pdf)<!-- --> 


The following table lists the detected outliers identified by the quality control and can be found 
in the file /data/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/samples-filtered.csv in a slightly expanded version. 


```
## No samples were filtered.
```

### Sex mismatch

Gamete methylation can be used to check sex mismatches. First, we see the loadings of the PCA on markers in the space of samples. The second plot shows the principle components of the PCA on the samples in the space of samples.

![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-28-1.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-28-2.pdf)<!-- --> 


![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-29-1.pdf)<!-- --> ![](/dsk/data1/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/epictest12/2018-05-04-11h54m-Panther-QC_files/figure-latex/unnamed-chunk-29-2.pdf)<!-- --> 

The previous calculations provide all information needed to filter the samples and make a tab-separated file *samplesfilefinal* for further use. 
For this analysis, /data/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/final_preprocessing/samplesfile was used as list of samples for the final preprocessing steps. 

## Output



1. The following data is included in the Rdata-file QC_data_Panther_2018-05-04-11h54m.Rdata:
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

The maximum memory load in this run was $6228.8$ Mb .
It took 11.81829 mins of processing time.


## Methods

We will draft an example methods part for papers.
(in the processing)

## Credits

The code for this pipeline was written by Benjamin Lehne (Imperial College London) and Alexander Drong (Oxford University), extended by Alexander Teumer (University Medicine Greifswald/ Erasmus MC Rotterdam) and combined into the pipeline by Pascal Schlosser and Franziska Grundner-Culemann in 2017. 

See *A coherent approach for analysis of the Illumina HumanMethylation450 Bead Chip improves quality and performance in epigenome-wide association studies* by Lehne et. al., Genome Biology (2015)
for the basic idea. The method was then extended to EPIC arrays. 
Please cite this article in your publication. 
