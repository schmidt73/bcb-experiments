#!/bin/bash

NETWORK=$1
GC_FILE=$2
OUTPUT_PREFIX=$3

DSD_NODELIST=data/DSD/"$1"_200_0_0.nodelist
DSD_FILE=data/DSD/"$1"_200_0_0.dsd

SBATCH_OPTS="\
--mail-type=END --mail-user=Henri.Schmidt@tufts.edu \
-N 1 -n 1 --mem=32000 --time=7-00:00:00 \
"

for N in 100 200 500 1000
do
    CLUSTER_FILE=data/split_cluster_results/"$NETWORK"_"$N"_0.out
    sbatch $SBATCH_OPTS ./merge_genecentric.sh $DSD_FILE $DSD_NODELIST $GC_FILE $CLUSTER_FILE "$OUTPUT_PREFIX"_"$N"
done
