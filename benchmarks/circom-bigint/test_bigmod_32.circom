pragma circom 2.0.2;

include "../libs/circom-bigint/bigint.circom";

component main {public [a, b]} = BigMod(3, 2);
