
module part3 #(parameter CLOCK_FREQUENCY=100) 
(
  input wire ClockIn, 
  input wire Reset, 
  input wire Start, 
  input wire [2:0] Letter, 
  output wire DotDashOut, 
  output wire NewBitOut);

  reg [11:0] letterBits;

  always @(*) 
  begin
    case (Letter)
      3'b000: letterBits = 12'b101110000000;
      3'b001: letterBits = 12'b111010101000;
      3'b010: letterBits = 12'b111010111010;
      3'b011: letterBits = 12'b111010100000;
      3'b100: letterBits = 12'b100000000000;
      3'b101: letterBits = 12'b101011101000;
      3'b110: letterBits = 12'b111011101000;
      3'b111: letterBits = 12'b101010100000;
    endcase
  end

  wire Enable;

  ratediv #(CLOCK_FREQUENCY) RD (ClockIn, Start, Enable);
  shiftreg SR (ClockIn, Enable, Start, letterBits, Reset, DotDashOut, NewBitOut);
endmodule

module ratediv #(parameter CLOCK_FREQUENCY=100) (input Clock, input Reset, output Enable);
  reg [$clog2(CLOCK_FREQUENCY) - 2:0] counter;

  always @(posedge Clock)
  begin
    if (Reset)
      counter <= (CLOCK_FREQUENCY >> 2);
    else if (counter == 0) 
      counter <= (CLOCK_FREQUENCY >> 2);
    else 
      counter <= counter - 1;
  end

  assign Enable = (counter == 0) ? 1'b1 : 1'b0;
endmodule

module shiftreg (input Clock, input Enable, input ParallelLoad, input [11:0] LoadVal, input Reset, output ShiftOut, output reg NewBitOut);
  reg [12:0] bits;

  always @(posedge Clock)
  begin
    if (NewBitOut) NewBitOut <= 0;

    if (Reset)
      bits <= 13'b0;
    else if (ParallelLoad)
      bits <= {1'b0, LoadVal};
    else if (Enable)
    begin
      NewBitOut <= 1;
      bits <= {bits[11:0], 1'b0};
    end
  end

  assign ShiftOut = bits[12];
endmodule