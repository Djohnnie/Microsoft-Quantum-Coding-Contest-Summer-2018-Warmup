// C. Generate GHZ state
//
// You are given N qubits (1 ≤ N ≤ 8) in zero state . Your task is to create Greenberger–Horne–Zeilinger (GHZ) state on them:
// |GHZ⟩ = 1/√2 (|0..0⟩ + |1..1⟩)
//
// You have to implement an operation which takes an array of N qubits as an input and has no output.
// The "output" of your solution is the state in which it left the input qubits.

import Std.Diagnostics.DumpRegister;

operation Main() : Unit
{    
    use qs = Qubit[8];

    Solve(qs);
    DumpRegister(qs);
    ResetAll(qs);
}

operation Solve (qs: Qubit[]) : ()
{
    // Put the first qubit in superposition.
    H(qs[0]);
    
    for i in 1..Length(qs) - 1
    {
        // Entangle the first qubit with each of the others.
        CNOT(qs[0], qs[i]);
    }
}