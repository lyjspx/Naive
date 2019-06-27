#A practice of RNA-seq experiment
#Downloaded raw RNA sequences from NCBI and mapped to reference in Linux server
#Here begin to analysze count data in R
#The original paper: RNA-Seq Analysis of Rice Roots Reveals the Involvement of Post-Transcriptional Regulation in Response to Cadmium Stress
#Fei He et al.,(2015) Frontiers in Plant Sciences.


###count files from three samples were merged into one file in Excel

####read data
count_matrix = read.csv("raw_count.csv",header = T,stringsAsFactors = F)
row.names(count_matrix) = count_matrix$X
count_matrix = count_matrix[,2:4]

###create DeSeq instance and set three conditions
library("DESeq", lib.loc="~/R/win-library/3.4")
condition = factor(c("control", "cd10", "cd100"))
cds = newCountDataSet(countData = count_matrix, conditions = condition)

###estimate size facotr to make counts from different treatments comparable
###Normalized count was derive from each column of counts devided by size factor 
cds = estimateSizeFactors(cds)
sizeFactors(cds)
head(counts(cds, normalized = T))

####Esitmate dispersion
cds = estimateDispersions(cds, method = 'blind', sharingMode = "fit-only")
plotDispEsts(cds)

###Calling differential expression between control and Cd 10 uM treatment
res_con_10 = nbinomTest(cds,"control","cd10")

str(res_con_10)

head(res_con_10)

plotMA(res_con_10)

hist(res_con_10$log2FoldChange)

res_con_10_sig = res_con_10[!is.na(res_con_10$foldChange),]

res_con_10_sig = res_con_10_sig[res_con_10_sig$padj < 0.05,]

res_con_10_sig = res_con_10_sig[abs(res_con_10_sig$log2FoldChange) > 1,]

res_con_10_sig_up = res_con_10_sig[res_con_10_sig$log2FoldChange > 1,]

res_con_10_sig_down = res_con_10_sig[res_con_10_sig$log2FoldChange < -1,]


###Calling differential expression between control and Cd 10 uM treatment
res_con_100 = nbinomTest(cds,"control","cd100")

head(res_con_100)

plotMA(res_con_100)

hist(res_con_100$log2FoldChange)

res_con_100_sig = res_con_100[!is.na(res_con_100$foldChange),]

res_con_100_sig = res_con_100_sig[res_con_100_sig$padj < 0.05,]

res_con_100_sig = res_con_100_sig[abs(res_con_100_sig$log2FoldChange) > 1,]

res_con_100_sig_up = res_con_100_sig[res_con_100_sig$log2FoldChange > 1,]

res_con_100_sig_down = res_con_100_sig[res_con_100_sig$log2FoldChange < -1,]

####Genes differentially expressed in both comparisions and visualization by Venn diagram
DDE_intersection = intersect(res_con_10_sig$id,res_con_100_sig$id)

up_intersection = intersect(res_con_10_sig_up$id, res_con_100_sig_up$id)

down_intersection = intersect(res_con_10_sig_down$id, res_con_100_sig_down$id)

draw.quad.venn(length(res_con_10_sig_up$id),length(res_con_10_sig_down$id),length(res_con_100_sig_up$id), length(res_con_100_sig_down$id),
               n1234 = 0, n12 = 0,n13 = length(up_intersection), n14 = 0,n23 = 0, n34 = 0, n24 = length(down_intersection),
               n123 =0, n124 = 0,n134 = 0,n234 = 0, category = c("Cd 10 uM up", "Cd 10 uM down", "Cd 100 uM up","Cd 100 uM down"))

####Visualizing differentially expressed genes via heatmap
heatmap_mat = counts(cds, normalized = T)
heatmap_mat = heatmap_mat[DDE_intersection,]
heatmap_mat[heatmap_mat == 0] = 1

heatmap_mat = log2(heatmap_mat)
heatmap_mat_standardized = scale(heatmap_mat)
pheatmap(heatmap_mat_standardized)
