getwd()
setwd("C:/Users/liu.yuan/OneDrive - North Dakota University System/Research/Spring Wheat FHB resistance manuscript/Spring_wheat_marker_size_validation")

library("rrBLUP")
phenotype = read.table("C:/Users/liu.yuan/OneDrive - North Dakota University System/Research/Spring Wheat FHB resistance manuscript/4th_June_2019/phenotype_estimated blups of HSEVR across all trials_439.txt",
             row.names = 1, header = T)

genotype=read.csv("genotype_AYT11-16_439GBSna50ABD_Bi_LDKNNimp.F01_meanImp.csv",header = T)

phenotype[1:5,1:2]
genotype[1:5,1:5]

dim(phenotype)
dim(genotype)

individualList=rownames(phenotype)
row.names(genotype)=individualList
genotype=as.matrix(genotype)

##############################################################
#regular GS
predictBreedingValue=function(TPgeno,TPpheno,VPgeno){
  predictedRidgeRegression=mixed.solve(TPpheno,Z=TPgeno)
  predictedValue=VPgeno%*%predictedRidgeRegression$u
  return(predictedValue)
}



testPopulation="16" #define which year as testing population
testing=individualList[grep(pattern = "^16-",individualList)]
training=individualList[-grep(pattern = "^16-",individualList)]
phenoColumn = 4 #4:blue4  8:blup4 

predicted=predictBreedingValue(genotype[training,],phenotype[training,phenoColumn],genotype[testing,])#test with all markers
correlation=cor(predicted,phenotype[testing,phenoColumn])
correlation


#################################################################
#define fixed effects
markersAsFixedFactor=c(which(colnames(genotype)=="S1A_471476097"),which(colnames(genotype)=="S6B_474184564"))

#GS with markers as fixed effect
predictBreedingValue=function(TPgeno,TPpheno,VPgeno){
  predictedRidgeRegression=mixed.solve(TPpheno,Z=TPgeno[,-markersAsFixedFactor],X=TPgeno[,markersAsFixedFactor])
  predictedValue=VPgeno[,-markersAsFixedFactor]%*%predictedRidgeRegression$u
  return(predictedValue)
}

testPopulation="16"
testing=individualList[grep(pattern = "^16-",individualList)]
training=individualList[-grep(pattern = "^16-",individualList)]
phenoColumn = 4 #4:blue4  8:blup4 

predicted=predictBreedingValue(genotype[training,],phenotype[training,phenoColumn],genotype[testing,])#test with all markers
correlation=cor(predicted,phenotype[testing,phenoColumn])
correlation


