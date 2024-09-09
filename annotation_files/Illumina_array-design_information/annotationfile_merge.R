
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
colnames(c1)<-ifelse(colnames(c1) %in% c("Name", "Infinium_Design_Type","Color_Channel", "CHR"), 
                     colnames(c1), paste0(colnames(c1), "_EPICv1"))
colnames(c2)<-ifelse(colnames(c2) %in% c("Name", "Infinium_Design_Type","Color_Channel", "CHR"), 
                     colnames(c2), paste0(colnames(c2), "_EPICv2"))

if (!all(c1$Name == c2$Name)) {
  stop("Not sorted")
}

cb <- cbind(c1, c2[ , -which(names(c2) %in% c("Name", "Infinium_Design_Type","Color_Channel", "CHR"))]); dim(cb) #635 8
cb$EPIC_version<-"v1_v2"; dim(cb) #635  9
cb$Type<-"Control"; dim(cb) ##635  10

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
p1_tp1<- p1[p1$Name %in% type1_pb,]; dim(p1_tp1) #3634
p2_tp1<-p2[p2$Name %in% type1_pb,]; dim(p2_tp1) #11622

#Check if same attributes
db_type1_pb<-merge(p1[p1$Name %in% type1_pb,], p2[p2$Name %in% type1_pb,], 
      by = c("Name", "Infinium_Design_Type", "Color_Channel", "CHR"),
      all = FALSE); dim(db_type1_pb) #8269  8

type1_pb<- names(table(db_type1_pb$Name)[ table(db_type1_pb$Name) >= 2]); length(type1_pb) #3549 
pb_match<-db_type1_pb$Name[!db_type1_pb$Name %in% type1_pb]; length(pb_match)  # 56  v1=v2

all_type1_pb <- merge(p1_tp1, p2_tp1, 
                  by = c("Name", "Infinium_Design_Type", "Color_Channel", "CHR"),
                  all = TRUE); dim(all_type1_pb)  #11651     8
unmerged_data <- all_type1_pb[is.na(all_type1_pb$IlmnID.x) | is.na(all_type1_pb$IlmnID.y), ]; dim(unmerged_data) #3382
pb_v2_specific<-unmerged_data$Name[!unmerged_data$Name%in% pb_match]; length(pb_v2_specific)  #3324   unique 1641  --> EPIC-v2 specific
type1_pb<-type1_pb[!type1_pb%in%pb_v2_specific]; length(type1_pb) #3528

problematic<-c(type1_pb, unique(pb_v2_specific), pb_match); length(problematic)  #5225

#Type 2: in common between both EPIC versions (not problematic probes)
# Remove problematic probes type 1
p1_tp2<- p1[!p1$Name %in%problematic, ]; dim(p1_tp2) #  862284  6 
p2_tp2<-  p2[!p2$Name %in%problematic, ]; dim(p2_tp2) #925433      7 

pb_2<-merge(p1_tp2,p2_tp2,
            by=c("Name", "Infinium_Design_Type", "Color_Channel", "CHR"), 
            suffixes = c("_EPICv1", "_EPICv2")); dim(pb_2) #717812     12
sum(duplicated(pb_2$Name)) # 0  Perfect
pb_2$EPIC_version<-"v1_v2" #both version

# Include pb_match vector
p1_tp1_match<-p1[p1$Name %in% pb_match, ]; dim(p1_tp1_match) # 56
p2_tp1_match<-p2[p2$Name %in% pb_match, ]; dim(p2_tp1_match) # 114

pt_tp1_match<-merge(p1_tp1_match,p2_tp1_match,
                    by=c("Name", "Infinium_Design_Type", "Color_Channel", "CHR"), 
                    suffixes = c("_EPICv1", "_EPICv2")); dim(pt_tp1_match) # 56
pt_tp1_match$EPIC_version<-"v1_v2" #both version

pb_2<-rbind(pb_2, pt_tp1_match); dim(pb_2) # 717868      9

x<-

#Type 3: EPIC-version specific
p1_tp3<- p1[!p1$Name %in% pb_2$Name, ]; dim(p1_tp3) #  148050  6  
p2_tp3<- p2[!p2$Name %in% pb_2$Name, ]; dim(p2_tp3) #  219129  6  
colnames(p1_tp3) <-  ifelse(colnames(p1_tp3) %in% c("Name", "Infinium_Design_Type","Color_Channel", "CHR"), 
                            colnames(p1_tp3), paste0(colnames(p1_tp3), "_EPICv1"))
colnames(p2_tp3) <- ifelse(colnames(p2_tp3) %in% c("Name", "Infinium_Design_Type","Color_Channel", "CHR"), 
                           colnames(p2_tp3), paste0(colnames(p2_tp3), "_EPICv2"))
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

dim(p1_tp3); dim(p2_tp3) #148050   9; 219129    9

# Rbind EPIC-version specif probes
pb <- rbind(pb, p1_tp3[, colnames(pb), drop=FALSE]); dim(pb)  # 865918     9 same as dim(p1)
pb <- rbind(pb, p2_tp3[, colnames(pb), drop=FALSE]); dim(pb)  # 1085047   9
pb$Type<-"Probe"; dim(pb) #1085047  10

pb<-pb[, colnames(cb)]

# d <- duplicated(pb)
# sum(d) #6296
# pb <- pb[!d,] #1075312       4
# 
# dim(cb) #15  4
# dim(s) #2 4
# dim(pb) #1075312       4

#STEP 5. Merge pb, cb and s
eb <- rbind(rbind(pb[,colnames(s), drop=FALSE],s[1,]),cb); dim(eb) #1085683       10
nrow(pb) + nrow(s) + nrow(cb) - 1 #1085683 perfect

# add lines to skip, colnames are a line
hea <- matrix(nrow = 8, ncol = ncol(eb))
hea[,2] <- as.character(1:8)
hea[,1] <- "skip_line"
hea[8,] <- colnames(eb)
hea <- as.data.frame(hea)
colnames(hea) <- colnames(eb)

fin <- rbind(hea, eb)

write.table(fin, file = "/dsk/data1/programs/pipelines/CPACOR-EPIC_pipeline/annotation_files/Methylation_EPICv1_EPICv2/merged_annotationfile_EPICv1v2_for_CPACOR_20240908.csv", col.names = FALSE, quote = FALSE, row.names = FALSE, sep = ",")
