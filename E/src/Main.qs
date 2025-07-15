// E. Distinguish Bell states
//
// You are given two qubits which are guaranteed to be in one of the Bell states:
// - 0: 1/√2 (|00⟩ + |11⟩)
// - 1: 1/√2 (|00⟩ - |11⟩)
// - 2: 1/√2 (|01⟩ + |10⟩)
// - 3: 1/√2 (|01⟩ - |10⟩)
//
// Your task is to perform necessary operations and measurements to figure out which state it was
// and to return the index of that state (0 for , 1 for  etc.).
// The state of the qubits after the operations does not matter.
//
// You have to implement an operation which takes an array of two qubits as an input and returns an integer.

import Std.Convert.ResultArrayAsInt;
import Std.Diagnostics.DumpRegister;

operation Main() : Unit
{    
    use qs = Qubit[2];

    GenerateBellState(qs, 0);
    DumpRegister(qs);
    Message($"Generated Bell state 0 = {Solve(qs)}");

    GenerateBellState(qs, 1);
    DumpRegister(qs);
    Message($"Generated Bell state 1 = {Solve(qs)}");

    GenerateBellState(qs, 2);
    DumpRegister(qs);
    Message($"Generated Bell state 2 = {Solve(qs)}");

    GenerateBellState(qs, 3);
    DumpRegister(qs);
    Message($"Generated Bell state 3 = {Solve(qs)}");
}

operation Solve (qs: Qubit[]) : Int
{
    // Reverse the Bell states because quantum gates are self-adjoint.
    CNOT(qs[0], qs[1]);
    H(qs[0]);
    DumpRegister(qs);

    // Convert the resulting state to an integer.
    let result = MResetEachZ(qs);
    return ResultArrayAsInt(result);
}

operation GenerateBellState (qs: Qubit[], index: Int) : ()
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