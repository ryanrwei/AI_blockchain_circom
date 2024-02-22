pragma circom 2.0.0;

template SquareRootVerifier() {
    signal input publicSquare;
    signal input secretRoot; // input means private
    var privateSqaure;
    signal output isValid; // output means public

    // check if secretRoot**2(privateSqaure) == publicSquare
    privateSqaure = secretRoot*secretRoot;

    // isValid = 0 only if the computation is valid
    isValid <== privateSqaure - publicSquare;

    privateSqaure === publicSquare; 
}

component main = SquareRootVerifier();