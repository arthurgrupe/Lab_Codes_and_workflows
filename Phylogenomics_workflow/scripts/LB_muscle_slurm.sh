#!/bin/bash
#SBATCH --time 24:00:00
#SBATCH --qos=normal
#SBATCH --partition=shas
#SBATCH --ntasks=48
#SBATCH --account=ucb114_summit1       # Use Quandt Genomics Allocation
#SBATCH --job-name=Muscle        # Job submission name
#SBATCH --output=LB_muscle_v1.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         16 July 2019
# Purpose:         Muscle

module purge

module load intel
module load impi
module load python
module load loadbalance

mpirun lb lb_cmd_file