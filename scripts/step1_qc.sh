#!/bin/bash

projectDir=~/scratcha/hpc_training
fastqDir=${projectDir}/fastq

for fastqFile in ${fastqDir}/*fastq; do
    sbatch ${projectDir}/scripts/run_fastqc.sh ${fastqFile}
done

