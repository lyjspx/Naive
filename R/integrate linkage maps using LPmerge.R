## define working directory
#setwd("/Users/xuehui.li/Desktop/XL/research/crops/durum_wheat/p2_Integrated genetic linkage map in tetraploid wheat/linkage map/integrated/durum_consensusMap_GBS-90K-SSR")


getwd()
setwd("Y:/Yuan/durum_consensusMap_GBS-90K-SSR/RawMapFile")

## load RIum linkage map data
RIum=read.delim("RIumNA50_JM_kosambi.txt", header=T)
dim(RIum)
RIum[1:5,]

RIumLG1A=RIum[RIum[,2]=="1A",3:4]
RIumLG1B=RIum[RIum[,2]=="1B",3:4]
RIumLG2A=RIum[RIum[,2]=="2A",3:4]
RIumLG2B=RIum[RIum[,2]=="2B",3:4]
RIumLG3A=RIum[RIum[,2]=="3A",3:4]
RIumLG3B=RIum[RIum[,2]=="3B",3:4]
RIumLG4A=RIum[RIum[,2]=="4A",3:4]
RIumLG4B=RIum[RIum[,2]=="4B",3:4]
RIumLG5A=RIum[RIum[,2]=="5A",3:4]
RIumLG5B=RIum[RIum[,2]=="5B",3:4]
RIumLG6A=RIum[RIum[,2]=="6A",3:4]
RIumLG6B=RIum[RIum[,2]=="6B",3:4]
RIumLG7A=RIum[RIum[,2]=="7A",3:4]
RIumLG7B=RIum[RIum[,2]=="7B",3:4]

## load RP883 linkage map data
RP883=read.delim("RP883NA50_GBS_90K_JM_kosambi.txt", header=T)
dim(RP883)
RP883[1:5,]

RP883LG1A=RP883[RP883[,2]=="1A",3:4]
RP883LG1B=RP883[RP883[,2]=="1B",3:4]
RP883LG2A=RP883[RP883[,2]=="2A",3:4]
RP883LG2B=RP883[RP883[,2]=="2B",3:4]
RP883LG3A=RP883[RP883[,2]=="3A",3:4]
RP883LG3B=RP883[RP883[,2]=="3B",3:4]
RP883LG4A=RP883[RP883[,2]=="4A",3:4]
RP883LG4B=RP883[RP883[,2]=="4B",3:4]
RP883LG5A=RP883[RP883[,2]=="5A",3:4]
RP883LG5B=RP883[RP883[,2]=="5B",3:4]
RP883LG6A=RP883[RP883[,2]=="6A",3:4]
RP883LG6B=RP883[RP883[,2]=="6B",3:4]
RP883LG7A=RP883[RP883[,2]=="7A",3:4]
RP883LG7B=RP883[RP883[,2]=="7B",3:4]


## load RP979 linkage map data
RP979=read.delim("RP979NA50_JM_kosambi.txt", header=T)
dim(RP979)
RP979[1:5,]

RP979LG1A=RP979[RP979[,2]=="1A",3:4]
RP979LG1B=RP979[RP979[,2]=="1B",3:4]
RP979LG2A=RP979[RP979[,2]=="2A",3:4]
RP979LG2B=RP979[RP979[,2]=="2B",3:4]
RP979LG3A=RP979[RP979[,2]=="3A",3:4]
RP979LG3B=RP979[RP979[,2]=="3B",3:4]
RP979LG4A=RP979[RP979[,2]=="4A",3:4]
RP979LG4B=RP979[RP979[,2]=="4B",3:4]
RP979LG5A=RP979[RP979[,2]=="5A",3:4]
RP979LG5B=RP979[RP979[,2]=="5B",3:4]
RP979LG6A=RP979[RP979[,2]=="6A",3:4]
RP979LG6B=RP979[RP979[,2]=="6B",3:4]
RP979LG7A=RP979[RP979[,2]=="7A",3:4]
RP979LG7B=RP979[RP979[,2]=="7B",3:4]


## load RP336 linkage map data
RP336=read.delim("RP336NA50_JM_kosambi.txt", header=T)
dim(RP336)
RP336[1:5,]

RP336LG1A=RP336[RP336[,2]=="1A",3:4]
RP336LG1B=RP336[RP336[,2]=="1B",3:4]
RP336LG2A=RP336[RP336[,2]=="2A",3:4]
RP336LG2B=RP336[RP336[,2]=="2B",3:4]
RP336LG3A=RP336[RP336[,2]=="3A",3:4]
RP336LG3B=RP336[RP336[,2]=="3B",3:4]
RP336LG4A=RP336[RP336[,2]=="4A",3:4]
RP336LG4B=RP336[RP336[,2]=="4B",3:4]
RP336LG5A=RP336[RP336[,2]=="5A",3:4]
RP336LG5B=RP336[RP336[,2]=="5B",3:4]
RP336LG6A=RP336[RP336[,2]=="6A",3:4]
RP336LG6B=RP336[RP336[,2]=="6B",3:4]
RP336LG7A=RP336[RP336[,2]=="7A",3:4]
RP336LG7B=RP336[RP336[,2]=="7B",3:4]


## load RP696 linkage map data
RP696=read.delim("RP696NA50_JM_kosambi.txt", header=T)
dim(RP696)
RP696[1:5,]

RP696LG1A=RP696[RP696[,2]=="1A",3:4]
RP696LG1B=RP696[RP696[,2]=="1B",3:4]
RP696LG2A=RP696[RP696[,2]=="2A",3:4]
RP696LG2B1=RP696[RP696[,2]=="2B1",3:4]
RP696LG2B2=RP696[RP696[,2]=="2B2",3:4]
RP696LG3A=RP696[RP696[,2]=="3A",3:4]
RP696LG3B=RP696[RP696[,2]=="3B",3:4]
RP696LG4A=RP696[RP696[,2]=="4A",3:4]
RP696LG4B=RP696[RP696[,2]=="4B",3:4]
RP696LG5A=RP696[RP696[,2]=="5A",3:4]
RP696LG5B=RP696[RP696[,2]=="5B",3:4]
RP696LG6A=RP696[RP696[,2]=="6A",3:4]
RP696LG6B=RP696[RP696[,2]=="6B",3:4]
RP696LG7A=RP696[RP696[,2]=="7A",3:4]
RP696LG7B=RP696[RP696[,2]=="7B",3:4]

## load BP025 linkage map data
BP025=read.delim("BP025_9K_GBS.txt", header=T)
dim(BP025)
BP025[1:5,]

BP025LG1A=BP025[BP025[,2]=="1A",3:4]
BP025LG1B=BP025[BP025[,2]=="1B",3:4]
BP025LG2A=BP025[BP025[,2]=="2A",3:4]
BP025LG2B=BP025[BP025[,2]=="2B",3:4]
BP025LG3A=BP025[BP025[,2]=="3A",3:4]
BP025LG3B=BP025[BP025[,2]=="3B",3:4]
BP025LG4A=BP025[BP025[,2]=="4A",3:4]
BP025LG4B=BP025[BP025[,2]=="4B",3:4]
BP025LG5A=BP025[BP025[,2]=="5A",3:4]
BP025LG5B=BP025[BP025[,2]=="5B",3:4]
BP025LG6A=BP025[BP025[,2]=="6A",3:4]
BP025LG6B=BP025[BP025[,2]=="6B",3:4]
BP025LG7A=BP025[BP025[,2]=="7A",3:4]
BP025LG7B=BP025[BP025[,2]=="7B",3:4]

## load DP527 linkage map data
DP527=read.delim("DP527_GBS_90K.txt", header=T)
dim(DP527)
DP527[1:5,]

DP527LG1A=DP527[DP527[,2]=="1A",3:4]
DP527LG1B=DP527[DP527[,2]=="1B",3:4]
DP527LG2A=DP527[DP527[,2]=="2A",3:4]
DP527LG2B=DP527[DP527[,2]=="2B",3:4]
DP527LG3A=DP527[DP527[,2]=="3A",3:4]
DP527LG3B=DP527[DP527[,2]=="3B",3:4]
DP527LG4A=DP527[DP527[,2]=="4A",3:4]
DP527LG4B=DP527[DP527[,2]=="4B",3:4]
DP527LG5A=DP527[DP527[,2]=="5A",3:4]
DP527LG5B=DP527[DP527[,2]=="5B",3:4]
DP527LG6A=DP527[DP527[,2]=="6A",3:4]
DP527LG6B=DP527[DP527[,2]=="6B",3:4]
DP527LG7A=DP527[DP527[,2]=="7A",3:4]
DP527LG7B=DP527[DP527[,2]=="7B",3:4]

## load LP749 linkage map data
LP749=read.delim("LP749_Dr.Xu.txt", header=T)
dim(LP749)
LP749[1:5,]

LP749LG1A=LP749[LP749[,2]=="1A",3:4]
LP749LG1B=LP749[LP749[,2]=="1B",3:4]
LP749LG2A=LP749[LP749[,2]=="2A",3:4]
LP749LG2B=LP749[LP749[,2]=="2B",3:4]
LP749LG3A=LP749[LP749[,2]=="3A",3:4]
LP749LG3B=LP749[LP749[,2]=="3B",3:4]
LP749LG4A=LP749[LP749[,2]=="4A",3:4]
LP749LG4B=LP749[LP749[,2]=="4B",3:4]
LP749LG5A=LP749[LP749[,2]=="5A",3:4]
LP749LG5B=LP749[LP749[,2]=="5B",3:4]
LP749LG6A=LP749[LP749[,2]=="6A",3:4]
LP749LG6B=LP749[LP749[,2]=="6B",3:4]
LP749LG7A=LP749[LP749[,2]=="7A",3:4]
LP749LG7B=LP749[LP749[,2]=="7B",3:4]

## load Joppa10 linkage map data
Joppa10 = read.delim("Joppa10_GBS_90K_YL_2019.txt",header = T)
dim(Joppa10)
Joppa10[1:5,]

Joppa10LG1A=Joppa10[Joppa10[,2]=="1A",3:4]
Joppa10LG1B=Joppa10[Joppa10[,2]=="1B",3:4]
Joppa10LG2A=Joppa10[Joppa10[,2]=="2A",3:4]
Joppa10LG2B=Joppa10[Joppa10[,2]=="2B",3:4]
Joppa10LG3A=Joppa10[Joppa10[,2]=="3A",3:4]
Joppa10LG3B=Joppa10[Joppa10[,2]=="3B",3:4]
Joppa10LG4A=Joppa10[Joppa10[,2]=="4A",3:4]
Joppa10LG4B=Joppa10[Joppa10[,2]=="4B",3:4]
Joppa10LG5A=Joppa10[Joppa10[,2]=="5A",3:4]
Joppa10LG5B=Joppa10[Joppa10[,2]=="5B",3:4]
Joppa10LG6A=Joppa10[Joppa10[,2]=="6A",3:4]
Joppa10LG6B=Joppa10[Joppa10[,2]=="6B",3:4]
Joppa10LG7A=Joppa10[Joppa10[,2]=="7A",3:4]
Joppa10LG7B=Joppa10[Joppa10[,2]=="7B",3:4]



## load LPenawawa linkage map data
LPenawawa=read.delim("LouisePenawawa_Dr.Liu_AABB.txt", header=T)
dim(LPenawawa)
LPenawawa[1:5,]

LPenawawaLG1A=LPenawawa[LPenawawa[,2]=="1A",3:4]
LPenawawaLG1B=LPenawawa[LPenawawa[,2]=="1B",3:4]
LPenawawaLG2A=LPenawawa[LPenawawa[,2]=="2A",3:4]
LPenawawaLG2B=LPenawawa[LPenawawa[,2]=="2B",3:4]
LPenawawaLG3A=LPenawawa[LPenawawa[,2]=="3A",3:4]
LPenawawaLG3B=LPenawawa[LPenawawa[,2]=="3B",3:4]
LPenawawaLG4A=LPenawawa[LPenawawa[,2]=="4A",3:4]
LPenawawaLG4B=LPenawawa[LPenawawa[,2]=="4B",3:4]
LPenawawaLG5A=LPenawawa[LPenawawa[,2]=="5A",3:4]
LPenawawaLG5B=LPenawawa[LPenawawa[,2]=="5B",3:4]
LPenawawaLG6A=LPenawawa[LPenawawa[,2]=="6A",3:4]
LPenawawaLG6B=LPenawawa[LPenawawa[,2]=="6B",3:4]
LPenawawaLG7A=LPenawawa[LPenawawa[,2]=="7A",3:4]
LPenawawaLG7B=LPenawawa[LPenawawa[,2]=="7B",3:4]
LPenawawaLG1D=LPenawawa[LPenawawa[,2]=="1D",3:4]
LPenawawaLG2D=LPenawawa[LPenawawa[,2]=="2D",3:4]
LPenawawaLG3D=LPenawawa[LPenawawa[,2]=="3D",3:4]
LPenawawaLG4D=LPenawawa[LPenawawa[,2]=="4D",3:4]
LPenawawaLG5D=LPenawawa[LPenawawa[,2]=="5D",3:4]
LPenawawaLG6D=LPenawawa[LPenawawa[,2]=="6D",3:4]
LPenawawaLG7D=LPenawawa[LPenawawa[,2]=="7D",3:4]



##load Langdon Altar linkage map data
LDNAltar=read.delim("LDNAltar.txt",header = T)
dim(LDNAltar)
LDNAltar[1:5,]

LDNAltarLG1A=LDNAltar[LDNAltar[,2]=="1A",3:4]
LDNAltarLG1B=LDNAltar[LDNAltar[,2]=="1B",3:4]
LDNAltarLG2A=LDNAltar[LDNAltar[,2]=="2A",3:4]
LDNAltarLG2B=LDNAltar[LDNAltar[,2]=="2B",3:4]
LDNAltarLG3A=LDNAltar[LDNAltar[,2]=="3A",3:4]
LDNAltarLG3B=LDNAltar[LDNAltar[,2]=="3B",3:4]
LDNAltarLG4A=LDNAltar[LDNAltar[,2]=="4A",3:4]
LDNAltarLG4B=LDNAltar[LDNAltar[,2]=="4B",3:4]
LDNAltarLG5A=LDNAltar[LDNAltar[,2]=="5A",3:4]
LDNAltarLG5B=LDNAltar[LDNAltar[,2]=="5B",3:4]
LDNAltarLG6A=LDNAltar[LDNAltar[,2]=="6A",3:4]
LDNAltarLG6B=LDNAltar[LDNAltar[,2]=="6B",3:4]
LDNAltarLG7A=LDNAltar[LDNAltar[,2]=="7A",3:4]
LDNAltarLG7B=LDNAltar[LDNAltar[,2]=="7B",3:4]

##load TA415260 ND495 linkage map data
TAND495=read.delim("TA415ND495.txt",header = T)
dim(TAND495)

TAND495LG1A=TAND495[TAND495[,2]=="1A",3:4]
TAND495LG1B=TAND495[TAND495[,2]=="1B",3:4]
TAND495LG2A=TAND495[TAND495[,2]=="2A",3:4]
TAND495LG2B=TAND495[TAND495[,2]=="2B",3:4]
TAND495LG3A=TAND495[TAND495[,2]=="3A",3:4]
TAND495LG3B=TAND495[TAND495[,2]=="3B",3:4]
TAND495LG4A=TAND495[TAND495[,2]=="4A",3:4]
TAND495LG4B=TAND495[TAND495[,2]=="4B",3:4]
TAND495LG5A=TAND495[TAND495[,2]=="5A",3:4]
TAND495LG5B=TAND495[TAND495[,2]=="5B",3:4]
TAND495LG6A=TAND495[TAND495[,2]=="6A",3:4]
TAND495LG6B=TAND495[TAND495[,2]=="6B",3:4]
TAND495LG7A=TAND495[TAND495[,2]=="7A",3:4]
TAND495LG7B=TAND495[TAND495[,2]=="7B",3:4]
TAND495LG1D=TAND495[TAND495[,2]=="1D",3:4]
TAND495LG2D=TAND495[TAND495[,2]=="2D",3:4]
TAND495LG3D=TAND495[TAND495[,2]=="3D",3:4]
TAND495LG4D=TAND495[TAND495[,2]=="4D",3:4]
TAND495LG5D=TAND495[TAND495[,2]=="5D",3:4]
TAND495LG6D=TAND495[TAND495[,2]=="6D",3:4]
TAND495LG7D=TAND495[TAND495[,2]=="7D",3:4]

##load BR34 Grandin linkage map data

BR34=read.delim("BG.txt",header = T)
dim(BR34)
BR34LG1A=BR34[BR34[,2]=="1A",3:4]
BR34LG1B=BR34[BR34[,2]=="1B",3:4]
BR34LG2A=BR34[BR34[,2]=="2A",3:4]
BR34LG2B=BR34[BR34[,2]=="2B",3:4]
BR34LG3A=BR34[BR34[,2]=="3A",3:4]
BR34LG3B=BR34[BR34[,2]=="3B",3:4]
BR34LG4A=BR34[BR34[,2]=="4A",3:4]
BR34LG4B=BR34[BR34[,2]=="4B",3:4]
BR34LG5A=BR34[BR34[,2]=="5A",3:4]
BR34LG5B=BR34[BR34[,2]=="5B",3:4]
BR34LG6A=BR34[BR34[,2]=="6A",3:4]
BR34LG6B=BR34[BR34[,2]=="6B",3:4]
BR34LG7A=BR34[BR34[,2]=="7A",3:4]
BR34LG7B=BR34[BR34[,2]=="7B",3:4]
BR34LG1D=BR34[BR34[,2]=="1D",3:4]
BR34LG2D=BR34[BR34[,2]=="2D",3:4]
BR34LG3D=BR34[BR34[,2]=="3D",3:4]
BR34LG4D=BR34[BR34[,2]=="4D",3:4]
BR34LG5D=BR34[BR34[,2]=="5D",3:4]
BR34LG6D=BR34[BR34[,2]=="6D",3:4]
BR34LG7D=BR34[BR34[,2]=="7D",3:4]
##load Salamouni Katepwa linkage map data
SalKat=read.delim("SalKat.txt",header = T)
dim(SalKat)
SalKatLG1A=SalKat[SalKat[,2]=="1A",3:4]
SalKatLG1B=SalKat[SalKat[,2]=="1B",3:4]
SalKatLG2A=SalKat[SalKat[,2]=="2A",3:4]
SalKatLG2B=SalKat[SalKat[,2]=="2B",3:4]
SalKatLG3A=SalKat[SalKat[,2]=="3A",3:4]
SalKatLG3B=SalKat[SalKat[,2]=="3B",3:4]
SalKatLG4A=SalKat[SalKat[,2]=="4A",3:4]
SalKatLG4B=SalKat[SalKat[,2]=="4B",3:4]
SalKatLG5A=SalKat[SalKat[,2]=="5A",3:4]
SalKatLG5B=SalKat[SalKat[,2]=="5B",3:4]
SalKatLG6A=SalKat[SalKat[,2]=="6A",3:4]
SalKatLG6B=SalKat[SalKat[,2]=="6B",3:4]
SalKatLG7A=SalKat[SalKat[,2]=="7A",3:4]
SalKatLG7B=SalKat[SalKat[,2]=="7B",3:4]
SalKatLG1D=SalKat[SalKat[,2]=="1D",3:4]
SalKatLG2D=SalKat[SalKat[,2]=="2D",3:4]
SalKatLG3D=SalKat[SalKat[,2]=="3D",3:4]
SalKatLG4D=SalKat[SalKat[,2]=="4D",3:4]
SalKatLG5D=SalKat[SalKat[,2]=="5D",3:4]
SalKatLG6D=SalKat[SalKat[,2]=="6D",3:4]
SalKatLG7D=SalKat[SalKat[,2]=="7D",3:4]
##load LMPG-6 PI626573 linkage map data
LMPGPI=read.delim("LMPGPI.txt",header = T)
dim(LMPGPI)
LMPGPILG1A=LMPGPI[LMPGPI[,2]=="1A",3:4]
LMPGPILG1B=LMPGPI[LMPGPI[,2]=="1B",3:4]
LMPGPILG2A=LMPGPI[LMPGPI[,2]=="2A",3:4]
LMPGPILG2B=LMPGPI[LMPGPI[,2]=="2B",3:4]
LMPGPILG3A=LMPGPI[LMPGPI[,2]=="3A",3:4]
LMPGPILG3B=LMPGPI[LMPGPI[,2]=="3B",3:4]
LMPGPILG4A=LMPGPI[LMPGPI[,2]=="4A",3:4]
LMPGPILG4B=LMPGPI[LMPGPI[,2]=="4B",3:4]
LMPGPILG5A=LMPGPI[LMPGPI[,2]=="5A",3:4]
LMPGPILG5B=LMPGPI[LMPGPI[,2]=="5B",3:4]
LMPGPILG6A=LMPGPI[LMPGPI[,2]=="6A",3:4]
LMPGPILG6B=LMPGPI[LMPGPI[,2]=="6B",3:4]
LMPGPILG7A=LMPGPI[LMPGPI[,2]=="7A",3:4]
LMPGPILG7B=LMPGPI[LMPGPI[,2]=="7B",3:4]
LMPGPILG1D=LMPGPI[LMPGPI[,2]=="1D",3:4]
LMPGPILG2D=LMPGPI[LMPGPI[,2]=="2D",3:4]
LMPGPILG3D=LMPGPI[LMPGPI[,2]=="3D",3:4]
LMPGPILG4D=LMPGPI[LMPGPI[,2]=="4D",3:4]
LMPGPILG5D=LMPGPI[LMPGPI[,2]=="5D",3:4]
LMPGPILG6D=LMPGPI[LMPGPI[,2]=="6D",3:4]
LMPGPILG7D=LMPGPI[LMPGPI[,2]=="7D",3:4]


consensus2004SSR=read.delim("2004 paper map SSR consensus.txt",header = T)
consensus2004SSRLG1A=consensus2004SSR[consensus2004SSR[,2]=="1A",3:4]
consensus2004SSRLG1B=consensus2004SSR[consensus2004SSR[,2]=="1B",3:4]
consensus2004SSRLG2A=consensus2004SSR[consensus2004SSR[,2]=="2A",3:4]
consensus2004SSRLG2B=consensus2004SSR[consensus2004SSR[,2]=="2B",3:4]
consensus2004SSRLG3A=consensus2004SSR[consensus2004SSR[,2]=="3A",3:4]
consensus2004SSRLG3B=consensus2004SSR[consensus2004SSR[,2]=="3B",3:4]
consensus2004SSRLG4A=consensus2004SSR[consensus2004SSR[,2]=="4A",3:4]
consensus2004SSRLG4B=consensus2004SSR[consensus2004SSR[,2]=="4B",3:4]
consensus2004SSRLG5A=consensus2004SSR[consensus2004SSR[,2]=="5A",3:4]
consensus2004SSRLG5B=consensus2004SSR[consensus2004SSR[,2]=="5B",3:4]
consensus2004SSRLG6A=consensus2004SSR[consensus2004SSR[,2]=="6A",3:4]
consensus2004SSRLG6B=consensus2004SSR[consensus2004SSR[,2]=="6B",3:4]
consensus2004SSRLG7A=consensus2004SSR[consensus2004SSR[,2]=="7A",3:4]
consensus2004SSRLG7B=consensus2004SSR[consensus2004SSR[,2]=="7B",3:4]
consensus2004SSRLG1D=consensus2004SSR[consensus2004SSR[,2]=="1D",3:4]
consensus2004SSRLG2D=consensus2004SSR[consensus2004SSR[,2]=="2D",3:4]
consensus2004SSRLG3D=consensus2004SSR[consensus2004SSR[,2]=="3D",3:4]
consensus2004SSRLG4D=consensus2004SSR[consensus2004SSR[,2]=="4D",3:4]
consensus2004SSRLG5D=consensus2004SSR[consensus2004SSR[,2]=="5D",3:4]
consensus2004SSRLG6D=consensus2004SSR[consensus2004SSR[,2]=="6D",3:4]
consensus2004SSRLG7D=consensus2004SSR[consensus2004SSR[,2]=="7D",3:4]


consensus2008DarT=read.delim("2008 paper map.txt",header = T)
consensus2008DarTLG1A=consensus2008DarT[consensus2008DarT[,2]=="1A",3:4]
consensus2008DarTLG1B=consensus2008DarT[consensus2008DarT[,2]=="1B",3:4]
consensus2008DarTLG2A=consensus2008DarT[consensus2008DarT[,2]=="2A",3:4]
consensus2008DarTLG2B=consensus2008DarT[consensus2008DarT[,2]=="2B",3:4]
consensus2008DarTLG3A=consensus2008DarT[consensus2008DarT[,2]=="3A",3:4]
consensus2008DarTLG3B=consensus2008DarT[consensus2008DarT[,2]=="3B",3:4]
consensus2008DarTLG4A=consensus2008DarT[consensus2008DarT[,2]=="4A",3:4]
consensus2008DarTLG4B=consensus2008DarT[consensus2008DarT[,2]=="4B",3:4]
consensus2008DarTLG5A=consensus2008DarT[consensus2008DarT[,2]=="5A",3:4]
consensus2008DarTLG5B=consensus2008DarT[consensus2008DarT[,2]=="5B",3:4]
consensus2008DarTLG6A=consensus2008DarT[consensus2008DarT[,2]=="6A",3:4]
consensus2008DarTLG6B=consensus2008DarT[consensus2008DarT[,2]=="6B",3:4]
consensus2008DarTLG7A=consensus2008DarT[consensus2008DarT[,2]=="7A",3:4]
consensus2008DarTLG7B=consensus2008DarT[consensus2008DarT[,2]=="7B",3:4]


library("LPmerge")
## merge maps
LG1A=list(RIumLG1A, RP883LG1A, RP979LG1A, RP336LG1A, RP696LG1A, BP025LG1A, DP527LG1A, LP749LG1A,
          LDNAltarLG1A,BR34LG1A,TAND495LG1A,SalKatLG1A,LMPGPILG1A,consensus2004SSRLG1A,consensus2008DarTLG1A,
          Joppa10LG1A)
LG1A.int=LPmerge(LG1A, max.interval=1:12)
str(LG1A.int)
LG1A.int[[6]][1:20,]
write.table(LG1A.int[[6]], file="LG1A.int.txt")

LG1B=list(RIumLG1B, RP883LG1B, RP979LG1B, RP336LG1B, RP696LG1B, BP025LG1B, DP527LG1B, LP749LG1B,
          LDNAltarLG1B,BR34LG1B,TAND495LG1B,SalKatLG1B,LMPGPILG1B,consensus2004SSRLG1B,consensus2008DarTLG1B,
          Joppa10LG1B)
LG1B.int=LPmerge(LG1B, max.interval=1:12)
LG1B.int[[4]][1:20,]
write.table(LG1B.int[[4]], file="LG1B.int.txt")

LG2A=list(RIumLG2A, RP883LG2A, RP979LG2A, RP336LG2A, RP696LG2A, BP025LG2A, DP527LG2A, LP749LG2A,
          LDNAltarLG2A,BR34LG2A,TAND495LG2A,SalKatLG2A,LMPGPILG2A,consensus2004SSRLG2A,consensus2008DarTLG2A,
          Joppa10LG2A)
LG2A.int=LPmerge(LG2A, max.interval=1:12)
LG2A.int[[2]][1:20,]
write.table(LG2A.int[[2]], file="LG2A.int.txt")


LG2B=list(RIumLG2B, RP883LG2B, RP979LG2B, RP336LG2B, RP696LG2B1, RP696LG2B2, BP025LG2B, DP527LG2B, LP749LG2B,
          LDNAltarLG2B,BR34LG2B,TAND495LG2B,SalKatLG2B,LMPGPILG2B,consensus2004SSRLG2B,consensus2008DarTLG2B,
          Joppa10LG2B)
LG2B.int=LPmerge(LG2B, max.interval=1:12)
LG2B.int[[3]][1:20,]
write.table(LG2B.int[[3]], file="LG2B.int.txt")

LG3A=list(RIumLG3A, RP883LG3A, RP979LG3A, RP336LG3A, RP696LG3A, BP025LG3A, DP527LG3A, LP749LG3A,
          LDNAltarLG3A,BR34LG3A,TAND495LG3A,SalKatLG3A,LMPGPILG3A,consensus2004SSRLG3A,consensus2008DarTLG3A,
          Joppa10LG3A)
LG3A.int=LPmerge(LG3A, max.interval=1:12)
LG3A.int[[6]][1:20,]
write.table(LG3A.int[[6]], file="LG3A.int.txt")

LG3B=list(RIumLG3B, RP883LG3B, RP979LG3B, RP336LG3B, RP696LG3B, BP025LG3B, DP527LG3B, LP749LG3B,
          LDNAltarLG3B,BR34LG3B,TAND495LG3B,SalKatLG3B,LMPGPILG3B,consensus2004SSRLG3B,consensus2008DarTLG3B,
          Joppa10LG3B)
LG3B.int=LPmerge(LG3B, max.interval=1:12)
  LG3B.int[[2]][1:20,]
write.table(LG3B.int[[2]], file="LG3B.int.txt")

LG4A=list(RIumLG4A, RP883LG4A, RP979LG4A, RP336LG4A, RP696LG4A, BP025LG4A, DP527LG4A, LP749LG4A,
          LDNAltarLG4A,BR34LG4A,TAND495LG4A,SalKatLG4A,LMPGPILG4A,consensus2004SSRLG4A,consensus2008DarTLG4A,
          Joppa10LG4A)
LG4A.int=LPmerge(LG4A, max.interval=1:12)
LG4A.int[[2]][1:20,]
write.table(LG4A.int[[2]], file="LG4A.int.txt")

LG4B=list(RIumLG4B, RP883LG4B, RP979LG4B, RP336LG4B, RP696LG4B, BP025LG4B, DP527LG4B, LP749LG4B,
          LDNAltarLG4B,BR34LG4B,TAND495LG4B,SalKatLG4B,LMPGPILG4B,consensus2004SSRLG4B,consensus2008DarTLG4B,
          Joppa10LG4B)
LG4B.int=LPmerge(LG4B, max.interval=1:12)
LG4B.int[[5]][1:20,]
write.table(LG4B.int[[5]], file="LG4B.int.txt")

LG5A=list(RIumLG5A, RP883LG5A, RP979LG5A, RP336LG5A, RP696LG5A, BP025LG5A, DP527LG5A, LP749LG5A,
          LDNAltarLG5A,BR34LG5A,TAND495LG5A,SalKatLG5A,LMPGPILG5A,consensus2004SSRLG5A,consensus2008DarTLG5A,
          Joppa10LG5A)
LG5A.int=LPmerge(LG5A, max.interval=1:12)
LG5A.int[[6]][1:20,]
write.table(LG5A.int[[6]], file="LG5A.int.txt")

LG5B=list(RIumLG5B, RP883LG5B, RP979LG5B, RP336LG5B, RP696LG5B, BP025LG5B, DP527LG5B, LP749LG5B,
          LDNAltarLG5B,BR34LG5B,TAND495LG5B,SalKatLG5B,LMPGPILG5B,consensus2004SSRLG5B,consensus2008DarTLG5B,
          Joppa10LG5B)
LG5B.int=LPmerge(LG5B, max.interval=1:12)
LG5B.int[[6]][1:20,]
write.table(LG5B.int[[6]], file="LG5B.int.txt")

LG6A=list(RIumLG6A, RP883LG6A, RP979LG6A, RP336LG6A, RP696LG6A, BP025LG6A, DP527LG6A, LP749LG6A,
          LDNAltarLG6A,BR34LG6A,TAND495LG6A,SalKatLG6A,LMPGPILG6A,consensus2004SSRLG6A,consensus2008DarTLG6A,
          Joppa10LG6A)
LG6A.int=LPmerge(LG6A, max.interval=1:12)
LG6A.int[[6]][1:20,]
write.table(LG6A.int[[6]], file="LG6A.int.txt")

LG6B=list(RIumLG6B, RP883LG6B, RP979LG6B, RP336LG6B, RP696LG6B, BP025LG6B, DP527LG6B, LP749LG6B,
          LDNAltarLG6B,BR34LG6B,TAND495LG6B,SalKatLG6B,LMPGPILG6B,consensus2004SSRLG6B,consensus2008DarTLG6B,
          Joppa10LG6B)
LG6B.int=LPmerge(LG6B, max.interval=1:12)
LG6B.int[[7]][1:20,]
write.table(LG6B.int[[7]], file="LG6B.int.txt")

LG7A=list(RIumLG7A, RP883LG7A, RP979LG7A, RP336LG7A, RP696LG7A, BP025LG7A, DP527LG7A, LP749LG7A,
          LDNAltarLG7A,BR34LG7A,TAND495LG7A,SalKatLG7A,LMPGPILG7A,consensus2004SSRLG7A,consensus2008DarTLG7A,
          Joppa10LG7A)
LG7A.int=LPmerge(LG7A, max.interval=1:12)
LG7A.int[[4]][1:20,]
write.table(LG7A.int[[4]], file="LG7A.int.txt")

LG7B=list(RIumLG7B, RP883LG7B, RP979LG7B, RP336LG7B, RP696LG7B, BP025LG7B, DP527LG7B, LP749LG7B,
          LDNAltarLG7B,BR34LG7B,TAND495LG7B,SalKatLG7B,LMPGPILG7B,consensus2004SSRLG7B,consensus2008DarTLG7B,
          Joppa10LG7B)
LG7B.int=LPmerge(LG7B, max.interval=1:12)
LG7B.int[[4]][1:20,]
write.table(LG7B.int[[4]], file="LG7B.int.txt")

####D genome markers distribute sparse
LG1D=list(BR34LG1D,TAND495LG1D,SalKatLG1D,LMPGPILG1D,consensus2004SSRLG1D)
LG1D.int=LPmerge(LG1D, max.interval=1:8)
LG1D.int[[3]][1:20,]
write.table(LG1D.int[[3]], file="LG1D.int.txt")

LG2D=list(BR34LG2D,TAND495LG2D,SalKatLG2D,LMPGPILG2D,consensus2004SSRLG2D)
LG2D.int=LPmerge(LG2D, max.interval=1:8)
LG2D.int[[5]][1:20,]
write.table(LG2D.int[[5]], file="LG2D.int.txt")

LG3D=list(TAND495LG3D,SalKatLG3D,LMPGPILG3D,consensus2004SSRLG3D)
LG3D.int=LPmerge(LG3D, max.interval=1:8)
LG3D.int[[7]][1:20,]
write.table(LG3D.int[[7]], file="LG3D.int.txt")

LG4D=list(BR34LG4D,TAND495LG4D,SalKatLG4D,LMPGPILG4D,consensus2004SSRLG4D)
LG4D.int=LPmerge(LG4D, max.interval=1:8)
LG4D.int[[3]][1:20,]
write.table(LG4D.int[[3]], file="LG4D.int.txt")

LG5D=list(BR34LG5D,TAND495LG5D,SalKatLG5D,LMPGPILG5D,consensus2004SSRLG5D)
LG5D.int=LPmerge(LG5D, max.interval=1:8)
LG5D.int[[5]][1:20,]
write.table(LG5D.int[[5]], file="LG5D.int.txt")

LG6D=list(BR34LG6D,TAND495LG6D,SalKatLG6D,LMPGPILG6D,consensus2004SSRLG6D)
LG6D.int=LPmerge(LG6D, max.interval=1:8)
LG6D.int[[3]][1:20,]
write.table(LG6D.int[[3]], file="LG6D.int.txt")

LG7D=list(BR34LG7D,TAND495LG7D,SalKatLG7D,LMPGPILG7D,consensus2004SSRLG7D)
LG7D.int=LPmerge(LG7D, max.interval=1:8)
LG7D.int[[6]][1:20,]
write.table(LG7D.int[[6]], file="LG7D.int.txt")


#Rename colname. Originally, colnames are X1, X2, etc.

# LG2A=list(RIumLG2A, RP883LG2A, RP979LG2A, RP336LG2A, RP696LG2A, BP025LG2A, DP527LG2A1,DP527LG2A2, LP749LG2A,
#           LDNAltarLG2A,BR34LG2A,TAND495LG2A,SalKatLG2A,LMPGPILG2A,consensus2004SSRLG2A,consensus2008DarTLG2A)
# LG2B=list(RIumLG2B, RP883LG2B, RP979LG2B, RP336LG2B, RP696LG2B1, RP696LG2B2, BP025LG2B, DP527LG2B, LP749LG2B,
#           LDNAltarLG2B,BR34LG2B,TAND495LG2B,SalKatLG2B,LMPGPILG2B,consensus2004SSRLG2B,consensus2008DarTLG2B)
# LG3A=list(RIumLG3A, RP883LG3A, RP979LG3A, RP336LG3A, RP696LG3A, BP025LG3A, DP527LG3A, LP749LG3A,
#           LDNAltarLG3A,BR34LG3A,TAND495LG3A,SalKatLG3A,LMPGPILG3A,consensus2004SSRLG3A,consensus2008DarTLG3A)


chr1A=cbind("chr"=rep("1A",nrow(LG1A.int[[6]])),LG1A.int[[6]])
#chr2A=cbind("chr"=rep("2A",nrow(LG2A.int[[2]])),LG2A.int[[2]][,-8])# extra columns in 2A&2B
chr2B=cbind("chr"=rep("2B",nrow(LG2B.int[[3]])),LG2B.int[[3]][,-6])

colnames(chr2B)=colnames(chr1A)
#write a final consensus map
finalMap=rbind(cbind("chr"=rep("1A",nrow(LG1A.int[[6]])),LG1A.int[[6]]),
               cbind("chr"=rep("1B",nrow(LG1B.int[[4]])),LG1B.int[[4]]),
               cbind("chr"=rep("2A",nrow(LG2A.int[[2]])),LG2A.int[[2]]),
               chr2B,
               cbind("chr"=rep("3A",nrow(LG3A.int[[6]])),LG3A.int[[6]]),
               cbind("chr"=rep("3B",nrow(LG3B.int[[2]])),LG3B.int[[2]]),
               cbind("chr"=rep("4A",nrow(LG4A.int[[2]])),LG4A.int[[2]]),
               cbind("chr"=rep("4B",nrow(LG4B.int[[5]])),LG4B.int[[5]]),
               cbind("chr"=rep("5A",nrow(LG5A.int[[6]])),LG5A.int[[6]]),
               cbind("chr"=rep("5B",nrow(LG5B.int[[6]])),LG5B.int[[6]]),
               cbind("chr"=rep("6A",nrow(LG6A.int[[6]])),LG6A.int[[6]]),
               cbind("chr"=rep("6B",nrow(LG6B.int[[7]])),LG6B.int[[7]]), 
               cbind("chr"=rep("7A",nrow(LG7A.int[[4]])),LG7A.int[[4]]),
               cbind("chr"=rep("7B",nrow(LG7B.int[[4]])),LG7B.int[[4]]))

colnames(finalMap)=c("chr","marker","pos","RIum","RP883","RP979","RP336","RP696","BP025","DP527","LP749",
                     "LDNxAltar","BR34Gradin","TAxND495","SalKat","LMPGxPI","consensus2004","consensus2008","Joppa10")
write.csv(finalMap,file = "final_consensus_map_AABB_16maps.csv")

#D genome
# LG2D=list(BR34LG2D,TAND495LG2D,SalKatLG2D,LMPGPILG2D,consensus2004SSRLG2D)
# LG3D=list(TAND495LG3D,SalKatLG3D,LMPGPILG3D,consensus2004SSRLG3D)

LG3D.int[[7]]=cbind(LG3D.int[[7]],rep(NA,nrow(LG3D.int[[7]])))
LG3D.int[[7]]=LG3D.int[[7]][,c(1,2,7,3,4,5,6)]
colnames(LG3D.int[[7]])=colnames(LG1D.int[[3]])

finalDgenomeMap=rbind(cbind("chr"=rep("1D",nrow(LG1D.int[[3]])),LG1D.int[[3]]),
                      cbind("chr"=rep("2D",nrow(LG2D.int[[5]])),LG2D.int[[5]]),
                      cbind("chr"=rep("3D",nrow(LG3D.int[[7]])),LG3D.int[[7]]),
                      cbind("chr"=rep("4D",nrow(LG4D.int[[3]])),LG4D.int[[3]]),
                      cbind("chr"=rep("5D",nrow(LG5D.int[[5]])),LG5D.int[[5]]),
                      cbind("chr"=rep("6D",nrow(LG6D.int[[3]])),LG6D.int[[3]]),
                      cbind("chr"=rep("7D",nrow(LG7D.int[[6]])),LG7D.int[[6]]))

colnames(finalDgenomeMap)=c("chr","marker","pos","BR34Gradin","TAxND495","SalKat","LMPGxPI","consensus2004SSR")

write.csv(finalDgenomeMap,file="final_consensus_map_Dgenome_5_maps.csv")
################
#Evaluate the constructed consensus map
consensusMap=read.csv("../final_consensus_map_AABB_16maps.csv",header = T,stringsAsFactors = F)
consensusMap[1:5,1:5]

i90kMap=read.csv("../i90k_bread_wheat_consensus_map.csv",header = T,na.strings = "NA",stringsAsFactors = F)
i90kMap[1:5,]


correlationContainer=c()
for(chromosome in c("1A","1B","2A","2B","3A","3B","4A","4B","5A","5B","6A","6B","7A","7B")){
  consensusMap[consensusMap$chr ==chromosome,]$marker
  i90kMap[i90kMap$Chr==chromosome,]$SNP_.id
  commomMarker=intersect(consensusMap[consensusMap$chr ==chromosome,]$marker,i90kMap[i90kMap$Chr==chromosome,]$SNP_.id)
  test1=consensusMap[consensusMap$chr ==chromosome,]
  rownames(test1)=test1$marker
  test2=i90kMap[i90kMap$Chr==chromosome,]
  rownames(test2)=test2$SNP_.id
  rank(test1[commomMarker,]$pos)
  rank(test2[commomMarker,]$cM)
  correlationContainer=rbind(correlationContainer,c(chromosome,cor(rank(test1[commomMarker,]$pos),rank(test2[commomMarker,]$cM))))
}

#correlationContainerJan11=correlationContainer
correlationContainer
???
