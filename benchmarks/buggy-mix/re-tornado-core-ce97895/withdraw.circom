include "./bitify.circom";
include "./pedersen.circom";
include "./merkleTree.circom";

// computes Pedersen(nullifier + secret)
template CommitmentHasher() {
    signal input nullifier;
    signal input secret;

    signal output commitment;
    signal output nullifierHash;

    component commitmentHasher = Pedersen(496);
    component nullifierHasher = Pedersen(248);
    component nullifierBits = Num2Bits(248);
    component secretBits = Num2Bits(248);
    nullifierBits.in <== nullifier;
    secretBits.in <== secret;
    for (var i = 0; i < 248; i++) {
        nullifierHasher.in[i] <== nullifierBits.out[i];
        commitmentHasher.in[i] <== nullifierBits.out[i];
        commitmentHasher.in[i + 248] <== secretBits.out[i];
    }

    commitment <== commitmentHasher.out[0];
    nullifierHash <== nullifierHasher.out[0];
}

// Verifies that commitment that corresponds to given secret and nullifier is included in the merkle tree of deposits
template Withdraw(levels, rounds) {
    signal input root;
    signal input nullifierHash;
    signal input receiver; // not taking part in any computations
    signal input fee; // not taking part in any computations
    signal input nullifier;
    signal input secret;
    signal input pathElements[levels];
    signal input pathIndex[levels];

    // Picus verification output
    signal output vOut;

    component hasher = CommitmentHasher();
    hasher.nullifier <== nullifier;
    hasher.secret <== secret;

    nullifierHash === hasher.nullifierHash;

    component tree = MerkleTree(levels, rounds);
    tree.leaf <== hasher.commitment;
    tree.root <== root;
    for (var i = 0; i < levels; i++) {
        tree.pathElements[i] <== pathElements[i];
        tree.pathIndex[i] <== pathIndex[i];
    }

    // Add hidden signal to make sure that tampering with receiver or fee will invalidate the snark proof
    // Most likely it is not required, but it's better to stay on the safe side and it only takes 1 constraint
    // Multiplication is used to prevent optimizer from removing this constraint
    signal unused;
    unused <== receiver * fee;

    vOut <== tree.vOut;
}

component main = Withdraw(16, 220);