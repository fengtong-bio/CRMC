mkdir 06drep/all_bin
checkm lineage_wf -t 40 -x fa --tab_table -f bins_qa.txt 06drep/all_bin checkm_out
cp bins_qa.txt bins_qa_copy.txt
sed -i 's/ /_/g' bins_qa_copy.txt
mkdir checkm_bin_fa
awk '{if ($12 >= 50 && $13 <= 10) print "cp 06drep/all_bin/" $1 ".fa checkm_bin_fa/"}' bins_qa_copy.txt |bash
