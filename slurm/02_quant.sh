#!/bin/bash -l
#SBATCH --account=$PAWSEY_PROJECT
#SBATCH --job-name=quant
#SBATCH --output=quant_%j.log
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=8GB
#SBATCH --partition=work
#SBATCH --time=00:10:00
#SBATCH --mail-user=your@email.com
#SBATCH --mail-type=END,FAIL

module load pawseyenv/2023.08
module load singularity/3.11.4-nompi

SAMPLE_ID="gut"
READS_1="data/ggal/${SAMPLE_ID}_1.fq"
READS_2="data/ggal/${SAMPLE_ID}_2.fq"

singularity exec salmon:1.10.3--h6dccd9a_2 salmon quant \
	--libType=U \
	-i results/salmon_index \
	-1 ${READS_1} \
	-2 ${READS_2} \
	-o results/${SAMPLE_ID}
