#!/bin/bash
#SBATCH -N 1
#SBATCH -n 4
#SBATCH --mem 8G
#SBATCH -t 1:00:00
#SBATCH -o star_align_%j.out
#SBATCH -e star_align_%j.err
#SBATCH -J star_align

fastqFile=${1}
sampleName=${2}
bamDir=${3}

refDir=/mnt/scratcha/bioinformatics/reference_data/reference_genomes
starGenomeDir=${refDir}/homo_sapiens/GRCh38/star-2.7.2b

outputName=${bamDir}/${sampleName}

/home/bioinformatics/software/STAR/STAR-2.7.3a/bin/STAR \
    --runThreadN 4 \
    --genomeDir ${starGenomeDir} \
    --outSAMtype BAM Unsorted \
    --outSAMmapqUnique 60 \
    --outSAMunmapped Within KeepPairs \
    --readFilesIn ${fastqFile} \
    --outFileNamePrefix ${outputName} \

echo -n "STAR version: "
/home/bioinformatics/software/STAR/STAR-2.7.3a/bin/STAR --version

