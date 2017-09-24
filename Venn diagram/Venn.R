setwd("/Users/desert/Google Drive/Alignment_Project/Breeding_population")
list.files()
control = read.table("control_GY.txt", header = TRUE,sep = "\t")
control_marker = control$Marker

low = read.table("low_GY.txt", header = TRUE, sep = "\t")
low_marker = low$Marker

high = read.table("high_GY.txt", header = TRUE, sep = "\t")
high_marker = high$Marker

control_low = c(low_marker,control_marker)

overlap = calculate.overlap(x = list("control" = low_marker, "low" = low_marker, "high" = high_marker))
draw.triple.venn(overlap)

interaction(control_marker,low_marker)