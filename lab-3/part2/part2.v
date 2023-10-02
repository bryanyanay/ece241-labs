`timescale 1ns / 1ns

module part2(A, B, Function, ALUout);
  input [3:0] A, B;
  output reg [7:0] ALUout;
  input [1:0] Function;

  wire [3:0] sum, c_out;

  rc_adder RCA (A, B, 0, sum, c_out);

  always @(*)
  begin
    case (Function)
      0: ALUout = {3'b0, c_out[3], sum};
      1: ALUout = {7'b0, |{A, B}};
      2: ALUout = {7'b0, &{A, B}};
      3: ALUout = {A, B};
      default: ALUout = 8'b0;
    endcase
  end
endmodule

module rc_adder(a, b, c_in, s, c_out);
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