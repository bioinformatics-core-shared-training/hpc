#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem 4G
#SBATCH -t 1:00:00
#SBATCH -o fastqc_%j.out
#SBATCH -e fastqc_%j.err
#SBATCH -J fastqc

fastqFile=${1}

/home/bioinformatics/software/fastqc/fastqc-v0.11.8/fastqc ${fastqFile}

/home/bioinformatics/software/fastqc/fastqc-v0.11.8/fastqc --version


