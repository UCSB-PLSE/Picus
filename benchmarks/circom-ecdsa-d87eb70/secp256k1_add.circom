pragma circom 2.0.2;

include "../libs/circom-ecdsa-d87eb70/secp256k1.circom";

component main {public [a, b]} = Secp256k1AddUnequal(64, 4);
