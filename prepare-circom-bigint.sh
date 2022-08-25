#!/bin/bash

for fp in ./benchmarks/circom-bigint/*.circom
do
	fn=$(basename ${fp})
	bn="${fn%.*}"
	echo "=================== ${fn}: ${bn} ==================="
	echo "    compiling..."
	# circom -o ./benchmarks/circom-bigint/ ./benchmarks/circom-bigint/${fn} --r1cs --sym
	# to compare with Ecne, you need --O0 to disable optimization
	# /home/clara/circom/iden3_circom_now/target/release/circom -o ./benchmarks/circom-bigint/ ./benchmarks/circom-bigint/${fn} --r1cs --sym --O0
	circom -o ./benchmarks/circom-bigint/ ./benchmarks/circom-bigint/${fn} --r1cs --sym --O0
	echo "    parsing..."
	./circom-parser/target/debug/parser ./benchmarks/circom-bigint/${fn} > ./benchmarks/circom-bigint/${bn}.json

	# don't do this since the constraints are quite large
	# echo "    reading..."
	# racket ./test-read-r1cs.rkt --r1cs ./benchmarks/circom-bigint/${bn}.r1cs > ./benchmarks/circom-bigint/${bn}.r1cs.log

	# echo "    testing..."
	# racket ./test-functionality.rkt --cname ${bn}
done
