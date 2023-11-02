import subprocess
import os
import shutil
import time # for rough program timing

# Get the current directory of the test script
script_dir = os.path.dirname(os.path.abspath(__file__))

# Define the relative path to your Python script
MYSCRIPT = "PlastomeRegionBurstAndAlign.py"

# Combine the directory of the test script with the relative path to the Python script
full_script_path = os.path.join(script_dir, MYSCRIPT)

# Define the path to the output directory
folder_CDS = "benchmarking1/output_CDS"

# Step 1: Extract the tar.gz file
subprocess.run(["tar", "-xvf", "benchmarking1.tar.gz"])

# Step 2: Change the current directory to benchmarking1/
os.chdir("benchmarking1")

# Step 3: Create necessary directories
subprocess.run(["mkdir", "-p", folder_CDS])
subprocess.run(["mkdir", "-p", f"{folder_CDS}/01_unalign"])
subprocess.run(["mkdir", "-p", f"{folder_CDS}/02_aligned"])
subprocess.run(["mkdir", "-p", f"{folder_CDS}/02_aligned/fasta"])
subprocess.run(["mkdir", "-p", f"{folder_CDS}/02_aligned/nexus"])

# Step 4: Run your Python script using the full_script_path
print("\n------------- starting to run PlastomeBurstAndAlign ------------\n")
start_time = time.time()

subprocess.run(["python", full_script_path, "-i", ".", "-o", folder_CDS, "-s", "cds"])

end_time = time.time()
total_time = end_time - start_time

# run this to remove the folder, if not can comment out
# Step 5: Delete the benchmarking1 directory and its contents
# os.chdir(script_dir)  # Move back to the directory containing the test script
shutil.rmtree("benchmarking1")

print("benchmarking1 directory and its contents have been deleted.")

# Print time to just run PlastomeBurstAndAlign
print(f"\n --- Time to run PlastomeBurstAndAlign = {total_time:.4f} seconds --- \n")

