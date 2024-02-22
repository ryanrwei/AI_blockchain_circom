### Compiling circuit

1. compile:
   enter "circom SquareRootVerifier.circom --r1cs --wasm --sym --c"

### Computing the witness

1. create input.json:

- the content would:
  // feel free to change the value
  {
  "publicSquare": 4,
  "secretRoot": 2
  }

2. Computing the witness with WebAssembly:
   enter: "node generate_witness.js SquareRootVerifier.wasm input.json witness.wtns"

### Powers of Tau

1. start new "powers of tau" ceremony:
   enter: "snarkjs powersoftau new bn128 12 pot12_0000.ptau -v"

2. contribute to the ceremony:
   enter: "snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v"

### Phase 2

1. generation of the phase:
   enter: "snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v"

2. Contribute to the phase 2 of the ceremony:
   enter: "snarkjs zkey contribute SquareRootVerifier_0000.zkey SquareRootVerifier_0001.zkey --name="1st Contributor Name" -v"

3. Export the verification key:
   enter: snarkjs zkey export verificationkey SquareRootVerifier_0001.zkey verification_key.json

### Generating a Proof

1. generate a zk-proof associated to the circuit and the witness:
   enter: "snarkjs groth16 prove SquareRootVerifier_0001.zkey witness.wtns proof.json public.json
   "

2. Verifying a Proof:
   enter: "snarkjs groth16 verify verification_key.json public.json proof.json
   "

Then you will see "OK", and it means the proof is valid. That's all! You can also double check if the value in public.json is 0, if so, it means the proof works!
