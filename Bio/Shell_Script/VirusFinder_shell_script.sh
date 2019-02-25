#Third-party tools used in VirusFinder2
# BLAST+ 2.2.26+ ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/ Alignment tool
# BLAT1 V.34 http://genome.ucsc.edu/cgi-bin/hgBlat Alignment tool
# Bowtie2 2 http://bowtie-bio.sourceforge.net/bowtie2/ Alignment tool
# BWA 0.6.1 http://bio-bwa.sourceforge.net/ Alignment tool
# iCORN1 0.97 http://icorn.sourceforge.net/ Reference correction tool
# CREST1 1.1 http://www.stjuderesearch.org/site/lab/zhang Structural variant calling
# GATK1 2.4-9 http://www.broadinstitute.org/gatk/ Realignment tool
# SAMtools 0.1.18 http://samtools.sourceforge.net/ Alignment processing tool
# SVDetect r0.8 http://svdetect.sourceforge.net/Site/ Structural variant calling
# Trinity 2012-06-08 http://trinityrnaseq.sourceforge.net/ De novo assembly tool

bowtie2-build hg19.fa hg19
makeblastdb -in hg19.fa -dbtype nucl -out hg19

#In the paper, three optional virus genome
# http://khavarilab.stanford.edu/resources.html virus.fa from RINS
# Genome Information Broker for Viruses (GIB-V, http://gib-v.genes.nig.ac.jp/) 
# NCBI viral gene annotation (ftp://ftp.ncbi.nih.gov/refseq/release/viral/).
makeblastdb -in virus.fa -dbtype nucl -out virus

#Edit configure file
#Install bioseq module
#Use absolute path
 perl preprocess.pl -c contig_test_data.txt -o .

perl detect_virus.pl -c contig_test_data.txt 
