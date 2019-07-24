#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=12:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=6                              # Number of tasks per job
#SBATCH --account=ucb114_summit1       # Use Quandt Genomics Allocation
#SBATCH --job-name=proteinortho        # Job submission name
#SBATCH --output=Protortho_clean_POH_v1.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         9 July 2019
# Purpose:         Proteinortho POH



# purge all existing modules
ml purge


# load any modules needed to run your program


# The directory where you want the job to run
#cd /scratch/summit/caqu8258/Crypto/

ulimit -c 0

# Run your program

source ~/.proto6
proteinortho -clean -project=POH -cpus=$SLURM_NTASKS Acrchr.fas Beabas.fas Beabro.fas Calpu.fas Chagl.fas Chain.fas Clapur.fas Cloros.fas Colgra.fas Conli.fas Conlig.fas Corcon.fas Cormar.fas Cormil.fas DalEC.fas Diaamp.fas Drecon.fas Epifes.fas Eutla.fas Fusgra.fas Fusoxy.fas Fusver.fas Grocla.fas Hirmin.fas Hyanol.fas Ilysp.fas Lintha.fas Maggr.fas Melpom.fas Melsp.fas Meltif.fas Metacr.fas Metrob.fas Micbol.fas Mictri.fas Moelib.fas Mycthe.fas Myrinu.fas Nechae.fas Neodit.fas Neovas.fas Neucr.fas Nieexi.fas Nieexo.fas Ochcal.fas Ophnov.fas Ophpi.fas Peespi.fas Pesfic.fas Phaale.fas Pocchl.fas Podans.fas Psevex.fas Purlil.fas Rosmor.fas Simlam.fas Sodalk.fas Sphbe.fas Stacha.fas Stachl.fas Stagri.fas Stekei.fas Thiter.fas Tolcap.fas Tolinf.fas Toloph.fas Tolpar.fas Torhem.fas Torrad.fas Trees.fas Triatr.fas Trice.fas Trivir.fas Ustvir.fas Valla.fas Verdah.fas Xylhyp.fas


