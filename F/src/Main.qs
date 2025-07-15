// F. Distinguish multi-qubit basis states
//
// You are given N qubits which are guaranteed to be in one of two basis states on N qubits.
// You are also given two bitstrings bits0 and bits1 which describe these basis states.
//
// Your task is to perform necessary operations and measurements to figure out which state it was
// and to return 0 if it was the state described with bits0 or 1 if it was the state described with bits1.
// The state of the qubits after the operations does not matter.
//
// You have to implement an operation which takes the following inputs:
// - an array of qubits qs,
// - two arrays of boolean values bits0 and bits1, representing the basis states in which the qubits can be.
//   These arrays will have the same length as the array of qubits. bits0 and bits1 will differ in at least one position.
// An array of boolean values represents a basis state as follows: the i-th element of the array is true if the i-th qubit
// is in state |1⟩, and false if it is in state |0⟩. For example, array [true; false] describes 2-qubit state .

import Std.Convert.BoolArrayAsInt;
import Std.Convert.ResultArrayAsBoolArray;

operation Main() : Unit
{    
    use qs = Qubit[4];

    ApplyToEach(X, [qs[0], qs[2]]);
    let r1 = Solve(qs, [false, true, false, true], [true, false, true, false]);
    Message($"Result: {r1}");

    ApplyToEach(X, [qs[2], qs[3]]);
    let r2 = Solve(qs, [false, false, true, true], [true, true, false, false]);
    Message($"Result: {r2}");
}

operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : String
{
    // Measure all qubits in the computational basis.
    let results = MResetEachZ(qs);
    // Convert the results to an array of boolean values.
    let bools = ResultArrayAsBoolArray(results);

    // Compare the measured state, converted to an integer, with 'bits0', converted to an integer.
    return BoolArrayAsInt(bools) == BoolArrayAsInt(bits0) ? "bits0" | "bits1";
}