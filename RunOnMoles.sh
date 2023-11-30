#!/bin/bash

# Adds the submission time to the slurm file name
submit_time=$(date +'%Y_%m_%d_%H_%M_%S')
# Append some tag to the file name (like the number of nodes used or any other info
tag=""

#  sbatch --constraint=moles --output=PB&A_Slurm#=%j_Time=${submit_time}.out ./RunTestScript.sh
sbatch --constraint=moles --output=PB\&A_Slurm\#%j_Time=${submit_time}${tag}.out ./RunTestScript.sh

