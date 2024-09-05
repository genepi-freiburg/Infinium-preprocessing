
###############################################################
#     Goal: Create annotation file for both EPIC V1 and V2    #
###############################################################

# Now we use Infinium MethylationEPIC v1.0 B5 Manifest File. Apparently in build 38 



setwd("/data/programs/pipelines/CPACOR-EPIC_pipeline")
#STEP 1. Read annotation files 
e1 <- read.csv("annotation_files/Methylation_EPICv1/infinium-methylationepic-v-1-0-b5-manifest-file.csv", as.is=TRUE, skip = 7); dim(e1) #866554     52
e2 <- read.csv("annotation_files/MethylationEPIC_v2.0_Files/EPIC-8v2-0_A1.csv",as.is=TRUE, skip = 7); dim(e2) #937691     49

#Change colname e1
colnames(e1)[colnames(e1)=="CHR"]<-"CHR_37"
colnames(e1)[colnames(e1)=="CHR_hg38"]<-"CHR"
used_columns <- c("IlmnID",'Name', "AddressA_ID", 'Infinium_Design_Type','Color_Channel', 'CHR')
 
#STEP 2. Work with controls
#A. Extract controls probes
c1 <- e1[which(e1$IlmnID%in%"[Controls]")+1:nrow(e1),]; dim(c1) #866554     52
c2 <- e2[which(e2$IlmnID%in%"[Controls]")+1:nrow(e2),];dim(c2) #937691  

apply(c1,1,function(x){all(is.na(x))}) -> idx; table(idx) # FALSE=635 (Controls); TRUE=865919
c1 <- c1[!idx, ]; dim(c1) #635   48 --> Controls

apply(c2,1,function(x){all(is.na(x))}) -> idx; table(idx) # FALSE=635 (Controls); TRUE=937056
c2 <- c2[!idx, ];dim(c2) #635  49 ---> 635 Controls

#B. Check differences
dim(c1[!duplicated(c1),]) # 635  48 --> not duplicated
dim(c2[!duplicated(c2),]) # 635  49 --> not duplicated
ctr_col<-c("IlmnID", "Name", "AddressA_ID", "AlleleA_ProbeSeq")
c1.c<-c1[, ctr_col]; dim(c1.c)
c2.c<-c2[, ctr_col]; dim(c2.c)
identical(`rownames<-`(c1.c, NULL), `rownames<-`(c2.c, NULL)) #Same controls

#C. Merge controls
c1<-c1[order(c1$Name), used_columns]; dim(c1) #635  6
c2<-c2[order(c2$Name), used_columns]; dim(c2) #635  6
colnames(c1)<-ifelse(colnames(c1) == "Name", colnames(c1), paste0(colnames(c1), "_EPICv1"))
colnames(c2)<-ifelse(colnames(c2) == "Name", colnames(c2), paste0(colnames(c2), "_EPICv2"))

if (!all(c1$Name == c2$Name)) {
  stop("Not sorted")
}

cb <- cbind(c1, c2[ , -which(names(c2) == "Name")]); dim(cb) #635 11
cb$EPIC_version<-"v1_v2"; dim(cb) #635  12

#STEP 3. Create separation line as the original annotation file
s <- cb[1:2,]
s[1,"IlmnID_EPICv1"] <- "[Controls]"
s[1,2:ncol(s)] <- NA; dim(s) #2 12


#STEP 4. Work with Probes
#Types of probes:
#------------------------------------------------------
#   1) Name" match but not "IlmnID" --> Repeated in EPICv2 by adding a sufix --> TO DISCUSS
#   2) "IlmnID" and "Name"  match among EPIC versions
#   3) Those EPIC version specific --> We will treat them 
#------------------------------------------------------------
#A. Extract Probes
p1 <- e1[1:which(e1$IlmnID%in%"[Controls]")-1,]; dim(p1) #865918     52
p2 <- e2[1:which(e2$IlmnID%in%"[Controls]")-1,]; dim(p2) #937055     49

# Align chromosome notation 
p1$CHR <- gsub("chr","",p1$CHR)
p2$CHR <- gsub("chr","",p2$CHR)

# pb <- merge(p1,p2,all = TRUE, by = setdiff(intersect(colnames(p1),colnames(p2)),"IlmnID"), suffixes = c(".EPICv1",".EPICv2"))
# sum(duplicated(pb$Name))
# pb0 <- merge(p1,p2,all = TRUE, by = c("Name"), suffixes = c(".EPICv1",".EPICv2"))
# this is what we use in the pipeline: anno[,c('Infinium_Design_Type','Color_Channel', 'CHR', 'MAPINFO', 'Name')]

p1 <- p1[,used_columns]; dim(p1 )#865918      6
p2 <- p2[,used_columns]; dim(p2) #937055      6

#B. Check duplicated 
sum(duplicated(p1$Name)) #No duplicated as expected
sum(duplicated(p2$Name)) #6397 probes are duplicated (we expected it)
length(table(p2$Name)[table(p2$Name) >= 2]) #5225 --> problematic probes to study

#C. Extract probes types:
#Type 1: (PROBLEMATIC) "Name" match but not "IlmnID" --> 5225 problematic EPICv2- specific
name_counts <- table(p2$Name)
type1_pb <- names(name_counts[name_counts >= 2]); length(type1_pb) #5225

#Type 2: in common between both EPIC versions (not problematic probes)
# Remove problematic probes type 1
p1_tp2<- p1[!p1$Name %in%type1_pb, ]; dim(p1_tp2) #  862284  6 (removed: 3634)
p2_tp2<-  p2[!p2$Name %in%type1_pb, ]; dim(p2_tp2) #925433      7 (removed:11622)
pb_2<-merge(p1_tp2,p2_tp2, by=c('Name'), suffixes = c("_EPICv1", "_EPICv2")); dim(pb_2) #718168     12
sum(duplicated(pb_2$Name)) # 0  Perfect
pb_2$EPIC_version<-"v1_v2" #both version
# No coincidence in all fields
# pb_t1_type<-merge(p2,p1, by=c('Name', 'Infinium_Design_Type')); dim(pb_t1_type) #726515
# pb_t1_type_color<-merge(p2,p1, by=c('Name', 'Infinium_Design_Type','Color_Channel')); dim(pb_t1_type_color) #726499
# pb_t1_type_color_chr<-merge(p2,p1, by=c('Name', 'Infinium_Design_Type','Color_Channel', 'CHR')); dim(pb_t1_type_color_chr) #726026
# pb_t1_type_color_chr_addressA<-merge(p2,p1, by=c('Name', 'Infinium_Design_Type','Color_Channel', 'CHR', "AddressA_ID")); dim(pb_t1_type_color_chr_addressA) #726026

#Type 3: EPIC-version specific
p1_tp3<- p1[!p1$Name %in% pb_2$Name, ]; dim(p1_tp3) #  147750  6  (147750+862284 = dim(p1)[1]=865918)
p2_tp3<- p2[!p2$Name %in% pb_2$Name, ]; dim(p2_tp3) #  218887  6  (218887+937055 = dim(p2)[1]=937055)
#Contains the 5225 problematic but we treat as EPIC version specific as we can see below: (comment lines)
colnames(p1_tp3) <-  ifelse(colnames(p1_tp3) == "Name", colnames(p1_tp3), paste0(colnames(p1_tp3), "_EPICv1"))
colnames(p2_tp3) <- ifelse(colnames(p2_tp3) == "Name", colnames(p2_tp3), paste0(colnames(p2_tp3), "_EPICv2"))
p1_tp3$EPIC_version<-"v1"
p2_tp3$EPIC_version<-"v2"

#D. Merge probes:
pb<-pb_2
for(col in setdiff(colnames(pb), colnames(p1_tp3))) {
  p1_tp3[[col]] <- NA
}

for(col in setdiff(colnames(pb), colnames(p2_tp3))) {
  p2_tp3[[col]] <- NA
}

dim(p1_tp3); dim(p2_tp3) #147750   12; 218887    12

# Rbind EPIC-version specif probes
pb <- rbind(pb, p1_tp3[, colnames(pb), drop=FALSE]); dim(pb)  # 865918     12 same as dim(p1)
pb <- rbind(pb, p2_tp3[, colnames(pb), drop=FALSE]); dim(pb)  # 1084805   12   
pb<-pb[, colnames(cb)]

# d <- duplicated(pb)
# sum(d) #6296
# pb <- pb[!d,] #1075312       4
# 
# dim(cb) #15  4
# dim(s) #2 4
# dim(pb) #1075312       4

#STEP 5. Merge pb, cb and s
eb <- rbind(rbind(pb[,colnames(s), drop=FALSE],s[1,]),cb); dim(eb) #1085441       4
nrow(pb) + nrow(s) + nrow(cb) - 1 #1085441 perfect

# add lines to skip, colnames are a line
hea <- matrix(nrow = 8, ncol = ncol(eb))
hea[,2] <- as.character(1:8)
hea[,1] <- "skip_line"
hea[8,] <- colnames(eb)
hea <- as.data.frame(hea)
colnames(hea) <- colnames(eb)

fin <- rbind(hea, eb)

write.table(fin, file = "/dsk/data1/programs/pipelines/CPACOR-EPIC_pipeline/annotation_files/Methylation_EPICv1_EPICv2/merged_annotationfile_EPICv1v2_for_CPACOR_20240905.csv", col.names = FALSE, quote = FALSE, row.names = FALSE, sep = ",")
