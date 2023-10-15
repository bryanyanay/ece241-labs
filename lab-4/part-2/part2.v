`timescale 1ns / 1ns

module part2(Clock, Reset_b, Data, Function, ALUout);
  input [1:0] Function;
  input Clock, Reset_b;
  input [3:0] Data;

  reg [7:0] pregALUout;
  output reg [7:0] ALUout;

  always @(*)
  begin
    case (Function)
      2'b00: pregALUout = Data + ALUout[3:0];
      2'b01: pregALUout = Data * ALUout[3:0];
      2'b10: pregALUout = ALUout[3:0] << Data;
      2'b11: pregALUout = ALUout;
      default: pregALUout = 0;
    endcase
  end

  always @(posedge Clock) 
  begin
    if (Reset_b)
      ALUout = 0;
    else 
      ALUout = pregALUout;
  end

endmodule