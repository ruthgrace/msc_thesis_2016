# run from exponent unifrac repo: /Users/dphamnyghonca/Desktop/gloor/exponentUnifrac

MyMeta<- read.table("data/nash_data/metadata.txt", header=T, sep="\t", row.names=1, comment.char="", check.names=FALSE)

otu.tab <- read.table("data/nash_data/summed_data_gg.txt", header=T, sep="\t", row.names=1, comment.char="", check.names=FALSE)
otu.tab <- t(otu.tab)
metadata <- MyMeta[grepl("a$",rownames(MyMeta)),]
rownames(metadata) <- gsub("a$","",rownames(metadata))

groups <- metadata$SSvsNASH[match(rownames(otu.tab),rownames(metadata))]

print(paste(length(which(is.na(groups))),"healthy subjects"))

print(paste(length(which(groups==0)),"subjects with SS"))

print(paste(length(which(groups==1)),"subjects with NASH"))
