Visualize your data - create an emergent self organizing map (ESOM).
#Modified and emended from the work out of Jill Banfield's lab. Greg Dick et al. 2009 Genome Biology. And Vincent Denef's version of the print_tetramer_freqs.pl perl script has been used.
#Example files and necessary scripts included in this folder as well (.lrn file was too big, so I had to gzip it!).

#Your input is the scaffolds.fasta file from your SPAdes output. 

1. Remove small contigs from your input assembly. Contigs below 300 - 1000bp can be removed. We start with 300 and increase the minimum threshold size as needed.

```
module purge
module load perl/5.24.0
perl remove_small_contigs.pl 300 scaffolds.fasta > species_300bp_spades.fasta
```

2. Using blastn create a best blast hit for each contig. Use tabular format (6) for blast output. This takes about 4-18 hours. 

```
blastn -query species_300bp_spades.fasta -db /pl/active/fungi1/blastdb_nt/nt -out species_300bp_to_ntdb_E5 -max_target_seqs 1 -evalue 1e-5 -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore staxids" -num_threads 12
```

#Talk about quick and dirty. Your best blastn hit could be spurious or as equally likely as the second or fourth best blastn hit, but in aggregate, we try to separate the data. For bacteria, this actually works quite well, for Eukaryotes the databases are sparser and therefore we give a best blastn hit less meaning. A top hit to ANY fungus is usually a definite for our targets, a top hit to animals (especially inverts) could still be fungal target though. I see this frequently.

3. Multiple hits will be assigned to each contig, filter the results so only a "best" blast hit is assigned.

```
perl best_blast_hit.pl species_300bp_to_ntdb_E5_blast.out > best_species_300bp_to_ntdb_E5_blast.out 
```

4. Assign taxonomy based on the best blast hit.

```
source ~/.kevinrc
python new_ncbi_tax_report_test.py best_species_300bp_to_ntdb_E5_blast.out -o best_species_300bp_to_ntdb_E5_taxreport
```

5. Using the taxonomy assignment, bin contigs manually. Reformat to the "annotation" format taken by ESOM and save it as a plain text file: your_metagenome.annotation

#Here is an example of the top few lines of the annotation file, your_metagenome.annotation:
```
contig  annotation
NODE_1147_length_2667_cov_16.2489	10
NODE_707_length_4433_cov_14.0962	10
NODE_329_length_11939_cov_66.1998	1
NODE_326_length_12118_cov_62.7537	1
NODE_2533_length_1171_cov_47.2948	1
NODE_1903_length_1542_cov_12.076	10
NODE_1518_length_1955_cov_17.2579	10
NODE_989_length_3135_cov_14.3055	10
NODE_1005_length_3078_cov_17.2253	10
NODE_988_length_3137_cov_10.7748	10
NODE_1225_length_2482_cov_16.2073	10
NODE_867_length_3613_cov_15.5486	10
NODE_1675_length_1764_cov_10.7923	10
NODE_458_length_7907_cov_59.2615	3
```
Note, the "key" to these annotation (e.g.taxonomy for 1,10,3) is kept in the spreadsheet where this work was done - not in the esom input file.

Example of the key for your annotation:
```
0 Unassigned
1 Ascomycota
2 Other fungi
3 Plant
4 Animal
5 Bacteria 
6 Virus
7 Amoeba
10 Other eukaryote
```
6. Generate input files for ESOM.

```
perl print_tetramer_freqs_esom.pl -s species_300bp_spades.fasta -m 300 -w 3000 -k 4 -a species_metagenome.annotation
```

#s = your assembly
#m = minimum contig size to be analyzed (make this higher for faster/ less CPU intensive visualization)
#w = window size to calculate kmer frequency (again, make this higher for faster viz)
#k = kmer size, default is 4, longer means slower!
#a = annotation file (tab delimited plain text) you generated (either from Blast taxonomy report as above, or other info e.g. coverage, RNASeq data)
NOTE: you may need to type out full path for this perl script to work if not in same directory.

7. Output, 4 files: .lrn, .names, .cls, .annotation files within your directory. 

***Data may either be processed locally with Databionic ESOM or with Somoclu, then visualized with ESOM. Follow the ESOM workflow below when working with smaller datasets or when generating a smaller map size. Follow the Somoclu workflow for larger datasets or mapsize.***

***-----ESOM training (local processing) workflow start-----***

8a. Copy your 4 output files to the Mac.

#ESOM GUI can be installed here : http://databionic-esom.sourceforge.net/
This works on Mac and Linux machines, but we have not had success on Windows yet.

8b. Load files into ESOM gui:

File -> load .lrn, then load .names, then load .cls

Tools -> training.  I use default options, except: 
   Training algorithm - K-batch
   Number of rows in map - 200
   Number of cols in map - 250 (product of rows x cols should be approximately 5-6x the # of windows, e.g. I have a 30,000,000 bp assembly, divide by 3000 [size of window] ) 
   Start value for the radius - 50
   Number of epochs - 20

8c. Hit start - training will take minutes to hours (more common) depending on the size of your dataset.

***-----ESOM training (local processing) workflow end-----***


***-----Somoclu training workflow start-----***
Somoclu is beneficial when you have a large dataset as this can be time and resource-consuming when running locally.
It can be installed here: https://somoclu.readthedocs.io/en/stable/download.html


8a. Train your ESOM
This will reproduce the same parameters specified above for ESOM and output .bm, .names, .umx, and .wts files. 

```
source ~/.somoclurc
/projects/chjo1591/software/build/somoclu-master/src/somoclu -e 20 -l 0.5 -L 0.1 -m toroid -r 50 -x 250 -y 200 -v 2 species_300bp.fasta.lrn species_300bp.fasta
```
#e = number of epochs
#l = starting learning rate 
#L = finishing learning rate
#m = map type
#r = start radius
#x = number of columns in map 
#y = number of rows in map 
#v = verbosity level (gives progress/status in output file)

***Somoclu will number the the .lrn file starting at 1 and the .bm file starting at 0. If you use them as is in ESOM, you will get a message about mismatches in observations when you run the "Getclassfasta" script on your generated .cls file. Renumber the .bm file starting with 1 before importing into ESOM.***

8b.  Load your .names, .umx, .wts, and fixed .bm file into your local ESOM gui. 

***-----Somoclu training workflow end-----***

9. Vizualize output and identify target genome

View -> UMatrix background, tiled display.
#Use Zoom, Color, Bestmatch size to get your desired view.

*****At this point only your ridges and valleys and the overall structure of your data will be displayed.***** 
NOW, we can play around with adding information (annotating, if you will) those contigs (windows) that are displayed on your map.
 A. Check "Draw Best Matches" in View pane.

 B. File -> load .cls
 
 C. Under "Classes" tab, select classes you are interested in viewing so that they "light up" on the map.
 
 D. Once you have identified your target genome, select the "Data" tab. Then, left click around the target area of the map. 
 
 E. When you have enclosed all of the target area of the map, right click to select that target area. Note: this will only work correctly if you have selected the "Data" tab prior to beginning.
 
 F. File, Selection, save as .cls. Name your selected .cls file to save to your folder. 
 
10. Obtain your target contigs using Getclassfasta.pl
```
perl Getclassfasta.pl -fasta your_genome_assembly.fasta -names your_genome_assembly.names -num 1 -loyal 75 -cls your_target_from_esom.cls
```
#You will now have a .fasta (your new target genome assembly), and a .conf output files. The .conf tells you the confidence at which any given contig was placed within the target genome assembly.

Congratulations, you can now move on with genome annotation.


