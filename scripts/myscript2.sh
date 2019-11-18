#!/bin/bash
#SBATCH -p general # partition (queue)
#SBATCH -N 1 # number of nodes
#SBATCH -n 1 # number of cores
#SBATCH --mem 100 # memory pool for all cores
#SBATCH -t 0-2:00 # time (D-HH:MM)
#SBATCH -o myscript.out # STDOUT
#SBATCH -e myscript.err # STDERR
for i in {1..100}; do
echo $RANDOM >> SomeRandomNumbers.txt
done
sort SomeRandomNumbers.txt
