#!/bin/bash
# usage: this.sh <timeout:seconds> <ecne_path> <log_path> <target_folder>
# example: ./batch-run-ecne.sh 600 ../Ecne/ ./logs/ecne-circomlib ./benchmarks/circomlib-cff5ab6/

otime=$1
ecnepath=$2
logpath=$3
targetfolder=$4

mkdir -p ${logpath}

for fp in ${targetfolder}/*.r1cs
do
	fn=$(basename ${fp})
	bn="${fn%.*}"
    bp="${fp%.*}"
	echo "=================== checking: ${fn} ==================="
	echo "====   start: $(date -u)"
	st="$(date -u +%s)"

	timeout ${otime} julia --project=${ecnepath} ${ecnepath}/src/Ecne.jl --r1cs ${fp} --name ooo --sym ${bp}.sym --compatible --silent --showunique > ${logpath}/${bn}.log 2>&1

	et="$(date -u +%s)"
	echo "====     end: $(date -u)"
	ct="$(($et-$st))"
	echo "==== elapsed: ${ct} seconds"
done