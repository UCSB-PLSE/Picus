#!/bin/bash

for fp in ./benchmarks/hermez-network-9a696e3-fixed/*.circom
do
	fn=$(basename ${fp})
	bn="${fn%.*}"
	echo "=================== ${fn}: ${bn} ==================="
	echo "    compiling..."
	# circom -o ./benchmarks/hermez-network-9a696e3-fixed/ ./benchmarks/hermez-network-9a696e3-fixed/${fn} --r1cs --sym
	# to compare with Ecne, you need --O0 to disable optimization
	circom -o ./benchmarks/hermez-network-9a696e3-fixed/ ./benchmarks/hermez-network-9a696e3-fixed/${fn} --r1cs --sym --O0
	echo "    parsing..."
	./circom-parser/target/debug/parser ./benchmarks/hermez-network-9a696e3-fixed/${fn} > ./benchmarks/hermez-network-9a696e3-fixed/${bn}.json

	# don't do this since the constraints are quite large
	# echo "    reading..."
	# racket ./test-read-r1cs.rkt --r1cs ./benchmarks/hermez-network-9a696e3-fixed/${bn}.r1cs > ./benchmarks/hermez-network-9a696e3-fixed/${bn}.r1cs.log

	# echo "    testing..."
	# racket ./test-functionality.rkt --cname ${bn}
done