
setwd("/Users/desert/Desktop")
original = read.table(file = "a.txt",header = TRUE,sep = "\t")
original_marker = original[,c(1,12:382)]

current_NA = c()

for(i in 1:3337){
  current_NA[i] = sum(original_marker[i,] == "N")
}


#create expected missing data distribution
expected_NA = rnorm(n = 3337, mean = 58, sd = 3.5) #Apply different mean and sd at different missing percent
mean(expected_NA)
max(expected_NA)
min(expected_NA)

expected_NA = (expected_NA/100)*371
expected_NA[1:10]

#round number of expected missing to integer 
expected_NA = round(expected_NA,0)

expected_NA[1:10]

#calculate how many missing need to be assigned
Number_N_need_assign = expected_NA - current_NA


for(i in 1:3337){
  for(j in 1:Number_N_need_assign[i]){
    
    index = sample(2:372,1) #generate random index and assign missing to the index
    
    while(original_marker[i,index] == "N"){
      
      index = sample(2:372,1)
      
    }
    
    original_marker[i,index] = "N"
    
  }
}

After_NA = c()

#calcuate number of current missing 
for(i in 1:3337){
  After_NA[i] = sum(original_marker[i,] == "N")
}

mean(After_NA)/371
max(After_NA)/371

write.table(original_marker,"70percent_missing.txt",quote = F,sep = "\t",row.names = F)

###plot missing 
twenty_missing = read.table("20percent_missing.txt", sep = "\t",header = T)
current_NA = c()
for(i in 1:3337){
  current_NA[i] = sum(twenty_missing[i,] == "N")
}
plot(current_NA/371,xlab = "Marker",ylab = "Percent of missing",main = "20 percent missing dataset")


fifty_missing = read.table("50percent_missing.txt", sep = "\t",header = T)
current_NA = c()
for(i in 1:3337){
  current_NA[i] = sum(fifty_missing[i,] == "N")
}
plot(current_NA/371,xlab = "Marker",ylab = "Percent of missing",main = "50 percent missing dataset")


seventy_missing = read.table("70percent_missing.txt", sep = "\t",header = T)
current_NA = c()
for(i in 1:3337){
  current_NA[i] = sum(seventy_missing[i,] == "N")
}
plot(current_NA/371,xlab = "Marker",ylab = "Percent of missing",main = "70 percent missing dataset")


