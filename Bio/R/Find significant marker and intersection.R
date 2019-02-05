setwd("/Users/desert/Google Drive/Alignment_Project/Breeding_population")

list.files()

#####GY
control_GY = read.table("control_GY.txt_fdr.txt",sep = "\t",header = TRUE)
control_GY_sig = subset(control_GY,p < 0.01)
control_GY_sig_sorted = control_GY_sig[order(control_GY_sig$p),]

low_GY = read.table("low_GY.txt_fdr.txt",sep = "\t",header = TRUE)
low_GY_sig = subset(low_GY,p < 0.01)
low_GY_sig_sorted = low_GY_sig[order(low_GY_sig$p),]


high_GY = read.table("high_GY.txt_fdr.txt",sep = "\t",header = TRUE)
high_GY_sig = subset(high_GY,p < 0.01)
high_GY_sig_sorted = high_GY_sig[order(high_GY_sig$p),]


GY_intersection = intersect(intersect(control_GY_sig_sorted$Marker, high_GY_sig_sorted$Marker), low_GY_sig_sorted$Marker)

###SC

control_SC = read.table("control_SC.txt_fdr.txt",sep = "\t",header = TRUE)
control_SC_sig = subset(control_SC,p < 0.01)
control_SC_sig_sorted = control_SC_sig[order(control_SC_sig$p),]

low_SC = read.table("low_SC.txt_fdr.txt",sep = "\t",header = TRUE)
low_SC_sig = subset(low_SC,p < 0.01)
low_SC_sig_sorted = low_SC_sig[order(low_SC_sig$p),]


high_SC = read.table("high_SC.txt_fdr.txt",sep = "\t",header = TRUE)
high_SC_sig = subset(high_SC,p < 0.01)
high_SC_sig_sorted = high_SC_sig[order(high_SC_sig$p),]


SC_intersection = intersect(intersect(control_SC_sig_sorted$Marker, high_SC_sig_sorted$Marker), low_SC_sig_sorted$Marker)

#####SE
control_SE = read.table("control_SE.txt_fdr.txt",sep = "\t",header = TRUE)
control_SE_sig = subset(control_SE,p < 0.01)
control_SE_sig_sorted = control_SE_sig[order(control_SE_sig$p),]

low_SE = read.table("low_SE.txt_fdr.txt",sep = "\t",header = TRUE)
low_SE_sig = subset(low_SE,p < 0.01)
low_SE_sig_sorted = low_SE_sig[order(low_SE_sig$p),]


high_SE = read.table("high_SE.txt_fdr.txt",sep = "\t",header = TRUE)
high_SE_sig = subset(high_SE,p < 0.01)
high_SE_sig_sorted = high_SE_sig[order(high_SE_sig$p),]


SE_intersection = intersect(intersect(control_SE_sig_sorted$Marker, high_SE_sig_sorted$Marker), low_SE_sig_sorted$Marker)

####TW
control_TW = read.table("control_TW.txt_fdr.txt",sep = "\t",header = TRUE)
control_TW_sig = subset(control_TW,p < 0.01)
control_TW_sig_sorted = control_TW_sig[order(control_TW_sig$p),]

low_TW = read.table("low_TW.txt_fdr.txt",sep = "\t",header = TRUE)
low_TW_sig = subset(low_TW,p < 0.01)
low_TW_sig_sorted = low_TW_sig[order(low_TW_sig$p),]


high_TW = read.table("high_TW.txt_fdr.txt",sep = "\t",header = TRUE)
high_TW_sig = subset(high_TW,p < 0.01)
high_TW_sig_sorted = high_TW_sig[order(high_TW_sig$p),]


TW_intersection = intersect(intersect(control_TW_sig_sorted$Marker, high_TW_sig_sorted$Marker), low_TW_sig_sorted$Marker)

###TKW
control_TKW = read.table("control_TKW.txt_fdr.txt",sep = "\t",header = TRUE)
control_TKW_sig = subset(control_TKW,p < 0.01)
control_TKW_sig_sorted = control_TKW_sig[order(control_TKW_sig$p),]

low_TKW = read.table("low_TKW.txt_fdr.txt",sep = "\t",header = TRUE)
low_TKW_sig = subset(low_TKW,p < 0.01)
low_TKW_sig_sorted = low_TKW_sig[order(low_TKW_sig$p),]


high_TKW = read.table("high_TKW.txt_fdr.txt",sep = "\t",header = TRUE)
high_TKW_sig = subset(high_TKW,p < 0.01)
high_TKW_sig_sorted = high_TKW_sig[order(high_TKW_sig$p),]


TKW_intersection = intersect(intersect(control_TKW_sig_sorted$Marker, high_TKW_sig_sorted$Marker), low_TKW_sig_sorted$Marker)

####SedV
control_SedV = read.table("control_SedV.txt_fdr.txt",sep = "\t",header = TRUE)
control_SedV_sig = subset(control_SedV,p < 0.01)
control_SedV_sig_sorted = control_SedV_sig[order(control_SedV_sig$p),]

low_SedV = read.table("low_SedV.txt_fdr.txt",sep = "\t",header = TRUE)
low_SedV_sig = subset(low_SedV,p < 0.01)
low_SedV_sig_sorted = low_SedV_sig[order(low_SedV_sig$p),]


high_SedV = read.table("high_SedV.txt_fdr.txt",sep = "\t",header = TRUE)
high_SedV_sig = subset(high_SedV,p < 0.01)
high_SedV_sig_sorted = high_SedV_sig[order(high_SedV_sig$p),]


SedV_intersection = intersect(intersect(control_SedV_sig_sorted$Marker, high_SedV_sig_sorted$Marker), low_SedV_sig_sorted$Marker)

####SP
control_SP = read.table("control_SP.txt_fdr.txt",sep = "\t",header = TRUE)
control_SP_sig = subset(control_SP,p < 0.01)
control_SP_sig_sorted = control_SP_sig[order(control_SP_sig$p),]

low_SP = read.table("low_SP.txt_fdr.txt",sep = "\t",header = TRUE)
low_SP_sig = subset(low_SP,p < 0.01)
low_SP_sig_sorted = low_SP_sig[order(low_SP_sig$p),]


high_SP = read.table("high_SP.txt_fdr.txt",sep = "\t",header = TRUE)
high_SP_sig = subset(high_SP,p < 0.01)
high_SP_sig_sorted = high_SP_sig[order(high_SP_sig$p),]


SP_intersection = intersect(intersect(control_SP_sig_sorted$Marker, high_SP_sig_sorted$Marker), low_SP_sig_sorted$Marker)

grep("+D+",SP_intersection)

