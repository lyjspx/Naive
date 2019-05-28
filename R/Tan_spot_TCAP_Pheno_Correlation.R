setwd("/Users/desert/OneDrive - North Dakota University System/Research/TCAP ND12")
allFile=list.files()
allFile
pheno=read.table(allFile[1],header = T,stringsAsFactors = F,na.strings = "NA")
pheno=pheno[complete.cases(pheno[,5]),]
pheno[1:4,]
cor.test(pheno[,2],pheno[,3])
cor.test(pheno[,2],pheno[,4])
cor.test(pheno[,2],pheno[,5])
cor.test(pheno[,3],pheno[,4])
cor.test(pheno[,3],pheno[,5])
cor.test(pheno[,4],pheno[,5])
library(psych)
pairs.panels(pheno[,2:5],
             method="pearson",
             hist.col="#00AF88",
             density=TRUE,
             ellipses=TRUE)

statisticsFile=read.table(allFile[5],header = T,stringsAsFactors = T)
levels(statisticsFile$Trait)
p.adjust(statisticsFile[statisticsFile$Trait=="meanChl123",]$p,method="fdr")
traits=levels(statisticsFile$Trait)
pvalueContainer=statisticsFile[statisticsFile$Trait=="meanChl123",][,2:4]
for(i in 1:length(traits)){
  pvalueContainer=cbind.data.frame(pvalueContainer,p.adjust(statisticsFile[statisticsFile$Trait==traits[i],]$p,method="fdr"))
}
colnames(pvalueContainer)=c("SNP","CHR","BP",traits)
pvalueContainer[1:2,]
write.csv(pvalueContainer,file = "qvalue.table.csv",quote = F)

library(qqman)

colNumber=10
test=pvalueContainer[complete.cases(pvalueContainer[,colNumber]),][,c(1:3,colNumber)]
traitInPlot=colnames(test)[4]
colnames(test)=c("SNP","CHR","BP","P")
test=transform(test,CHR = as.numeric(as.character(factor(CHR, 
                                                           levels = c("1A", "1B", "2A", "2B", "3A", "3B", "4A", "4B", "5A", "5B", "6A", "6B", "7A", "7B"),
                                                           labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)))))
tiff(filename=paste(traitInPlot,".tiff",sep = ""),width=16, height=8,units='in',res=300)
manhattan(test, main=traitInPlot, cex=0.8, suggestiveline=F, genomewideline = F, col = c("blue4", "orange3"), ylab=expression(-log[10](italic(FDR))))
dev.off()
# > traits
# [1] "meanChl123"    "meanChl1234"   "meanChl124"    "meanChl134"    "meanChl234"    "meanNecro123"  "meanNecro1234"
# [8] "meanNecro124"  "meanNecro134"  "meanNecro234"  "ND12Rep1Chl"   "ND12Rep1Necro" "ND12Rep2Chl"   "ND12Rep2Necro"
# [15] "ND12Rep3Chl"   "ND12Rep3Necro" "ND12Rep4Chl"   "ND12Rep4Necro"



