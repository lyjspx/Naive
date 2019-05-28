setwd("/Users/desert/Google Drive/Alignment_Project/Breeding_population")

setwd("C:/Users/liu.yuan/Google Drive/Alignment_Project/Breeding_population")

list.files()
control = read.table("control_GY.txt", header = TRUE,sep = "\t")
control_marker = control$Marker

low = read.table("low_GY.txt", header = TRUE, sep = "\t")
low_marker = low$Marker

high = read.table("high_GY.txt", header = TRUE, sep = "\t")
high_marker = high$Marker

###dataset is too large, intersection require 300GB MEM

control_low = 0
for(i in 1:58860){
  if(control_marker[i] %in% low_marker){
    control_low = control_low + 1
  }
} #28022


control_high = 0
for(i in 1:length(control_marker)){
  if(control_marker[i] %in% high_marker){
    control_high = control_high + 1
  }
} #32419

low_high = 0
for(i in 1:length(low_marker)){
  if(low_marker[i] %in% high_marker){
    low_high = low_high + 1
  }
} #33710

control_low_high = 0
for(i in 1:length(control_marker)){
  if(control_marker[i] %in% high_marker && control_marker[i] %in% low_marker){
    control_low_high = control_low_high + 1
  }
} #23676


#NA50
draw.triple.venn(area1 = 58860, area2 = 118971, area3 = 371990, 
                 n12 = 28022,n23 = 33710, n13 = 32419,n123 = 23676,
                 category = c("Default", "Scatter", "Cluster"))

#NA50
draw.triple.venn(area1 = 17676, area2 = 37922, area3 = 193406, 
                 n12 = 7378,n23 = 11666, n13 = 9393,n123 = 6434,
                 category = c("Default", "Scatter", "Cluster"),scaled = TRUE)

