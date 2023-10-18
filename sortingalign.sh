#!/bin/bash
module load jdk/11.0.14
pathmaps="/hpcfs/home/cursos/bcom4006/estudiantes/na.portilla10/AlgoBCTareaRNA/mapping"
for file in $pathmaps/*.sam
do
samfilehisat=$(basename "$file" _hisat2.sam)
samfilebowtie=$(basenae "$file2" _bowtie2.sam)
echo "Processing sams hisat : $samfile"
mkdir tmpdir_sort_hisat_$samfilehisat
java -Xmx4g -jar /hpcfs/home/cursos/bcom4006/software/picard.jar SortSam SO=coordinate CREATE_INDEX=true TMP_DIR=tmpdir_sort_hisat_$samfilehisat I=$file O=$samfilehisat"_hisat2_sorted.bam" >& $samfilehisat"_hisat2_sort.log" 
echo "Processing sams bowtie : $samfilebowtie"
mkdir tmpdir_sort_hisat_$samfilebowtie
java -Xmx4g -jar /hpcfs/home/cursos/bcom4006/software/picard.jar SortSam SO=coordinate CREATE_INDEX=true TMP_DIR=tmpdir_sort_bowtie_$samfilebowtie I=$file2 O=$samfilebowtie"_bowtie2_sorted.bam" >& $samfilebowtie"_bowtie2_sort.log"
done

