#!/bin/bash

PYTHON=python

DSD_NODELIST=$1
DSD_FILE=$2
GC_FILE=$3
CLUSTER_FILE=$4
OUTPUT_PREFIX=$5

MERGED="$OUTPUT_PREFIX"_merged
FINAL="$OUTPUT_PREFIX"_final

$PYTHON clustering/gc_scripts/gc_and_other.py $GC_FILE $CLUSTER_FILE > $MERGED
$PYTHON clustering/split_clusters.py $DSD_FILE $MERGED -n $DSD_NODELIST > $FINAL
