pragma circom 2.0.2;

include "../libs/circom-ecdsa/bigint.circom";

component main {public [a, b]} = BigMod(3, 2);
