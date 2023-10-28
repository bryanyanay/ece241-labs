`timescale 1ns / 1ns

module part1 (input Clock, input Enable, input Reset, output [7:0] CounterValue);

  wire [7:0] w;

  assign w[0] = Enable;
  assign w[1] = w[0] & CounterValue[0];
  assign w[2] = w[1] & CounterValue[1];
  assign w[3] = w[2] & CounterValue[2];
  assign w[4] = w[3] & CounterValue[3];
  assign w[5] = w[4] & CounterValue[4];
  assign w[6] = w[5] & CounterValue[5];
  assign w[7] = w[6] & CounterValue[6];

  t T0 (Clock, w[0], Reset, CounterValue[0]);
  t T1 (Clock, w[1], Reset, CounterValue[1]);
  t T2 (Clock, w[2], Reset, CounterValue[2]);
  t T3 (Clock, w[3], Reset, CounterValue[3]);
  t T4 (Clock, w[4], Reset, CounterValue[4]);
  t T5 (Clock, w[5], Reset, CounterValue[5]);
  t T6 (Clock, w[6], Reset, CounterValue[6]);
  t T7 (Clock, w[7], Reset, CounterValue[7]);
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