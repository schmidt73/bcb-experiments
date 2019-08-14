A=/cluster/tufts/cowenlab/experiments/experiment1/outputs/spectral/net4/

for N in 100 200 500 1000;
do 
    mkdir -p "$A""$N"_pascal 
    sbatch ./run_dream_slurm.sh 4 "$A""$N".out "$A""$N"_pascal
done

