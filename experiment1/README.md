# Experiment 1

The goal of the this experiment is twofold: to test what 
happens when we change the number of clusters and what happens
when we keep edge weights positive vs setting to -1 when passing 
into genecentric.

## Methodology

For the first part of the experiment we will run the standard DREAM 
challenge spectral clustering pipeline on all DREAM networks excluding 
network 3. We will vary spectral clustering parameter k for values
k = 100, 200, 500, 1000. Then we will run the PASCAL tool to output
the number of significant modules and list enriched modules
of size 3 - 30.

Hopefully this gives us some insight as to how significant modules
vary with clustering parameter k.

For the second part of the experiment we will run Genecentric in two
ways on all of the networks (except 3) after splitting each network
into j = 20 clusters and j = 50 clusters for network 4. Then we will
combine the Genecentric clusters with those output by spectral clustering
in the first part of the experiment in a greedy fashion.

The first way is to keep the edge weights as is and pass the --squaring
flag to genecentric. This is how genecentric was ran in the MONET
paper.

The second way is to set all edge weights to -1 and run genecentric
with the --no-squaring option.

## Inputs

The only inputs to this experiment are the 5 DREAM challenge
networks (as we are not considering network 3).

## Outputs

Significant modules for each cluster file are located at the
same path with the file extension modified to ".sig".

Deanonymized cluster files for network N with ran with k clusters
are located at: outputs/spectral/netN/k.out.

Example: outputs/spectral/net1/100.out is the cluster file for
network 1 ran with k = 100 spectral clustering parameter. The
corresponding significant modules file is outputs/spectral/net1/100.sig.

Unmerged genecentric cluster files for network N located at: 

- outputs/genecentric/netN/positive\_unmerged
- outputs/genecentric/netN/negative\_unmerged

Merged genecentric cluster files with spectral cluster with k clusters
for network N are located at:

- outputs/genecentric/netN/negative\_k\_merged
- outputs/genecentric/netN/negative\_k\_final
- outputs/genecentric/netN/positive\_k\_merged
- outputs/genecentric/netN/positive\_k\_final

The difference between merged and final is that final is after
performing recursive splitting on clusters of size > 100.

## Expected TODO

Most of the work can be done with few modifications to the
existing pipeline we have set up.  However, I will need to write a 
script to convert all edge weights to -1 and change the current 
genecentric scripts to output merged and unmerged networks.

## Actual TODO

All the scripts created purely for this experiment are located in
the scripts/ directory.

- A python scipt to convert edge list files to edge list files
  with all weights set to -1 (genecentrify\_edges.py).
- A shell script to run genecentric to produce unmerged 
  cluster file (run\_genecentric.sh).
- A shell script to merge genecentric and spectral clustering
  files in a greedy fashion (merge\_genecentric.sh).
- A shell script to start SLURM jobs using merge\_genecentric.sh
  for all networks and sizes (experiment1.sh).
- A shell script to run PASCAL on all spectral clusters
  (submit\_pascal.sh)

A few annoying quirks:

All scripts work only with anonymized networks, so I have to crawl
through the output directories and deanonymize all the networks.
This wouldn't be so bad, but naming is not consistent so I have
to do it semi-manually.

Slight modifications have to be made for the experiment1.sh script 
for network 4 as there is only one connected component in the DSD graph 
and the file name is different.


# CURRENT STATE

1, 2, 6 => postivie genecentric => dank
4, 5 => spectral clustering failed :(

So rerunning 4, 5

1,2,6 i fucked up by overwriting components so have to redo that before i can 
negate everything i should still cehck if the unmerged file matches the previous output
