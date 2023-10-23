`timescale 1ns / 1ns

module part1 (input Clock, input Enable, input Reset, output [7:0] Countervalue);

  wire [7:0] w;

  assign w[0] = Enable;
  assign w[1] = w[0] & Countervalue[0];
  assign w[2] = w[1] & Countervalue[1];
  assign w[3] = w[2] & Countervalue[2];
  assign w[4] = w[3] & Countervalue[3];
  assign w[5] = w[4] & Countervalue[4];
  assign w[6] = w[5] & Countervalue[5];
  assign w[7] = w[6] & Countervalue[6];

  t T0 (Clock, w[0], Reset, Countervalue[0]);
  t T1 (Clock, w[1], Reset, Countervalue[1]);
  t T2 (Clock, w[2], Reset, Countervalue[2]);
  t T3 (Clock, w[3], Reset, Countervalue[3]);
  t T4 (Clock, w[4], Reset, Countervalue[4]);
  t T5 (Clock, w[5], Reset, Countervalue[5]);
  t T6 (Clock, w[6], Reset, Countervalue[6]);
  t T7 (Clock, w[7], Reset, Countervalue[7]);
endmodule

module t (input Clock, input T, input Reset, output reg Q);
  always @(posedge Clock) 
  begin
    if (Reset) 
      Q <= 1'b0;
    else 
      Q <= Q ^ T; 
  end
endmodule