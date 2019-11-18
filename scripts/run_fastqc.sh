## run_fastqc.sh
#! /bin/bash
/home/bioinformatics/software/fastqc/fastqc-v0.11.5/fastqc $1 

## step1_qc.sh
#! /bin/bash
projectdir=/scratchb/training/data/practicalII
fastqdir=$projectdir/fastq
cd $fastqcdir

for i in $fastqdir/*.fq.gz;
do
   echo $i;
   sbatch -J $i -t 1-00:00 --mem=4G -o $i.out -e $i.err $projectdir/scripts/run_fastqc.sh $i;
done

## run_star.sh
#! /bin/bash
dbdir=/mnt/scratchb/bioinformatics/reference_data/reference_genomes/homo_sapiens/GRCh38/star-2.5.3a/
/home/bioinformatics/software/STAR/STAR-2.5.3a/bin/STAR --runThreadN 4 --genomeDir $dbdir --readFilesIn $1

## step2_align.sh
#! /bin/bash
projectdir=/scratchb/training/data/practicalII
fastqdir=$projectdir/fastq
bamdir=$projectdir/bam

for i in $fastqdir/*.gz;
do
   echo $i;
   sample=`basename $i .r_1.fq.gz | sed s/s\_//`;
   echo $sample;
   mkdir $bamdir/$sample;
   cd $bamdir/$sample;
   sbatch -J $i -t 1-00:00 --mem=4G -o $sample.out -e $sample.err $projectdir/scripts/run_star.sh $i;
   cd $bamdir;
done
