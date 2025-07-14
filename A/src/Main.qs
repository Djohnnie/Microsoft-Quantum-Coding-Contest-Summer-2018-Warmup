// A. Generate plus state or minus state.
//
// You have to implement an operation which takes a qubit and an integer as an input and has no output.
// The "output" of your solution is the state in which it left the input qubit.

import Std.Diagnostics.DumpRegister;

operation Main() : Unit
{    
    use q = Qubit();

    // Generate plus state
    Solve(q, 1);
    DumpRegister([q]);

    Reset(q);

    // Generate minus state
    Solve(q, -1);
    DumpRegister([q]);

    Reset(q);
}

operation Solve (q : Qubit, sign : Int) : ()
{
    if(sign < 0)
    {
        X(q);
    }

    H(q);
}