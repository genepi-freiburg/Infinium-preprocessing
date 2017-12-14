
---
title: "EPIC Pipeline"
date: "08 November, 2017"
output:
  pdf_document:
    toc: true
    toc_depth: 2
---


This is a pipeline for preprocessing EPIC-Methylation data using R. 


## PART 1: Read data and parameters



We are working with data from directory /data/epigenetics/01_EWAS/03_psychiatric/01_PANTHER/Panther which contains $168$ idat files.
The annotationfile used is 

/dsk/home/grundner/Methylation-Pipeline/additionalFiles/annotationfileB4_2017-09-15.csv 
- if problems occur with annotation, please have a look at [Illumina downloads](https://support.illumina.com/array/downloads.html)    *Infimum Methylation EPIC Product files*. 


Output is directed to /dsk/home/grundner/Methylation-Pipeline/Output. We use samples listed in /dsk/home/grundner/Methylation-Pipeline/additionalFiles/samplesfile for quality control. 

As given in *parameterfile.R*, the following parameters were used: 

parameter                     | value
------------------------------|-------------------------------------
arraytype                     | IlluminaHumanMethylationEPIC
detPthreshold                 | $10^{-16}$
callrate.thres                | $0.93$
filterOutlierCtrlQC           | TRUE
QuantileNormalize             | TRUE
InterQuartileRangeCalculation | FALSE

Further we interpret the value **1** for the gender in the samplesfile as **female** and the value **0** as **male**. 


```
## The samples listed in /dsk/home/grundner/Methylation-Pipeline/additionalFiles/samplesfilefinal are used for quantile normalization 
##  and calculation of outliers regarding inter-quartile-range.
```


* PCA is conducted to get controlprobe scores. 



* Detection p-values are calculated and illustrated in the following plots. Low p-values indicate that the signal is unlikely to be background noise. 

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-9-1.pdf)<!-- --> 





![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-10-1.pdf)<!-- --> 
\pagebreak


The following table summarizes how many detection p-values are smaller than the threshold $10^{-16}$ given in the *parameterfile*, or 0.01: 

 threshold           | count                                       | percentage
---------------------|---------------------------------------------|-----------------------------------------------------
$10^{-16}$ | $143282913$    | $0.9838937$
0.01                 | $144881923$             | $0.9948738$



  



* The probes are divided by chromosome type: autosomal probes, chromosome X probes and chromosome Y probes.
$143282913$   ($0.984$ \%)   measurements are excluded because their detection p-value is strictly smaller than $10^{-16}$. 
To skip this filtering, set the parameter *detPthreshold* to a value **strictly** bigger than 1 in the *parameterfile.R*.

* The data is divided into automomal chromosomes and gametes to calculate call rates and separate sets of beta values.



beta values:   | autosomes           |  sex chromosomes 
---------------|---------------------|----------------------------
dimension:     | $846232, 168$ | $19627, 168$




## PART 2 : lowlevel QC

The quality control consists of three parts: 

1. There is call-rate filtering with threshold $0.93$
2. The second part is based on control probes. Details are given in the [ILMN HD methylation assay protocol guide (15019519)](https://support.illumina.com/downloads/infinium_hd_methylation_assay_protocol_guide_(15019519_b).html).
3. The data is checked for sex mismatch. 




$168$ samples are included in the analysis, identified by the samplefile and existing sample calls:


```
##   [1] "200973410156_R01C01" "200991630056_R05C01" "200973410156_R02C01"
##   [4] "200991630056_R06C01" "200973410156_R03C01" "200991630056_R07C01"
##   [7] "200973410156_R04C01" "200991630056_R08C01" "200973410156_R05C01"
##  [10] "200991630098_R01C01" "200973410156_R06C01" "200991630098_R02C01"
##  [13] "200973410156_R07C01" "200991630098_R03C01" "200973410156_R08C01"
##  [16] "200991630098_R04C01" "200991620112_R01C01" "200991630098_R05C01"
##  [19] "200991620112_R02C01" "200991630098_R06C01" "200991620112_R03C01"
##  [22] "200991630098_R07C01" "200991620112_R04C01" "200991630098_R08C01"
##  [25] "200991620112_R05C01" "200991630129_R01C01" "200991620112_R06C01"
##  [28] "200991630129_R02C01" "200991620112_R07C01" "200991630129_R03C01"
##  [31] "200991620112_R08C01" "200991630129_R04C01" "200991620113_R01C01"
##  [34] "200991630129_R05C01" "200991620113_R02C01" "200991630129_R06C01"
##  [37] "200991620113_R03C01" "200991630129_R07C01" "200991620113_R04C01"
##  [40] "200991630129_R08C01" "200991620113_R05C01" "201096090132_R01C01"
##  [43] "200991620113_R06C01" "201096090132_R02C01" "200991620113_R07C01"
##  [46] "201096090132_R03C01" "200991620113_R08C01" "201096090132_R04C01"
##  [49] "200991620130_R01C01" "201096090132_R05C01" "200991620130_R02C01"
##  [52] "201096090132_R06C01" "200991620130_R03C01" "201096090132_R07C01"
##  [55] "200991620130_R04C01" "201096090132_R08C01" "200991620130_R05C01"
##  [58] "201096090135_R01C01" "200991620130_R06C01" "201096090135_R02C01"
##  [61] "200991620130_R07C01" "201096090135_R03C01" "200991620130_R08C01"
##  [64] "201096090135_R04C01" "200991620131_R01C01" "201096090135_R05C01"
##  [67] "200991620131_R02C01" "201096090135_R06C01" "200991620131_R03C01"
##  [70] "201096090135_R07C01" "200991620131_R04C01" "201096090135_R08C01"
##  [73] "200991620131_R05C01" "201096090147_R01C01" "200991620131_R06C01"
##  [76] "201096090147_R02C01" "200991620131_R07C01" "201096090147_R03C01"
##  [79] "200991620131_R08C01" "201096090147_R04C01" "200991630005_R01C01"
##  [82] "201096090147_R05C01" "200991630005_R02C01" "201096090147_R06C01"
##  [85] "200991630005_R03C01" "201096090147_R07C01" "200991630005_R04C01"
##  [88] "201096090147_R08C01" "200991630005_R05C01" "201096090164_R01C01"
##  [91] "200991630005_R06C01" "201096090164_R02C01" "200991630005_R07C01"
##  [94] "201096090164_R03C01" "200991630005_R08C01" "201096090164_R04C01"
##  [97] "200991630037_R01C01" "201096090164_R05C01" "200991630037_R02C01"
## [100] "201096090164_R06C01" "200991630037_R03C01" "201096090164_R07C01"
## [103] "200991630037_R04C01" "201096090164_R08C01" "200991630037_R05C01"
## [106] "201096090184_R01C01" "200991630037_R06C01" "201096090184_R02C01"
## [109] "200991630037_R07C01" "201096090184_R03C01" "200991630037_R08C01"
## [112] "201096090184_R04C01" "200991630038_R01C01" "201096090184_R05C01"
## [115] "200991630038_R02C01" "201096090184_R06C01" "200991630038_R03C01"
## [118] "201096090184_R07C01" "200991630038_R04C01" "201096090184_R08C01"
## [121] "200991630038_R05C01" "201105900014_R01C01" "200991630038_R06C01"
## [124] "201105900014_R02C01" "200991630038_R07C01" "201105900014_R03C01"
## [127] "200991630038_R08C01" "201105900014_R04C01" "200991630039_R01C01"
## [130] "201105900014_R05C01" "200991630039_R02C01" "201105900014_R06C01"
## [133] "200991630039_R03C01" "201105900014_R07C01" "200991630039_R04C01"
## [136] "201105900014_R08C01" "200991630039_R05C01" "201105900153_R01C01"
## [139] "200991630039_R06C01" "201105900153_R02C01" "200991630039_R07C01"
## [142] "201105900153_R03C01" "200991630039_R08C01" "201105900153_R04C01"
## [145] "200991630048_R01C01" "201105900153_R05C01" "200991630048_R02C01"
## [148] "201105900153_R06C01" "200991630048_R03C01" "201105900153_R07C01"
## [151] "200991630048_R04C01" "201105900153_R08C01" "200991630048_R05C01"
## [154] "201105900157_R01C01" "200991630048_R06C01" "201105900157_R02C01"
## [157] "200991630048_R07C01" "201105900157_R03C01" "200991630048_R08C01"
## [160] "201105900157_R04C01" "200991630056_R01C01" "201105900157_R05C01"
## [163] "200991630056_R02C01" "201105900157_R06C01" "200991630056_R03C01"
## [166] "201105900157_R07C01" "200991630056_R04C01" "201105900157_R08C01"
```


  

* $2$ samples were tagged for exclusion because the call-rate was below the threshold $0.93$.




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

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-19-1.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-19-2.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-19-3.pdf)<!-- --> 

We also check the Hybridisation of the amplified DNA to the array:

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-1.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-2.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-3.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-4.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-5.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-6.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-7.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-8.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-20-9.pdf)<!-- --> 


The following table lists the detected outliers identified by the quality control and can be found 
in the file /dsk/home/grundner/Methylation-Pipeline/Output/samples-filtered.csv in a slightly expanded version. 


```
##    Sample_Name                                                    filter
## 2    DOMPA023A                                              BS I-C (red)
## 4    DOMPA023A                                                     BS II
## 1    DOMPA023A                                             callrate 0.93
## 7    DOMPA023A                                                Extensions
## 6    DOMPA023A                                            Specificity II
## 5    DOMPA023A                                       Specificity I (red)
## 3    DOMPA023A Staining Green_Red (cross-check with Extension outliers!)
## 10   DOMPA023C                                              BS I-C (red)
## 9    DOMPA023C                                                     BS II
## 8    DOMPA023C                                             callrate 0.93
## 14   DOMPA023C                                                Extensions
## 11   DOMPA023C                                            Specificity II
## 12   DOMPA023C                                       Specificity I (red)
## 15   DOMPA023C Staining Green_Red (cross-check with Extension outliers!)
## 13   DOMPA023C       Staining Red (cross-check with Extension outliers!)
## 16   DOMPA019C     Staining Green (cross-check with Extension outliers!)
## 17   DOMPA042A     Staining Green (cross-check with Extension outliers!)
##                 sample         x           y Sample_Well   Sample_Plate
## 2  200991630039_R01C01  9.747682 -0.23300906         A09 WG5121691-MSA4
## 4  200991630039_R01C01  9.235645  1.62295734         A09 WG5121691-MSA4
## 1  200991630039_R01C01        NA          NA         A09 WG5121691-MSA4
## 7  200991630039_R01C01 11.811705  4.47611611         A09 WG5121691-MSA4
## 6  200991630039_R01C01  8.487885  2.21412413         A09 WG5121691-MSA4
## 5  200991630039_R01C01  8.048585  0.23766650         A09 WG5121691-MSA4
## 3  200991630039_R01C01 11.589709 -3.36263249         A09 WG5121691-MSA4
## 10 200991630039_R02C01  9.347114  0.68110733         B09 WG5121691-MSA4
## 9  200991630039_R02C01  9.332549  2.12918236         B09 WG5121691-MSA4
## 8  200991630039_R02C01        NA          NA         B09 WG5121691-MSA4
## 14 200991630039_R02C01 12.452721  3.80298725         B09 WG5121691-MSA4
## 11 200991630039_R02C01  7.934482  0.04717677         B09 WG5121691-MSA4
## 12 200991630039_R02C01  9.593513  0.47558903         B09 WG5121691-MSA4
## 15 200991630039_R02C01 11.620774 -4.16323017         B09 WG5121691-MSA4
## 13 200991630039_R02C01  9.734948 -0.39157848         B09 WG5121691-MSA4
## 16 201096090135_R05C01  8.345934 12.04798114         E07 WG5121691-MSA4
## 17 201105900157_R06C01  8.175125 12.35021254         F03 WG5121692-MSA4
##    Sample_Group Pool_ID Gender  callrate
## 2            65      NA      1 0.2664328
## 4            65      NA      1 0.2664328
## 1            65      NA      1 0.2664328
## 7            65      NA      1 0.2664328
## 6            65      NA      1 0.2664328
## 5            65      NA      1 0.2664328
## 3            65      NA      1 0.2664328
## 10           66      NA      1 0.3620485
## 9            66      NA      1 0.3620485
## 8            66      NA      1 0.3620485
## 14           66      NA      1 0.3620485
## 11           66      NA      1 0.3620485
## 12           66      NA      1 0.3620485
## 15           66      NA      1 0.3620485
## 13           66      NA      1 0.3620485
## 16           53      NA      0 0.9939969
## 17          118      NA      1 0.9981979
```

Gamete methylation can be used to check sex mismatches. First, we see the loadings of the PCA on markers in the space of samples. The second plot shows the principle components of the PCA on the samples in the space of samples.

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-22-1.pdf)<!-- --> 


![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-23-1.pdf)<!-- --> 


![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-24-1.pdf)<!-- --> 

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-25-1.pdf)<!-- --> 
  

$6$ of all sample call rates are lower than 0.98,  
 and $2$ are lower than the threshold $0.93$.

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-26-1.pdf)<!-- --> 
  

$4.5519\times 10^{4}$ of all marker call rates are lower than 0.98,  
 and $23127$ are lower than the threshold 0.95.



The previous calculations provide all information needed to filter the samples and make a tab-separated file *samplesfilefinal* for further use. 
For this analysis, /dsk/home/grundner/Methylation-Pipeline/additionalFiles/samplesfilefinal was used as list of samples for the final preprocessing steps. 

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-27-1.pdf)<!-- --> 
  



## PART 3: Quantile Normalisation


162 samples are included in the analysis, identified by the *samplesfilefinal* /dsk/home/grundner/Methylation-Pipeline/additionalFiles/samplesfilefinal and existing sample calls:


```
##   [1] "DOMPA059A" "DOMPA059C" "DOMPA061A" "DOMPA061C" "DOMKO016A"
##   [6] "DOMKO017A" "DOMKO015A" "DOMKO061A" "DOMKO006A" "DOMPA029A"
##  [11] "DOMPA029C" "DOMKO010A" "DOMPA030A" "DOMPA030C" "DOMKO029A"
##  [16] "DOMKO044A" "DOMPA010A" "DOMPA010C" "DOMKO023A" "DOMPA011A"
##  [21] "DOMPA011C" "DOMKO012A" "DOMKO065A" "DOMPA052A" "DOMPA052C"
##  [26] "DOMKO056A" "DOMPA053A" "DOMPA053C" "DOMKO059A" "DOMPA055A"
##  [31] "DOMPA055C" "DOMPA004A" "DOMPA004C" "DOMKO020A" "DOMPA007A"
##  [36] "DOMPA007C" "DOMKO057A" "DOMPA001A" "DOMKO021A" "DOMKO055A"
##  [41] "DOMPA038A" "DOMPA038C" "DOMKO004A" "DOMPA039A" "DOMPA039C"
##  [46] "DOMKO027A" "DOMKO005A" "DOMPA026A" "DOMPA026C" "DOMKO051A"
##  [51] "DOMPA027A" "DOMPA027C" "DOMKO008A" "DOMPA028A" "DOMPA028C"
##  [56] "DOMPA008A" "DOMPA008C" "DOMKO030A" "DOMPA009A" "DOMPA009C"
##  [61] "DOMKO063A" "DOMPA002A" "DOMKO046A" "DOMKO034A" "DOMPA024A"
##  [66] "DOMPA024C" "DOMKO058A" "DOMPA025A" "DOMPA025C" "DOMKO036A"
##  [71] "DOMPA047A" "DOMPA047C" "DOMKO038A" "DOMPA048A" "DOMPA048C"
##  [76] "DOMKO024A" "DOMKO022A" "DOMPA049A" "DOMPA049C" "DOMPA050A"
##  [81] "DOMPA050C" "DOMKO026A" "DOMPA051A" "DOMPA051C" "DOMKO035A"
##  [86] "DOMPA056A" "DOMPA056C" "DOMKO045A" "DOMPA057A" "DOMPA057C"
##  [91] "DOMKO039A" "DOMKO013A" "DOMPA014A" "DOMPA014C" "DOMKO032A"
##  [96] "DOMPA015A" "DOMPA015C" "DOMKO062A" "DOMPA054A" "DOMKO049A"
## [101] "DOMPA012A" "DOMPA012C" "DOMKO050A" "DOMPA013A" "DOMPA013C"
## [106] "DOMKO042A" "DOMPA046A" "DOMKO002A" "DOMPA018A" "DOMPA018C"
## [111] "DOMKO009A" "DOMPA019A" "DOMKO018A" "DOMPA020A" "DOMPA020C"
## [116] "DOMPA031A" "DOMPA031C" "DOMKO025A" "DOMPA032A" "DOMPA032C"
## [121] "DOMKO014A" "DOMPA033A" "DOMPA033C" "DOMPA016A" "DOMPA016C"
## [126] "DOMKO011A" "DOMPA017A" "DOMPA017C" "DOMKO047A" "DOMPA058A"
## [131] "DOMKO054A" "DOMPA034A" "DOMPA034C" "DOMKO031A" "DOMPA036A"
## [136] "DOMPA036C" "DOMKO064A" "DOMPA037A" "DOMPA037C" "DOMKO033A"
## [141] "DOMPA021A" "DOMPA021C" "DOMKO060A" "DOMPA022A" "DOMPA022C"
## [146] "DOMKO048A" "DOMKO003A" "DOMPA043A" "DOMPA043C" "DOMKO040A"
## [151] "DOMPA044A" "DOMPA044C" "DOMKO043A" "DOMPA045A" "DOMPA045C"
## [156] "DOMPA040A" "DOMPA040C" "DOMPA041A" "DOMPA041C" "DOMKO028A"
## [161] "DOMPA042C" "DOMKO052A"
```



Of the persons from whom samples are processed, 124 are women and 38 men.   




For the following PCA markers which had at least one cpg site missing were excluded.
![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-32-1.pdf)<!-- --> 
  

The following plot is a PCA on **variables**: It presents the importance of samples when differentiating between the CpG sites in the best way possible. 

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-33-1.pdf)<!-- --> 
  


The next plot presents a PCA on **samples**, as it is more common. It shows the variance of the samples on the PC axes. 

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-34-1.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-34-2.pdf)<!-- --> 
  



![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-35-1.pdf)<!-- --> 
  



![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-36-1.pdf)<!-- --> 

  

![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-37-1.pdf)<!-- --> ![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-37-2.pdf)<!-- --> 


![](2017-11-08-16h14m-Panther_files/figure-latex/unnamed-chunk-38-1.pdf)<!-- --> 


## Output



1. The following data is included in the Rdata-file QC_data_Panther_2017-11-08-16h44m.Rdata:
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
	\item[pcaAuto] output of function prcomp conducting PCA of \textbf{betaQN}
	\item[sample.callY, sample.callX] sample call rates for chromosomes X and Y for quantile normalized filtered samples
	\item[marker.call.all] marker callrate of all quantile normalized samples incl. the ones excluded by IQR-filter 
\end{description}


2. The data needed for further analysis is saved as analysis_ready_Panther_2017-11-08-16h44m.Rdata:
\begin{description}
	\item[pcaControls] output of function prcomp conducting the PCA of control probes 
	\item[betaQN] $\beta$ values calculated for autosomal probes of filtered samples with quantile normalization applied 
	\item[betaQN.sex] $\beta$ values calculated for sex chromosome probes of filtered samples with quantile normalization applied 
	\item[betaQN.all] combines \textbf{betaQN} and \textbf{betaQN.sex} 
\end{description}

If you run the pipeline a second time the data files will be overwritten, so please store them at a different place if you want to keep both. 





## Memory load

The maximum memory load in this run was $1.93789\times 10^{4}$ Mb .


## Remarks for further processing

For quantile normalization, please

  * If not already done, prepare a file *samplesfilefinal* with the same structure as *samplesfile* where outlier are removed. 

  * If needed, readjust the parameters. 

The file *samples.filtered.csv* provides information about the detected outlier and the reason of detection.  
Remember to also switch *QuantileNormalisation=TRUE* in the *parameterfile*. 
If you want to have the Quality Control without the filtered samples in the second run, please exclude them from *samplesfile* as well and not only from *samplesfilefinal*. In that case, you can just name the same file for both parameters. 

## Methods

We will draft an example methods part for papers.
(in the processing)

## Credits

The code for this pipeline was written by Benjamin Lehne (Imperial College London) and Alexander Drong (Oxford University), extended by Alexander Teumer (University Medicine Greifswald/ Erasmus MC Rotterdam) and combined into the pipeline by Pascal Schlosser and Franziska Grundner-Culemann in 2017. 

See *A coherent approach for analysis of the Illumina HumanMethylation450 Bead Chip improves quality and performance in epigenome-wide association studies* by Lehne et. al., Genome Biology (2015)
for the basic idea. The method was then extended to EPIC arrays. 
Please cite this article in your publication. 
