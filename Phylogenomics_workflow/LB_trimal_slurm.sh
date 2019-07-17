#!/bin/bash
#SBATCH --time 2:00:00
#SBATCH --qos=normal
#SBATCH --partition=shas
#SBATCH --ntasks=5
#SBATCH --account=ucb114_summit1       # Use Quandt Genomics Allocation
#SBATCH --job-name=trimal        # Job submission name
#SBATCH --output=Lb_trimal_v1.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         17 July 2019
# Purpose:         Trimal

module purge

module load gcc/8.2.0
module load intel
module load impi
module load python
module load loadbalance

mpirun lb lb_cmd_trimal
