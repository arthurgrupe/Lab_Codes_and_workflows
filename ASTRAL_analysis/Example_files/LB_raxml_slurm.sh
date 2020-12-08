#!/bin/bash
#SBATCH --time=24:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=40                            # Number of tasks per job
#SBATCH --account=ucb114_summit1    #Use Quandt Genomics Allocation
#SBATCH --job-name=raxml_lb        # Job submission name
#SBATCH --output=LB_raxml_astral_leo.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         12 Dec 2019
# Purpose:         Raxml



# purge all existing modules
module purge

# load any modules needed to run your program
module load gcc/6.1.0 impi/5.1.3.210 perl/5.24.0 jdk/1.8.0
module load loadbalance

# The directory where you want the job to run
cd /scratch/summit/caqu8258/Leotiomycetes/single_copy_clusters/muscleout/trimmed

ulimit -c 0

# Run your program

mpirun lb lb_cmd_raxml_v10

