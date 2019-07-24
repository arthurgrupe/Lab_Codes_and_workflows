#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=24:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --qos=normal                          # Specify testing QOS
#SBATCH --partition=shas               # Specify Summit haswell nodes
#SBATCH --ntasks=1                              # Number of tasks per job
#SBATCH --job-name=grab_proteins        # Job submission name
#SBATCH --output=Grab_prots.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu


# Updated:         23 July 2019
# Purpose:         Proteinortho Grab Proteins



# purge all existing modules
ml purge


# load any modules needed to run your program


# The directory where you want the job to run
#cd /scratch/summit/caqu8258/Crypto/

ulimit -c 0

# Run your program
perl ./proteinortho_grab_proteins.pl -exact -tofiles all_78_no_header.tsv Acrchr.names.fas Beabas.names.fas Beabro.v2.names.fas Calpul.names.fas Chaglo.names.fas Chain.names.fas Clapur.names.fas Cloros.names.fas Colgra.names.fas Conlig.names.fas Conli.names.fas Corcon.names.fas Cormar.names.fas Cormil.names.fas DalEC.names.fas Diaamp.names.fas Drecon.names.fas Epifes.names.fas Eutlat.names.fas Fusgra.names.fas Fusoxy.names.fas Fusver.names.fas Grocla.names.fas Hirmin.names.fas Hyanol.names.fas Ilysp.names.fas Lintha.names.fas Maggri.names.fas Melpom.names.fas Melsp.names.fas Meltif.names.fas Metacr.names.fas Metrob.names.fas Micbol.names.fas Mictri.names.fas Moelib.names.fas Mycthe.names.fas Myrinu.names.fas Nechae.names.fas Neodit.names.fas Neovas.names.fas Neucr.names.fas Nieexi.names.fas Nieexo.names.fas Ochcal.names.fas Ophnov.names.fas Ophpi.names.fas Ophsin.names.fas Peespi.names.fas Pesfic.names.fas Phaale.names.fas Pocchl.names.fas Podans.names.fas Psevex.names.fas Purlil.names.fas Rosmor.names.fas Simlam.names.fas Sodalk.names.fas Sphber.names.fas Stachar.names.fas Stachlo.names.fas Stagri.names.fas Stekei.names.fas Thiter.names.fas Tolcap.names.fas Tolinf.names.fas Toloph.names.fas Tolpar.names.fas Torhem.names.fas Torrad.names.fas Trees.names.fas Triatr.names.fas Tricer.names.fas Trivir.names.fas Ustvir.names.fas Vallax.names.fas Verdah.names.fas Xylhyp.names.fas

