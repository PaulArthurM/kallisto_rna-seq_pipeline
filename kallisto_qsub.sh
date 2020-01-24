#!/bin/bash

source activate smk_env

snakemake --jobs 1 --use-conda --cluster "qsub -S /bin/bash -N {params.name} -cwd -o /data1/scratch/pamesl/projet_RNAseq_Gaetano/stdoe_sge -e /data1/scratch/pamesl/projet_RNAseq_Gaetano/stdoe_sge -q long.q -l h_rt=24:00:00 -pe thread {params.nthread} -l h_vmem=2.75G"

source deactivate
