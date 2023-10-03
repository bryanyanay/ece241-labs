`timescale 1ns / 1ns

module part2setup(input [7:0] SW, input [1:0] KEY, output [7:0] LEDR, output [6:0] HEX0, HEX2, HEX3, HEX4);
  hex_decoder A_display (SW[7:4], HEX2);
  hex_decoder B_display (SW[3:0], HEX0);

  part2 ALU (SW[7:4], SW[3:0], KEY, LEDR);
  
  hex_decoder ALUOut_display1 (LEDR[7:4], HEX4);
  hex_decoder ALUOut_display2 (LEDR[3:0], HEX3);
endmodule


module hex_decoder (c, display);
  input [3:0] c;
  output [6:0] display;

  // calculate all minterms with wires, then just or them
  wire m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15;

  assign m0 = ~c[3] & ~c[2] & ~c[1] & ~c[0];
  assign m1 = ~c[3] & ~c[2] & ~c[1] & c[0];
  assign m2 = ~c[3] & ~c[2] & c[1] & ~c[0];
  assign m3 = ~c[3] & ~c[2] & c[1] & c[0];
  assign m4 = ~c[3] & c[2] & ~c[1] & ~c[0];
  assign m5 = ~c[3] & c[2] & ~c[1] & c[0];
  assign m6 = ~c[3] & c[2] & c[1] & ~c[0];
  assign m7 = ~c[3] & c[2] & c[1] & c[0];
  assign m8 = c[3] & ~c[2] & ~c[1] & ~c[0];
  assign m9 = c[3] & ~c[2] & ~c[1] & c[0];
  assign m10 = c[3] & ~c[2] & c[1] & ~c[0];
  assign m11 = c[3] & ~c[2] & c[1] & c[0];
  assign m12 = c[3] & c[2] & ~c[1] & ~c[0];
  assign m13 = c[3] & c[2] & ~c[1] & c[0];
  assign m14 = c[3] & c[2] & c[1] & ~c[0];
  assign m15 = c[3] & c[2] & c[1] & c[0];

  assign display[0] = m1 | m4 | m11 | m13;
  assign display[1] = m5 | m6 | m11 | m12 | m14 | m15;
  assign display[2] = m2 | m12 | m14 | m15;
  assign display[3] = m1 | m4 | m7 | m9 | m10 | m15;
  assign display[4] = m1 | m3 | m4 | m5 | m7 | m9;
  assign display[5] = m1 | m2 | m3 | m7 | m13;
  assign display[6] = m0 | m1 | m7 | m12;

endmodule

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