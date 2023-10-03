`timescale 1ns / 1ns

module test_module (A, B, Function, ALUout);
  parameter N = 5;

  input wire [N-1:0] A, B;
  output wire [2*N-1:0] ALUout;
  input wire [1:0] Function;

  part3 #(5) test (A, B, Function, ALUout);
endmodule

module part3 (A, B, Function, ALUout);
  parameter N = 4;

  input [N-1:0] A, B;
  output reg [2*N-1:0] ALUout;
  input [1:0] Function;

  always @(*)
  begin
    case (Function)
      0: ALUout = A+B;
      1: ALUout = |{A, B};
      2: ALUout = &{A, B};
      3: ALUout = {A, B};
      default: ALUout = 0;
    endcase
  end
endmodule