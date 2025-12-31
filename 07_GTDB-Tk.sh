gtdbtk classify_wf --genome_dir 06drep/drep_out/dereplicated_genomes -x fa --out_dir classify_wf_out --cpus 40
cat classify_wf_out/gtdbtk.ar53.summary.tsv classify_wf_out/gtdbtk.bac120.summary.tsv > classify_wf_out/ar122_bac120.summary.tsv

cp classify_wf_out/align/gtdbtk.bac120.user_msa.fasta.gz ./
gunzip gtdbtk.bac120.user_msa.fasta.gz
gtdbtk infer --msa_file gtdbtk.bac120.user_msa.fasta --out_dir ./gtdbtk_infer_bac/ --cpus 40
