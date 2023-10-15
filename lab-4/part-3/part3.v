`timescale 1ns / 1ns

module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
  input clock, reset, ParallelLoadn, RotateRight, ASRight;
  input [3:0] Data_IN;
  output [3:0] Q;

  sub S3 (ASRight ? Q[3] : Q[0], Q[2], RotateRight, Data_IN[3], ParallelLoadn, clock, reset, Q[3]);
  sub S2 (Q[3], Q[1], RotateRight, Data_IN[2], ParallelLoadn, clock, reset, Q[2]);
  sub S1 (Q[2], Q[0], RotateRight, Data_IN[1], ParallelLoadn, clock, reset, Q[1]);
  sub S0 (Q[1], Q[3], RotateRight, Data_IN[0], ParallelLoadn, clock, reset, Q[0]);
endmodule


module sub(left, right, LoadLeft, D, loadn, clock, reset, Q);
  input left, right, LoadLeft, D, loadn, clock, reset;
  output reg Q;

  always @(posedge clock) 
  begin
    if (reset)
      Q <= 0;
    else
    begin
      if (loadn) 
      begin
        if (LoadLeft)
          Q <= left;
        else
          Q <= right;
      end
      else 
        Q <= D;
    end
  end
endmodule