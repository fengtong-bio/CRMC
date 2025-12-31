mkdir 05metabat2/Sample_NAME
ln -s 04megahit/Sample_NAME/final.contigs.fa 05metabat2/Sample_NAME/Sample_NAME.fa
bwa index 05metabat2/Sample_NAME/Sample_NAME.fa
bwa mem -t 80 05metabat2/Sample_NAME/Sample_NAME.fa 03bowtie2/Sample_NAME_meta_clean_R1.fq.gz 03bowtie2/Sample_NAME_meta_clean_R2.fq.gz | samtools view -bS - > 05metabat2/Sample_NAME/Sample_NAME.bam
samtools sort -@ 80 05metabat2/Sample_NAME/Sample_NAME.bam > 05metabat2/Sample_NAME/Sample_NAME.sort.bam
jgi_summarize_bam_contig_depths --outputDepth 05metabat2/Sample_NAME/Sample_NAME.fa.depth.txt --pairedContigs 05metabat2/Sample_NAME/Sample_NAME.fa.paired.txt --minContigLength 1000 --minContigDepth 1 05metabat2/Sample_NAME/Sample_NAME.sort.bam
metabat2 -t 80 --inFile 05metabat2/Sample_NAME/Sample_NAME.fa --outFile 05metabat2/Sample_NAME/Sample_NAME.fa.metabat-bins20/bin --abdFile 05metabat2/Sample_NAME/Sample_NAME.fa.depth.txt
cd 05metabat2/Sample_NAME/Sample_NAME.fa.metabat-bins20/
rename bin Sample_NAME *fa
