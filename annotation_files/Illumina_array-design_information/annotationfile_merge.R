setwd("/data/programs/pipelines/CPACOR-EPIC_pipeline")

e2 <- read.csv("MethylationEPIC_v2.0_Files/EPIC-8v2-0_A1.csv",as.is=TRUE, skip = 7)
e1 <- read.csv("annotationfileB4_2017-09-15.csv", as.is=TRUE, skip = 7)

which(e2$IlmnID%in%"[Controls]")
which(e1$IlmnID%in%"[Controls]")


# used_columns <- c('Infinium_Design_Type','Color_Channel', 'CHR', 'MAPINFO', 'Name')
used_columns <- c('Infinium_Design_Type','Color_Channel', 'CHR', 'Name')

# controls
c1 <- e1[which(e1$IlmnID%in%"[Controls]")+1:nrow(e1),]
c2 <- e2[which(e2$IlmnID%in%"[Controls]")+1:nrow(e2),]

# apply(c1,2,function(x){sum(is.na(x))})
apply(c1,1,function(x){all(is.na(x))}) -> idx
c1 <- c1[!idx,]

# apply(c2,2,function(x){sum(is.na(x))})
apply(c2,1,function(x){all(is.na(x))}) -> idx
c2 <- c2[!idx,]

cb <- merge(c1,c2, all = TRUE)
cb <- cb[,used_columns]
cb <- cb[!duplicated(cb),]

# separation line
s <- cb[1:2,]
s[1,"IlmnID"] <- "[Controls]"
s[1,2:ncol(s)] <- NA
s <- s[,used_columns]


# probes
p1 <- e1[1:which(e1$IlmnID%in%"[Controls]")-1,]
p2 <- e2[1:which(e2$IlmnID%in%"[Controls]")-1,]

# apply(p1,2,function(x){sum(is.na(x))})

# align chromosome notation 
p1$CHR <- gsub("chr","",p1$CHR)
p2$CHR <- gsub("chr","",p2$CHR)

# pb <- merge(p1,p2,all = TRUE, by = setdiff(intersect(colnames(p1),colnames(p2)),"IlmnID"), suffixes = c(".EPICv1",".EPICv2"))
# sum(duplicated(pb$Name))
# pb0 <- merge(p1,p2,all = TRUE, by = c("Name"), suffixes = c(".EPICv1",".EPICv2"))
# this is what we use in the pipeline: anno[,c('Infinium_Design_Type','Color_Channel', 'CHR', 'MAPINFO', 'Name')]

p1 <- p1[,used_columns]
p2 <- p2[,used_columns]
pb <- merge(p1,p2,all = TRUE)


# pb <- pb[!pb$CHR %in% c("0","","M"),]
d <- duplicated(pb)
sum(d)
pb <- pb[!d,]

dim(cb)
dim(s)
dim(pb)

identical(colnames(cb),colnames(s))
identical(colnames(pb),colnames(s))

eb <- rbind(rbind(pb,s[1,]),cb)

nrow(pb) + nrow(s) + nrow(cb) - 1
dim(eb)

# add lines to skip, colnames are a line
hea <- matrix(nrow = 8, ncol = ncol(eb))
hea[,2] <- as.character(1:8)
hea[,1] <- "skip_line"
hea[8,] <- colnames(eb)
hea <- as.data.frame(hea)
colnames(hea) <- colnames(eb)

fin <- rbind(hea, eb)

write.table(fin, file = "merged_annotationfile_EPICv1v2_for_CPACOR.csv", col.names = FALSE, quote = FALSE, row.names = FALSE, sep = ",")
