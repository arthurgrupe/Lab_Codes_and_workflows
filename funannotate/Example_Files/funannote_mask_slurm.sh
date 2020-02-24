#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=03:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=2                              # Number of tasks per job
#SBATCH --job-name=funannotate_mask_m_rufum        # Job submission name
#SBATCH --output=funannotate_mask_m_rufum.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=tina.jones@colorado.edu

# Updated:         17 March 2019
# Purpose:         Funannotate mask

# purge all existing modules


# load any modules needed to run your program


# The directory where you want the job to run
cd /scratch/summit/chjo1591/Leotiomycetes/working/Microglossum_rufum/

# Run your program

funannotate mask -i sorted_m_rufum_300bp.fas -o masked_sorted_m_rufum_300bp.fas -s fungi

