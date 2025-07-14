// B. Generate Bell state
//
// You are given two qubits in state  and an integer index. Your task is to create one of the Bell states on them according to the index:
// - 0: 1/√2 (|00⟩ + |11⟩)
// - 1: 1/√2 (|00⟩ - |11⟩)
// - 2: 1/√2 (|01⟩ + |10⟩)
// - 3: 1/√2 (|01⟩ - |10⟩)
//
// You have to implement an operation which takes an array of 2 qubits and an integer as an input and has no output.
// The "output" of your solution is the state in which it left the input qubits.

import Std.Diagnostics.DumpRegister;

operation Main() : Unit
{    
    use qs = Qubit[2];

    Solve(qs, 0);
    DumpRegister(qs);
    ResetAll(qs);

    Solve(qs, 1);
    DumpRegister(qs);
    ResetAll(qs);

    Solve(qs, 2);
    DumpRegister(qs);
    ResetAll(qs);

    Solve(qs, 3);
    DumpRegister(qs);
    ResetAll(qs);
}

operation Solve (qs: Qubit[], index: Int) : ()
{
    // Put the first qubit in superposition.
    H(qs[0]);

    // If the result should be |00⟩ - |11⟩ or |01⟩ - |10⟩, we need to apply the Z-gate to alter the sign.
    if(index % 2 == 1)
    {
        Z(qs[0]);
    }
    
    // Apply the CNOT gate to entangle the qubits.
    CNOT(qs[0], qs[1]);
    
    // If the result should be |01⟩ + |10⟩ or |01⟩ - |10⟩, we need to apply the X-gate to the second qubit.
    if(index >= 2)
    {
        X(qs[1]);
    }
}