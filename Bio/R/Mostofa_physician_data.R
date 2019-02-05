rawData=read.csv("provider data.csv",header = T,stringsAsFactors = F)
rawData[1:5,1:5]

rawData$zipFirst3=substr(rawData$Physician_Profile_Zipcode,1,3)
rawData$Physician_Profile_Primary_Specialty[1:5]
rawData$splitedSpeciality=strsplit(rawData$Physician_Profile_Primary_Specialty,split = "[&|]",fixed = F)
rawData$splitedSpeciality[1:5]

library("plyr")
count(unlist(rawData[which(rawData$zipFirst3=="999"),]$splitedSpeciality))

allZones=unique(rawData$zipFirst3)

result=c()
for(zone in allZones[allZones!="519"]){ #zip 519 has no speciality
  oneZoneData=count(unlist(rawData[which(rawData$zipFirst3==zone),]$splitedSpeciality))
  oneZoneData$area=zone
  result=rbind(result,oneZoneData)
}

write.table(result,file = "specialities by zip.txt",sep = "\t",quote = F,row.names = F)


result=read.table(file = "specialities by zip.txt",header = T,sep = "\t",stringsAsFactors = F)
result[1:5,]
length(unique(result$x))
LETTERS702 <- c(LETTERS, sapply(LETTERS, function(x) paste0(x, LETTERS)))
specialityPool=cbind(seq(1,249),unique(result$x),LETTERS702[1:249])
specialityPool[1:5,]
row.names(specialityPool)=specialityPool[,2]
result$specialityNum=specialityPool[result$x,1]
result$specialityLetter=specialityPool[result$x,3]
result[1:5,]

resultNoNA=result[1:80797,] #Records without zip information will be discarded

areasInResult=unique(resultNoNA$area)
IdInsideArea=c()
for(oneArea in areasInResult){
  IdInsideArea=c(IdInsideArea,seq(1,length(result[which(resultNoNA$area==oneArea),5])))
}
resultNoNA$IdInsideThisArea=IdInsideArea

write.table(resultNoNA,file = "specialities by zip with ID information.txt",sep = "\t",quote = F,row.names = F)

