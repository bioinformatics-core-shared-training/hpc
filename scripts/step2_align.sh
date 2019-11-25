#!/bin/bash

projectDir=~/scratcha/hpc_training
fastqDir=$projectDir/fastq
bamDir=$projectDir/bam

mkdir $bamDir

for fastqFile in $fastqDir/*fastq; do
   sampleName=`basename ${fastqFile} .fastq`
   sbatch ${projectDir}/scripts/run_star.sh ${fastqFile} ${sampleName} ${bamDir}
done
