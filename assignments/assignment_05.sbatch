#!/bin/bash
#SBATCH -J pi
#SBATCH -o assignment_05.out
#SBATCH -p htc
#SBATCH -N 1
#SBATCH --mem=6G

module purge
module load python/3
command_flags="-J pi -o  pi_%j.out -p htc -N 1 --mem 10G"

rundocker_project.sh


