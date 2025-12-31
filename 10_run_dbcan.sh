mkdir MAG_cazy/MAG_bin_XX.fa
run_dbcan --out_dir MAG_cazy/MAG_bin_XX.fa --db_dir PATH_TO/cazy_db --hmm_cpu 2 MAG_prokka/MAG_bin_XX.fa/MAG_bin_XX.fa.faa protein -t hmmer

