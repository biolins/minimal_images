#!/bin/bash
#SBATCH -n 2
#SBATCH --array=1-25
#SBATCH --job-name=minimal
#SBATCH --mem=32GB
#SBATCH --gres=gpu:tesla-k80:1
#SBATCH -t 10:00:00
#SBATCH --workdir=./log/
#SBATCH --qos=cbmm

cd /om/user/xboix/src/minimal-cifar/
singularity exec -B /om:/om --nv /om/user/xboix/singularity/localtensorflow.img \
python /om/user/xboix/src/minimal-cifar/main.py ${SLURM_ARRAY_TASK_ID}


