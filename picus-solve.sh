#!/bin/bash
# usage:
#   picus-solve.sh <path-to-circom-file>

fp=$1
fd="$(dirname "${fp}")"
fn="$(basename "${fp}")"
bn="${fn%.*}"

otime=600
solver=cvc5

# echo "# solving: ${fp}"
timeout ${otime} racket ./picus-dpvl-uniqueness.rkt --timeout 5000 --solver ${solver} --weak --r1cs ${fp} --map