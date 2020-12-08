#!/bin/bash
 
files=$(ls *.trim.renamed)
 
for i in $files
do
echo "mpirun -np 19  raxmlHPC-MPI-AVX2 -f a -s ${i} -n ${i}_raxml_v1_100bp -m PROTGAMMAAUTO -x 3248 -N 100 -p 2964"
done
 
