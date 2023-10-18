#!/bin/bash
module load hisat/2-2.2.1
module load bowtie2/2.4.5
pathreads="/hpcfs/home/cursos/bcom4006/estudiantes/na.portilla10/AlgoBCTareaRNA/reads"
for file in $pathreads/*
do
sample=$(basename "$file" .fastq.gz)
echo "Processing sample: $sample"
hisat2 --rg-id $sample --rg SM:$sample --rg PL:ILLUMINA --dta -x ../reference/hisat/nipponbare_hisat2Idx -U "$file" -S "$sample"_hisat2.sam &> "$sample"_hisat2.log
bowtie2 --rg-id $sample --rg SM:$sample --rg PL:ILLUMINA -X 1000 -x ../reference/bowtie/nipponbare_bowtie2Idx -r "$file" -S "$sample"_bowtie2.sam &> "$sample"_bowtie2.log
done
