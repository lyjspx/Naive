
setwd("/Users/desert/Desktop")
original = read.table(file = "a.txt",header = TRUE,sep = "\t")
original_marker = original[,c(1,12:382)]

current_NA = c()

for(i in 1:3337){
  current_NA[i] = sum(original_marker[i,] == "N")
}

expected_NA = rnorm(n = 3337, mean = 12.5, sd = 1.9)
mean(expected_NA)
max(expected_NA)
min(expected_NA)

expected_NA = (expected_NA/100)*371

expected_NA[1:10]

expected_NA = round(expected_NA,0)

expected_NA[1:10]

Number_N_need_assign = expected_NA - current_NA

for(i in 1:3337){
  for(j in 1:Number_N_need_assign[i]){
    
    index = sample(2:372,1)
    
    while(original_marker[i,index] == "N"){
      index = sample(2:372,1)
    }
    
    original_marker[i,index] = "N"
    
  }
}

After_NA = c()

for(i in 1:3337){
  After_NA[i] = sum(original_marker[i,] == "N")
}

mean(After_NA)/371



