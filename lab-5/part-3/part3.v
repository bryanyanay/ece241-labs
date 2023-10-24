
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
      3'b000: letterBits = 101110000000;
      3'b001: letterBits = 111010101000;
      3'b010: letterBits = 111010111010;
      3'b011: letterBits = 111010100000;
      3'b100: letterBits = 100000000000;
      3'b101: letterBits = 101011101000;
      3'b110: letterBits = 111011101000;
      3'b111: letterBits = 101010100000;
    endcase
  end

  reg ParallelLoad;

  always @(posedge Clock)
  begin
    if (Start) 
      ParallelLoad <= 1;
    else
      ParallelLoad <= 0;
  end  

  ratediv RD #(CLOCK_FREQUENCY) (Clock, Reset, NewBitOut);
  shiftreg SR (Clock, NewBitOut, ParallelLoad, letterBits, DotDashOut);

endmodule

module ratediv #(parameter CLOCK_FREQUENCY=100) (input Clock, input Reset, output Enable);
  reg [$clog2(CLOCK_FREQUENCYcounter) - 2:0] counter;

  always @(posedge Clock)
  begin
    if (Reset)
      counter <= 0;
    else if (counter == 0) 
      counter <= (CLOCK_FREQUENCY >> 2);
    else 
      counter <= counter - 1;
  end

  assign Enable = (counter == 0) ? 1'b1 : 1'b0;
endmodule

module shiftreg (input Clock, input Enable, input ParallelLoad, input [11:0] LoadVal, output ShiftOut);
  reg [11:0] bits;

  always @(posedge Clock)
  begin
    if (ParallelLoad)
      bits <= LoadVal;
    else if (Enable)
      bits <= {bits[10:0], 1'b0};
  end

  assign ShiftOut = bits[11];
endmodule