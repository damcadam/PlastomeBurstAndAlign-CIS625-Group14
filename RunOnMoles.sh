#!/bin/bash

submit_time=$(date +'%Y_%m_%d_%H_%M_%S')

#  sbatch --constraint=moles --output=PB&A_Slurm#=%j_Time=${submit_time}.out ./RunTestScript.sh
sbatch --constraint=moles --output=PB\&A_Slurm\#%j_Time=${submit_time}.out ./RunTestScript.sh

