#!/bin/bash

NETP=$1
DSD_FILE=$2
DSD_NODELIST=$3
K_VAL=$4

PYTHON=python

NETWORK_DIR=data/networks/subchallenge1/
NL_DIR=data/nodelists/
EDGES_DIR=data/matrices/

GC_DIR=data/genecentric_"$NETP"_"$K_VAL"/
GC_COMPONENTS_DIR=$GC_DIR/components/
GC_BPM_DIR=$GC_DIR/bpm/
K_CLUSTERS=$GC_DIR/k_clusters.out

mkdir -p $GC_DIR
mkdir -p $GC_COMPONENTS_DIR
mkdir -p $GC_BPM_DIR

NETWORK=$NETWORK_DIR/"$NETP"_net.txt
NODES=$NL_DIR/"$NETP"_nodelist.txt
EDGES=$EDGES_DIR/"$NETP"_matrix.txt

$PYTHON clustering/generate_clusters.py $DSD_FILE -n $DSD_NODELIST -a 1 -p $K_VAL > $K_CLUSTERS
$PYTHON clustering/gc_scripts/clusters_to_sgs.py $EDGES $K_CLUSTERS -n $NODES -o $GC_COMPONENTS_DIR

for subgraph in $GC_COMPONENTS_DIR/*; do
    BASE=$(basename -- "$subgraph")
    SUBGRAPH_PREFIX=${BASE%.*}   
    # $PYTHON clustering/gc_scripts/genecentrify_edges.py $subgraph > $subgraph
    $PYTHON genecentric/genecentric-bpms $subgraph $GC_BPM_DIR/"$SUBGRAPH_PREFIX".bpm -p 4 --minimum-size 3 --maximum-size 100 --squaring
done

$PYTHON clustering/gc_scripts/integrate_gc.py $GC_BPM_DIR > $GC_DIR/unmerged.out
