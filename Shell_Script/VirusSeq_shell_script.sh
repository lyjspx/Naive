#Refer USER_Guide_VirusSeq
#Run in ABC server

#4. (optional)
##for gib virus reference genome
../Mosaik_bin/MosaikBuild -fr gibVirus.fa -oa gibVirus.fa.bin -st illumina -assignQual 40
../Mosaik_bin/MosaikJump -ia gibVirus.fa.bin -out gibVirus.JumpDb -hs 15 -mhp 100 -km

##version-0.89 and for combined hg19Virus reference genome
../Mosaik_bin/MosaikBuild -fr hg19Virus.fa -oa hg19Virus.fa.bin -st illumina -assignQual 40
../Mosaik_bin/MosaikJump -ia hg19Virus.fa.bin -out hg19Virus.JumpDb -hs 15 -mhp 100 -km

##for hg19 reference genome
../Mosaik_bin/MosaikBuild -fr hg19.fa -oa hg19.fa.bin -st illumina -assignQual 40
../Mosaik_bin/MosaikJump -ia hg19.fa.bin -out hg19.JumpDb -hs 15 -mhp 100 -km

#1.
#Mosaik jump database generation
#Like indexing in Bowtie
#working directory is ./ViruSeq/Mosaik_Jumpdb
export MOSAIK_TMP=~/Desktop/externalDisk/ViruSeq/tmp


#2.Detection of virus by next‐generation sequencing (NGS) data
# 2.1  Installation of tools, reference genome and annotation files
#Virus detection by NGS data
#Current working directory is VirusSeq/L526401A

# 2.2 Virus detection by NGS data
../Mosaik_bin/MosaikBuild -q L526401A_1.fq.gz -q2 L526401A_2.fq.gz -out L526401A_Virus.bin -st illumina

../Mosaik_bin/MosaikAligner -in L526401A_Virus.bin -ia ../Mosaik_JumpDb/hg19.fa.bin -out L526401A_Virus.bin.aligned -hs 15 -mmp 0.1 -mmal 0.5 -act 25 ‐mhp 100 ‐m unique -j ../Mosaik_JumpDb/hg19.JumpDb -p 20 -km -pm -rur L526401A_Unalg.fq

../Mosaik_bin/MosaikBuild -q L526401A_Unalg.fq -out L526401A_Virus.bin -st illumina

../Mosaik_bin/MosaikAligner -in L526401A_Virus.bin -ia ../Mosaik_JumpDb/gibVirus.fa.bin -out L526401A_Virus.bin.aligned -hs 15 -mmp 0.15 -act 25 -mhp 100 -m all -j ../Mosaik_JumpDb/gibVirus.JumpDb -p 12 -km -pm

../Mosaik_bin/MosaikSort -in L526401A_Virus.bin.aligned -out L526401A_Virus.bin.aligned.sorted

../Mosaik_bin/MosaikAssembler -in L526401A_Virus.bin.aligned.sorted -ia ../Mosaik_JumpDb/gibVirus.fa.bin -out Gig/L526401A_Virus.bin.aligned.sorted.assembled -f ace >L526401A_VirusLog.txt

perl ../VirusSeq_Script/VirusSeq_Detection.pl L526401A_VirusLog.txt 1000 L526401A_VirusName.txt

#3.Detection of virus integration sites by NGS data
#3.1 PE reads FASTQ file mapping against hybrid genome hg19Virus
../Mosaik_bin/MosaikBuild -q ./L526401A_1.fq.gz -q2 ./L526401A_2.fq.gz -out L526401A.bin -st illumina

../Mosaik_bin/MosaikAligner -in L526401A.bin -ia ../Mosaik_JumpDb/hg19Virus.fa.bin -out L526401A.bin.aligned -hs 15 -mmp 0.06 -mmal -minp 0.5 -act 25 -mhp 100 -m unique -a all -j ../Mosaik_JumpDb/hg19Virus.JumpDb -km -pm -p 12

../Mosaik_bin/Spanner --scan --infile L526401A.bin.aligned --outdir SV_gDNA

../Mosaik_bin/Spanner --build --infile L526401A.bin.aligned --outdir SV_gDNA -f SV_gDNA/MSK.stats -a ../Mosaik_JumpDb/Spanner_anchor_hg19Virus.txt -t

#3.2 Single‐end reads FASTQ file mapping against hybrid genome hg19Virus
../Mosaik_bin/MosaikBuild -q ./L526401A_1.fq.gz  -out L526401A_1.bin -st illumina

../Mosaik_bin/MosaikAligner -in L526401A_1.bin -ia ../Mosaik_JumpDb/hg19Virus.fa.bin -out L526401A_1.bin.aligned -hs 15 -mmp 0.06 -mmal -minp 0.5 -act 25 -mhp 100 -m unique -j ../Mosaik_JumpDb/hg19Virus.JumpDb -p 12 -km -pm

../Mosaik_bin/MosaikSort -in L526401A_1.bin.aligned -out L526401A_1.bin.aligned.sorted ‐u

../Mosaik_bin/MosaikBuild -q ./L526401A_2.fq.gz -out L526401A_2.bin -st illumina

../Mosaik_bin/MosaikAligner -in L526401A_2.bin -ia ../Mosaik_JumpDb/hg19Virus.fa.bin -out L526401A_2.bin.aligned -hs 15 -mmp 0.06 -mmal -minp 0.5 -act 25 -mhp 100 -m unique -j ../Mosaik_JumpDb/hg19Virus.JumpDb -p 12 -km -pm

../Mosaik_bin/MosaikSort -in L526401A_2.bin.aligned -out L526401A_2.bin.aligned.sorted ‐u

../Mosaik_bin/MosaikMerge -in L526401A_1.bin.aligned.sorted -in L526401A_2.bin.aligned.sorted -out L526401A_SE.bin.aligned.sorted

../Mosaik_bin/MosaikText -in L526401A_SE.bin.aligned.sorted -axt L526401A_SE.bin.aligned.sorted.axt

#3.3 Detection of virus integration site
#current working directory: “/RIS/home/xsu1/VirusSeq/L526401A/SV_gDNA"
perl ../../VirusSeq_Script/Spanner_cross_converter.pl ../../Mosaik_JumpDb/hg19Virus_refGene_RIS.txt ../L526401A_SE.bin.aligned.sorted.axt L526401A_CrossReads.txt

perl ../../VirusSeq_Script/VirusSeq_Integration.pl L526401A_CrossReads.txt ../../Mosaik_JumpDb/hg19Virus_refGene_RIS.txt hg19 192 95 50 L526401A_Integration.txt