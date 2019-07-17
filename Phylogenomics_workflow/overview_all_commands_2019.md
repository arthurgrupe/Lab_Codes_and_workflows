# 1. Rename all proteins within files to make your life easier when you need to concatenate your files.



# 2. Run muscle on all files using Load Balancer:



# 3. Run trimal using Load Balancer:



# 4. Create expected file:
cat trimmed/*.fasta.out.trim | grep "^>" | tr "|" "\t" | cut -f 1 | sort | uniq > expected.txt

head expected.txt
>Acema
>Amore
>Amyenc
>Ascsa
>Bissp
>Blugr
>Botci
>Bulin
>Cadsp
>Calmar

# 5. Now, concatenate your aligned files:
