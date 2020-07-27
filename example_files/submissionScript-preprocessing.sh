#!/bin/sh

#SBATCH -n1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G

# SBATCH --mail-user=CHANGE@imbi.uni-freiburg.de
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --partition=slurm 
#SBATCH --output ../slurm-log-%A.txt


sh /data/programs/pipelines/CPACOR-EPIC_pipeline/code/prepSwitchRmd_local.sh 

# This file can be queued with $ sbatch /data/programs/pipelines/CPACOR-EPIC_pipeline/submissionScript-preprocessing.sh

# It is necessary to provide a file parameterfile.R in the very same directory from which the job is batched. 
# The parameterfile may not be changed until the job is started, which may be later than its submission.

# Parameters can be overwritten on the commandline. 
# To increase memory to X megabyte per node, add --mem=X
# To increase memory to X megabyte per cpu instead, add --mem-per-cpu=X
# To change to partition X, add --partition=X
# To get mail when the job is finished, add: --mail-user=USER@imbi.uni-freiburg.de
# Mail type options are BEGIN, END, FAIL, REQUEUE, ALL
# It has no effect if one increases the number of cpus.


# NOTE Panther (80 samples) used 20 GB.
# NOTE GCKD used > 40 GB.
# NOTE Different runs at the same time overwrite each other. 
