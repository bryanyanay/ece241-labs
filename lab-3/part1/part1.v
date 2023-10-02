`timescale 1ns / 1ns

module part1(a, b, c_in, s, c_out);
  input wire [3:0] a, b;
  input wire c_in;
  output wire [3:0] s, c_out;

  full_adder A0(a[0], b[0], c_in, s[0], c_out[0]);
  full_adder A1(a[1], b[1], c_out[0], s[1], c_out[1]);
  full_adder A2(a[2], b[2], c_out[1], s[2], c_out[2]);
  full_adder A3(a[3], b[3], c_out[2], s[3], c_out[3]);
endmodule

module full_adder(a, b, c_in, s, c_out);
  input a, b, c_in;
  output s, c_out;

  assign s = ^{a, b, c_in};
  assign c_out = (a^b) ? c_in : b;
endmodule