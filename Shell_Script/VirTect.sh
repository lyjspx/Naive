#command for detecting virus integration
python VirTect.py -t 12 -1 ../ViruSeq/L526401A/L526401A_1.fq  -2 ../ViruSeq/L526401A/L526401A_2.fq  -o test_on_VirusSeq_data/ -ucsc_gene human_reference/gencode.v29.annotation.gtf -index human_reference/GRCh38.p12.genome -index_vir viruses_reference/viruses_757.fasta -d 200
