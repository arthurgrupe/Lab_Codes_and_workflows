  GNU nano 2.3.1                  File: funannotate_predict_slurm.sh                                           

#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=24:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=4                              # Number of tasks per job
#SBATCH --job-name=funannotate_predict_m_rufum        # Job submission name
#SBATCH --output=funannotate_predict_m_rufum.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=tina.jones@colorado.edu

# Updated:         17 March 2019
# Purpose:         Funannotate predict

# purge all existing modules


# load any modules needed to run your program


# The directory where you want the job to run
cd /scratch/summit/chjo1591/Leotiomycetes/working/Microglossum_rufum/funannotate_predict_out

# Run your program
funannotate predict -i /scratch/summit/chjo1591/Leotiomycetes/working/Microglossum_rufum/masked_sorted_m_rufum_300bp.fas --species "botrytis_cinerea" --protein_evidence /projects/chjo1591/scripts/Leotio_prots_for_funannotate.fas -o funannotate_predict_out

