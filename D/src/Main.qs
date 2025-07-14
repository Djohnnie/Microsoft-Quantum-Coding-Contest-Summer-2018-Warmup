// D. Distinguish plus state and minus state
//
// You are given a qubit which is guaranteed to be either in the plus state (|+⟩ = 1/√2(|0⟩ + |1⟩)) 
// or in the minus state (|-⟩ = 1/√2(|0⟩ - |1⟩)).
// Your task is to perform necessary operations and measurements to figure out which state it was
// and to return 1 if it was a |+⟩ state or -1 if it was |-⟩ state.
// The state of the qubit after the operations does not matter.
//
// You have to implement an operation which takes a qubit as an input and returns an integer.

operation Main() : Unit
{    
    use q = Qubit();

    // Generate plus state
    H(q);
    Message($"{Solve(q)}");
    Reset(q);

    // Generate minus state
    X(q);
    H(q);
    Message($"{Solve(q)}");
    Reset(q);
}

operation Solve (q: Qubit) : Int
{
    // Apply Hadamard gate to reverse the state to |0⟩ or |1⟩.
    H(q);

    // Measure the qubit and return 1 for |0⟩ and -1 for |1⟩.
    return MResetZ(q) == Zero ? 1 | -1;
}