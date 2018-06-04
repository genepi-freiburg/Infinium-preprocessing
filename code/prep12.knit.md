---
title: "EPIC Pipeline"
date: "30 May, 2018"
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
## [1] 1
```

```
## Warning: package 'FlowSorted.Blood.450k' was built under R version 3.4.2
```

```
## Warning: package 'IlluminaHumanMethylation450kanno.ilmn12.hg19' was built
## under R version 3.4.2
```

```
## [1] 2
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 3
## [1] 4
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 5
## [1] 6
## [1] 7
## [1] 8
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 9
## [1] 10
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 11
## [1] 12
## [1] 13
## [1] 14
## [1] 15
## [1] 16
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 17
## [1] 18
## [1] 19
## [1] 20
## [1] 21
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 22
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 23
## [1] 24
## [1] 25
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 26
## [1] 27
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 28
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 29
## [1] 30
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 31
## [1] 32
## [1] 33
## [1] 34
## [1] 35
## [1] 36
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 37
## [1] 38
## [1] 39
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 40
## [1] 41
## [1] 42
## [1] 43
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 44
## [1] 45
## [1] 46
## [1] 47
## [1] 48
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 49
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 50
## [1] 51
## [1] 52
## [1] 53
## [1] 54
## [1] 55
## [1] 56
## [1] 57
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 58
## [1] 59
## [1] 60
## [1] 61
## [1] 62
## [1] 63
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 64
## [1] 65
## [1] 66
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 67
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 68
## [1] 69
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 70
## [1] 71
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 72
## [1] 73
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 74
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 75
## [1] 76
## [1] 77
## [1] 78
## [1] 79
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 80
## [1] 81
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 82
## [1] 83
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 84
## [1] 85
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 86
## [1] 87
## [1] 88
## [1] 89
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 90
## [1] 91
## [1] 92
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 93
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 94
## [1] 95
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 96
## [1] 97
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 98
## [1] 99
## [1] 100
## [1] 101
## [1] 102
## [1] 103
## [1] 104
## [1] 105
## [1] 106
## [1] 107
## [1] 108
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 109
## [1] 110
## [1] 111
## [1] 112
## [1] 113
## [1] 114
## [1] 115
## [1] 116
## [1] 117
## [1] 118
## [1] 119
## [1] 120
## [1] 121
## [1] 122
## [1] 123
## [1] 124
## [1] 125
## [1] 126
## [1] 127
## [1] 128
## [1] 129
## [1] 130
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 131
## [1] 132
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 133
## [1] 134
## [1] 135
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 136
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 137
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 138
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 139
## [1] 140
## [1] 141
## [1] 142
## [1] 143
## [1] 144
## [1] 145
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 146
## [1] 147
## [1] 148
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 149
## [1] 150
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 151
## [1] 152
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 153
## [1] 154
## [1] 155
## [1] 156
## [1] 157
## [1] 158
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 159
## [1] 160
## [1] 161
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 162
## [1] 163
## [1] 164
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 165
## [1] 166
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 167
## [1] 168
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 169
## [1] 170
## [1] 171
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 172
## [1] 173
## [1] 174
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 175
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 176
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 177
## [1] 178
## [1] 179
## [1] 180
## [1] 181
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 182
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 183
## [1] 184
## [1] 185
## [1] 186
## [1] 187
## [1] 188
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 189
## [1] 190
## [1] 191
## [1] 192
## [1] 193
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 194
## [1] 195
## [1] 196
## [1] 197
## [1] 198
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 199
## [1] 200
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 201
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 202
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 203
## [1] 204
## [1] 205
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 206
## [1] 207
## [1] 208
## [1] 209
## [1] 210
## [1] 211
## [1] 212
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 213
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 214
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 215
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 216
## [1] 217
## [1] 218
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 219
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 220
## [1] 221
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 222
## [1] 223
## [1] 224
## [1] 225
## [1] 226
## [1] 227
## [1] 228
## [1] 229
## [1] 230
## [1] 231
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 232
## [1] 233
## [1] 234
## [1] 235
## [1] 236
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 237
## [1] 238
## [1] 239
## [1] 240
## [1] 241
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 242
## [1] 243
## [1] 244
## [1] 245
## [1] 246
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 247
## [1] 248
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 249
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 250
## [1] 251
## [1] 252
## [1] 253
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 254
## [1] 255
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 256
## [1] 257
## [1] 258
## [1] 259
## [1] 260
## [1] 261
## [1] 262
## [1] 263
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 264
## [1] 265
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 266
## [1] 267
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 268
## [1] 269
## [1] 270
## [1] 271
## [1] 272
## [1] 273
## [1] 274
## [1] 275
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 276
## [1] 277
## [1] 278
## [1] 279
## [1] 280
## [1] 281
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 282
## [1] 283
## [1] 284
## [1] 285
## [1] 286
## [1] 287
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 288
## [1] 289
```

```
## Warning in .getSex(CN = CN, xIndex = xIndex, yIndex = yIndex, cutoff
## = cutoff): An inconsistency was encountered while determining sex. One
## possibility is that only one sex is present. We recommend further checks,
## for example with the plotSex function.
```

```
## [1] 290
```

```
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
##                            CD8T       CD4T         NK      Bcell
## 202073210049_R06C01 0.000000000 0.09626217 0.02520591 0.02834675
## 202178770142_R08C01 0.008134152 0.13890282 0.02392946 0.03167456
## 202073210049_R06C01 0.000000000 0.09626217 0.02520591 0.02834675
## 202178770142_R08C01 0.008134152 0.13890282 0.02392946 0.03167456
##                           Mono      Gran
## 202073210049_R06C01 0.11479159 0.7479815
## 202178770142_R08C01 0.05858892 0.7459377
## 202073210049_R06C01 0.11479159 0.7479815
## 202178770142_R08C01 0.05858892 0.7459377
```

### Data preparation

The probes are divided by chromosome type: autosomal probes, chromosome X probes and chromosome Y probes.
For this step we need the annotationfile.



### High-level quality control


High level quality control includes detection p-value filter, restriction the the samples listed in the samplesfile and call rate filtering.

We calculate raw beta values for both autosomal and sex chromosome data.
In our further calculations beta value data always is processed separately for autosomes and gametes. 

* Detection p-values are illustrated in the following plots. Low p-values indicate that the signal is unlikely to be background noise. 

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-11-1.pdf)<!-- --> 



![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-12-1.pdf)<!-- --> 
\pagebreak


The following table summarizes how many detection p-values are smaller than the threshold $10^{-16}$ given in the *parameterfile*, or 0.01: 

 threshold           | count                                       | percentage
---------------------|---------------------------------------------|-----------------------------------------------------
$10^{-16}$ | $497454071$    | $0.9902879$
0.01                 | $500756870$             | $0.9968628$




$4878709$   ($0.01$ \%)   measurements are excluded because their detection p-value is bigger than $10^{-16}$. Only values with a detection p-value strictly smaller the threshold are kept.
To skip this filtering, set the parameter *detPthreshold* to a value **strictly** bigger than 1 in the *parameterfile.R*.




beta values:   | autosomes           |  sex chromosomes 
---------------|---------------------|----------------------------
dimension:     | $846232, 580$ | $19627, 580$






![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-16-1.pdf)<!-- --> 



* Identified by the samplefile, $580$ samples are included in the analysis.

* There is call-rate filtering with threshold $0.95$.


  

* $9$ samples were tagged for exclusion because the call-rate was below the threshold $0.95$.


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-19-1.pdf)<!-- --> 

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-20-1.pdf)<!-- --> 

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-21-1.pdf)<!-- --> 

$57$ of all sample call rates are lower than 0.98,  
 and $9$ are lower than the threshold $0.95$.


We have a look at the marker call rates as well:


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-22-1.pdf)<!-- --> 


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-23-1.pdf)<!-- --> 

$4.3415\times 10^{4}$ of all marker call rates are lower than 0.98,  
 and $28274$ are lower than the threshold 0.95.


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

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-27-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-27-2.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-27-3.pdf)<!-- --> 

We also check the Hybridisation of the amplified DNA to the array:

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-2.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-3.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-4.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-5.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-6.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-7.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-8.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-28-9.pdf)<!-- --> 


The following table lists the detected outliers identified by the quality control and can be found 
in the file 
\newline 
/data/studies/00_GCKD/00_data/02_methylation/02_clean_data/EPIC_batch1/samples-filtered.csv
\newline
 in a slightly expanded version. 


```
##    Sample_Name                                                    filter
## 3          361                                                Extensions
## 1          361                                                    Hyb_TR
## 2          361 Staining Green_Red (cross-check with Extension outliers!)
## 4          155       Staining Red (cross-check with Extension outliers!)
## 5          160       Staining Red (cross-check with Extension outliers!)
## 6          371     Staining Green (cross-check with Extension outliers!)
## 7          546     Staining Green (cross-check with Extension outliers!)
## 8          546 Staining Green_Red (cross-check with Extension outliers!)
## 9          549 Staining Green_Red (cross-check with Extension outliers!)
## 10         566 Staining Green_Red (cross-check with Extension outliers!)
## 11         487                                            BS I-C (green)
## 12          17                                            BS I-C (green)
## 15         513                                              BS I-C (red)
## 18         513                                                     BS II
## 13         513                                             callrate 0.95
## 14         513                                                Extensions
## 19         513                                            Specificity II
## 20         513                                       Specificity I (red)
## 16         513 Staining Green_Red (cross-check with Extension outliers!)
## 17         513       Staining Red (cross-check with Extension outliers!)
## 21         514                                             callrate 0.95
## 23         515                                             callrate 0.95
## 22         515                                       Specificity I (red)
## 24         516                                             callrate 0.95
## 25         517                                             callrate 0.95
## 26         518                                             callrate 0.95
## 27         519                                             callrate 0.95
## 28         520                                             callrate 0.95
## 29         297                                                    Hyb_TR
## 30         298                                             callrate 0.95
## 33          98                                            BS I-C (green)
## 31          98                                              BS I-C (red)
## 32          98                                                     BS II
## 34         333     Staining Green (cross-check with Extension outliers!)
## 35         337                                     Specificity I (green)
## 36         169                                            BS I-C (green)
## 37         476     Staining Green (cross-check with Extension outliers!)
## 38         264     Staining Green (cross-check with Extension outliers!)
## 39         269                                            BS I-C (green)
## 41         269                                              BS I-C (red)
## 40         269                                                     BS II
## 42         217                                                Extensions
## 43         217 Staining Green_Red (cross-check with Extension outliers!)
## 44         201                                                Extensions
## 45         193                                                Extensions
## 46         194                                                Extensions
##                 sample          x            y Sample_Well   Sample_Plate
## 3  202073180013_R01C01  14.050495  -0.77353955         A10 WG6974822-MSA4
## 1  202073180013_R01C01   9.445530   7.97219330         A10 WG6974822-MSA4
## 2  202073180013_R01C01  13.354273   0.92801830         A10 WG6974822-MSA4
## 4  202073180017_R03C01   9.979356   8.91158425         C08 WG6974874-MSA4
## 5  202073180017_R08C01   9.950171   9.18523454         H08 WG6974874-MSA4
## 6  202073180030_R03C01   7.571413  13.14275291         C11 WG6974822-MSA4
## 7  202073180065_R02C01 -13.287712 -20.56383772         B09 WG6974914-MSA4
## 8  202073180065_R02C01 -13.287712  27.99512544         B09 WG6974914-MSA4
## 9  202073180065_R05C01  14.877367  -0.30496113         E09 WG6974914-MSA4
## 10 202073180071_R06C01  14.732107  -0.22136994         F11 WG6974914-MSA4
## 11 202073200086_R07C01  12.286287   2.99024798         G01 WG6974914-MSA4
## 12 202073200100_R01C01  11.201543   3.40937901         A03 WG6974873-MSA4
## 15 202073200120_R01C01   8.403544   1.12448169         A05 WG6974914-MSA4
## 18 202073200120_R01C01   8.691084  -1.17821483         A05 WG6974914-MSA4
## 13 202073200120_R01C01         NA           NA         A05 WG6974914-MSA4
## 14 202073200120_R01C01  11.747454   6.49123348         A05 WG6974914-MSA4
## 19 202073200120_R01C01   8.238277   0.48031215         A05 WG6974914-MSA4
## 20 202073200120_R01C01   8.456209   1.37604863         A05 WG6974914-MSA4
## 16 202073200120_R01C01  11.529617  -6.15681223         A05 WG6974914-MSA4
## 17 202073200120_R01C01   8.434532   0.03335859         A05 WG6974914-MSA4
## 21 202073200120_R02C01         NA           NA         B05 WG6974914-MSA4
## 23 202073200120_R03C01         NA           NA         C05 WG6974914-MSA4
## 22 202073200120_R03C01  10.114525   2.97155050         C05 WG6974914-MSA4
## 24 202073200120_R04C01         NA           NA         D05 WG6974914-MSA4
## 25 202073200120_R05C01         NA           NA         E05 WG6974914-MSA4
## 26 202073200120_R06C01         NA           NA         F05 WG6974914-MSA4
## 27 202073200120_R07C01         NA           NA         G05 WG6974914-MSA4
## 28 202073200120_R08C01         NA           NA         H05 WG6974914-MSA4
## 29 202073210041_R01C01   9.329212   8.75002693         A02 WG6974822-MSA4
## 30 202073210041_R02C01         NA           NA         B02 WG6974822-MSA4
## 33 202073210049_R02C01  12.746826   1.64439789         B01 WG6974874-MSA4
## 31 202073210049_R02C01  12.272388   2.72749080         B01 WG6974874-MSA4
## 32 202073210049_R02C01  12.296142   2.13885734         B01 WG6974874-MSA4
## 34 202093120019_R05C01   7.723252  13.44642967         E06 WG6974822-MSA4
## 35 202093120020_R01C01   7.253227   5.60952475         A07 WG6974822-MSA4
## 36 202093120070_R01C01  11.856901   3.11080891         A10 WG6974874-MSA4
## 37 202139520177_R04C01   7.385126  12.77017880         D12 WG6974913-MSA4
## 38 202176300048_R08C01   7.721861  13.44364847         H09 WG6974821-MSA4
## 39 202176300151_R05C01  13.272499  -1.31166959         E10 WG6974821-MSA4
## 41 202176300151_R05C01  13.104577  -1.63353650         E10 WG6974821-MSA4
## 40 202176300151_R05C01  12.635822  -1.48352349         E10 WG6974821-MSA4
## 42 202178770013_R01C01  14.272133  -0.77812074         A04 WG6974821-MSA4
## 43 202178770013_R01C01  13.685214   1.06427493         A04 WG6974821-MSA4
## 44 202178770049_R01C01  14.362856  -0.87719996         A02 WG6974821-MSA4
## 45 202178770142_R01C01  14.426127  -1.02469928         A01 WG6974821-MSA4
## 46 202178770142_R02C01  14.621027  -0.81660601         B01 WG6974821-MSA4
##    Sample_Group Pool_ID Sample_ID Gender X X.1  callrate
## 3           361            111056      0       0.9922563
## 1           361            111056      0       0.9922563
## 2           361            111056      0       0.9922563
## 4           155            106828      0       0.9983480
## 5           160            108179      1       0.9981223
## 6           371            111840      1       0.9956820
## 7           546            116670      0       0.9915980
## 8           546            116670      0       0.9915980
## 9           549            118280      0       0.9926261
## 10          566            118701      1       0.9969323
## 11          487            118808      1       0.9716744
## 12           17            104048      0       0.9959467
## 15          513            116083      1       0.4321345
## 18          513            116083      1       0.4321345
## 13          513            116083      1       0.4321345
## 14          513            116083      1       0.4321345
## 19          513            116083      1       0.4321345
## 20          513            116083      1       0.4321345
## 16          513            116083      1       0.4321345
## 17          513            116083      1       0.4321345
## 21          514            116356      1       0.8821434
## 23          515            117009      1       0.9055413
## 22          515            117009      1       0.9055413
## 24          516            117680      1       0.9165643
## 25          517            118116      0       0.9272434
## 26          518            118635      1       0.9138357
## 27          519             54174      1       0.9121104
## 28          520            149890      1       0.8865512
## 29          297            110978      0       0.9783972
## 30          298            111074      0       0.9475971
## 33           98            106321      0       0.9967798
## 31           98            106321      0       0.9967798
## 32           98            106321      0       0.9967798
## 34          333            112224      1       0.9934250
## 35          337            111047      1       0.9874432
## 36          169            106267      0       0.9980679
## 37          476            114494      1       0.9980171
## 38          264            110906      0       0.9933139
## 39          269            109915      1       0.9914350
## 41          269            109915      1       0.9914350
## 40          269            109915      1       0.9914350
## 42          217            108409      1       0.9953902
## 43          217            108409      1       0.9953902
## 44          201            108325      1       0.9948584
## 45          193            108321      0       0.9956430
## 46          194            108588      1       0.9959042
```

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-29-1.pdf)<!-- --> 

### Sex mismatch

Gamete methylation can be used to check sex mismatches. First, we see the loadings of the PCA on markers in the space of samples. The second plot shows the principle components of the PCA on the samples in the space of samples.

![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-30-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-30-2.pdf)<!-- --> 


![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-31-1.pdf)<!-- --> ![](/dsk/data1/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/00_scripts/2018-05-30-09h23m-GCKD-QC_files/figure-latex/unnamed-chunk-31-2.pdf)<!-- --> 

The previous calculations provide all information needed to filter the samples and make a tab-separated file *samplesfilefinal* for further use. 
For this analysis, /data/studies/00_GCKD/01_analyses/ewas/00_DNAm-preprocessing/01_input/samplesfile_GCKD_EPICs.txt was used as list of samples for the final preprocessing steps. 

## Output



1. The following data is included in the Rdata-file QC_data_GCKD_2018-05-30-09h23m.Rdata:
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

The maximum memory load in this run was $5.5253\times 10^{4}$ Mb .
It took 8.615492 hours of processing time.


## Methods

We will draft an example methods part for papers.
(in the processing)

## Credits

The code for this pipeline was written by Benjamin Lehne (Imperial College London) and Alexander Drong (Oxford University), extended by Alexander Teumer (University Medicine Greifswald/ Erasmus MC Rotterdam) and combined into the pipeline by Pascal Schlosser and Franziska Grundner-Culemann in 2017. 

See *A coherent approach for analysis of the Illumina HumanMethylation450 Bead Chip improves quality and performance in epigenome-wide association studies* by Lehne et. al., Genome Biology (2015)
for the basic idea. The method was then extended to EPIC arrays. 
Please cite this article in your publication. 
