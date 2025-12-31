bwa mem -t 52 bwa_index/GTDB Sample_name_paired_clean1.fq.gz Sample_name_paired_clean2.fq.gz |samtools flagstat - > ./GTDB/Sample_name.flagstat
bwa mem -t 52 bwa_index/iMGMC_mouse Sample_name_paired_clean1.fq.gz Sample_name_paired_clean2.fq.gz |samtools flagstat - > ./iMGMC_mouse/Sample_name.flagstat
bwa mem -t 52 bwa_index/MIMAG_human Sample_name_paired_clean1.fq.gz Sample_name_paired_clean2.fq.gz |samtools flagstat - > ./MIMAG_human/Sample_name.flagstat
bwa mem -t 52 bwa_index/PIGC_pig Sample_name_paired_clean1.fq.gz Sample_name_paired_clean2.fq.gz |samtools flagstat - > ./PIGC_pig/Sample_name.flagstat
bwa mem -t 52 bwa_index/ruminants_Microbiome Sample_name_paired_clean1.fq.gz Sample_name_paired_clean2.fq.gz |samtools flagstat - > ./ruminants_Microbiome/Sample_name.flagstat
bwa mem -t 52 bwa_index/CRMC Sample_name_paired_clean1.fq.gz Sample_name_paired_clean2.fq.gz |samtools flagstat - > ./CRMC/Sample_name.flagstat
