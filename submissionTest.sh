#!/bin/sh

#SBATCH -n1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G

# SBATCH --mail-user=CHANGE@imbi.uni-freiburg.de
#SBATCH --partition=genepi 

codepath="/data/epigenetics/02_EPIC_pipeline/CPACOR-EPIC_pipeline/code"

sh $codepath/test.sh 

# This file can be queued with $ sbatch /data/epigenetics/02_EPIC_pipeline/CPACOR-EPIC_pipeline/submissionScript-preprocessing.sh
# Parameters can be overwritten on the commandline. 
# To increase memory to X megabyte per node, add --mem=X
# To increase memory to X megabyte per cpu instead, add --mem-per-cpu=X
# To change to parttion X, add --partition=X
# To change the mail, add: --mail-user=USER@imbi.uni-freiburg.de
# It has no effect if one increases the number of cpus.

# It is necessary to provide both a file parameters.R and samplesfile.
# The parameterfile may not be changed until the job is started by slurm. This may be at a later time than its submission!

