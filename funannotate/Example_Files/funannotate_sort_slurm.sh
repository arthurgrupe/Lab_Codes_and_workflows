#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=00:60:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=1                              # Number of tasks per job
#SBATCH --job-name=funannotate_sort_m_rufum        # Job submission name
#SBATCH --output=funannotate_sort_m_rufum.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=lara.@colorado.edu

# Updated:         17 March 2019
# Purpose:         Funannotate sort

# purge all existing modules


# load any modules needed to run your program


# The directory where you want the job to run
cd /projects/lavi3948/Naga_friedmannii/

# Run your program

funannotate sort -i your_scaffolds.fas -o sorted_Nfried_500bp.fas -b Nagfri --minlen 500
