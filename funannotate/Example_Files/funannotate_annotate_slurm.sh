#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=1:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=3                              # Number of tasks per job
#SBATCH --job-name=funannotate_annotate_crypto        # Job submission name
#SBATCH --output=Funannotate_annotate_crypto.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu


# Updated:         24  May 2019
# Purpose:         Funannotate annotate



# purge all existing modules
ml purge


# load any modules needed to run your program


# The directory where you want the job to run
#cd /scratch/summit/caqu8258/Crypto/

ulimit -c 0

# Run your program
######YOU MUST reformat your phobius output to have no header and be tab delimited######
######YOU MUST concatenate all the cluster .gbk files into a single file######
source ~/.funrc
funannotate annotate -i /scratch/summit/caqu8258/Crypto/funannotate_predict_v2/ -s "Naganishia friedmannii" --sbt ./Nagfri.sbt  --antismash ./All_clusters.gbk --phobius ./phobius.tab --iprscan ./Nag_Fri_iprscan_results.xml --busco_db /projects/caqu8258/software/local/bin/busco/Lineages/basidiomycota_odb9 -t "-l paired-ends" 

