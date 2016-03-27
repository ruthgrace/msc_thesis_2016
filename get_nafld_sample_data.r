# run using metadoot.tsv table in gloor folder
d <- read.table("metadoot.tsv",sep="\t",quote="",row.names=1,header=TRUE)
d <- d[which(d$stage == "baseline"),]
d <- d[which(d$exclude.for.IM == 1),]

summary(d$BMI[which(d$HealthyVsNASH == "Healthy")])
  #  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  # 19.50   23.65   26.21   26.03   28.64   35.27 
summary(d$BMI[which(d$HealthyVsNASH == "NASH")])
  #  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  # 24.17   29.72   32.06   32.46   34.09   49.53 
summary(d$BMI[which(is.na(d$HealthyVsNASH))])
  #  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  # 23.54   25.08   27.25   29.03   31.20   44.19 

metagenomic_samples <- c("CL_119", "CL_139", "CL_141", "CL_144", "CL_160", "CL_165", "CL_166", "CL_169", "CL_173", "CL_177", "HLD_100", "HLD_102", "HLD_111", "HLD_112", "HLD_23", "HLD_28", "HLD_47", "HLD_72", "HLD_80", "HLD_85")

metagenomic_samples <- sub("_","-",metagenomic_samples)

library(stringr)

metadata.samples <- str_extract(rownames(d),"[A-Z]+-[0-9]+")

metagenomic.metadata <- d[which(metadata.samples %in% metagenomic_samples),]

as.character(metagenomic.metadata$exclusion_possible)
 # [1] "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 
as.character(metagenomic.metadata$exclusion.criteria)
 # [1] "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
 
 summary(d$age[which(d$HealthyVsNASH == "Healthy")])
  #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #  21.00   31.00   36.00   37.24   41.00   58.00 
 summary(d$age[which(d$HealthyVsNASH == "NASH")])
  #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #  29.00   42.75   46.50   48.12   52.50   68.00 
 summary(d$age[which(is.na(d$HealthyVsNASH))])
  #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #  33.00   44.50   49.00   47.43   51.75   61.00 
   
otu.tab <- read.table("exponentUnifrac/data/nash_data/summed_data_gg.txt", header=T, sep="\t", row.names=1, comment.char="", check.names=FALSE)
otu.tab <- t(otu.tab)

otu.tab.d <- rownames(d)
otu.tab.d <- gsub("\\(","-",otu.tab.d)
otu.tab.d[which(otu.tab.d == "CL-151-BL-2")] <- "CL-151-BL-R2"
otu.tab.d[which(otu.tab.d == "CL-141-BL-2")] <- "CL-141-BL-R2"
otu.tab.d[which(otu.tab.d == "CL-166-BL-2")] <- "CL-166-BL"

otu.tab.original <- otu.tab
otu.tab <- otu.tab[which(rownames(otu.tab) %in% otu.tab.d),]

print(paste(length(which(d$HealthyVsNASH=="Healthy")),"healthy subjects"))

print(paste(length(which(is.na(d$HealthyVsNASH))),"subjects with SS"))

print(paste(length(which(d$HealthyVsNASH=="NASH")),"subjects with NASH"))

print(paste(sum(otu.tab),"annotated reads"))

print(paste(ncol(otu.tab),"OTUs"))

