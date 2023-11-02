#!/bin/bash

# Program: This is a bash script to automatically setup dependencies needed to run the test_script.py for
#	PlastomeBurstAndAlign.py. 

# How to Use Me: 
#	1. Install MAFFT, following Dr.G's video
#	2. Change the variable below called MAFFT_BIN_FOLDER to the path to your bin folder for MAFFT
# 	3. Run this script with the following (without the quotes) '. SetupModulesAndPython.sh'

# Add the MAFFT bin folder to the PATH if it's not already there
MAFFT_BIN_FOLDER=/homes/dariusm/GenomicsBin
if [[ ":$PATH:" != *":$MAFFT_BIN_FOLDER:"* ]]; then
    export PATH="$PATH:$MAFFT_BIN_FOLDER"
    echo "Added $MAFFT_BIN_FOLDER to PATH"
else
    echo "$MAFFT_BIN_FOLDER is already in PATH"
fi

# Setup the correct modules
echo "Loading modules..."
module purge
module load Python/3.10.4-GCCcore-11.3.0
module load Biopython

# Activate virtual enviroment that has the following pip installs already installed
	# pip install coloredlogs
	# pip install ipdb
source PythonEnv/bin/activate
echo "Python virtual env has been activated (for coloredlogs and ipdb)"

echo "Setup complete!"

