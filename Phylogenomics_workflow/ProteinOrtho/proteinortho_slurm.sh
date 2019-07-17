#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=24:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=12                              # Number of tasks per job
#SBATCH --job-name=proteinortho        # Job submission name
#SBATCH --output=protortho12_24.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         18 June 2019
# Purpose:         Proteinortho



# purge all existing modules
ml purge


# load any modules needed to run your program


# The directory where you want the job to run
#cd /scratch/summit/caqu8258/Crypto/

ulimit -c 0

# Run your program

source ~/.funrc
proteinortho -keep -clean -project=crypto -cpus=$SLURM_NTASKS Botbo.fas Calvi.fas Ustsp.fas Trias.fas Ustma.fas Treen.fas Triol.fas Treme.fas Kocim.fas CryneoH99.fas Walse.fas Malglo.fas Nagfri.fas Kwonbest.fas Kwondej.fas Kwonhev.fas Cryamy.fas Crygat.fas  

