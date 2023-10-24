`timescale 1ms / 1ms

module part2setup (input CLOCK_50, input SW[9:0], output HEX0);
  wire [3:0] counterValue;

  part2 #(parameter CLOCK_FREQUENCY = 50000000) p2 (CLOCK_50, SW[9], SW[1:0], counterValue[3:0]);
  hex_decoder hd (counterValue[3:0], HEX0);
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

module part2 #(parameter CLOCK_FREQUENCY = 100) 
(input ClockIn, input Reset, input [1:0] Speed, output [3:0] CounterValue);
  wire Enable;
  RateDivider #(CLOCK_FREQUENCY) rd(ClockIn, Reset, Speed, Enable);
  DisplayCounter dc(ClockIn, Reset, Enable, CounterValue);
endmodule

module DisplayCounter (input Clock, input Reset, input EnableDC, output reg [3:0] CounterValue);

  always @(posedge Clock)
  begin
    if (Reset)
      CounterValue <= 0;
    else 
    begin
      if (EnableDC)
      begin
        if (CounterValue == 4'b1111) 
          CounterValue <= 0;
        else 
          CounterValue <= CounterValue + 1;
      end
    end
  end
endmodule

module RateDivider #(parameter CLOCK_FREQUENCY = 100) 
(input ClockIn, input Reset, input [1:0] Speed, output Enable);
  
  reg [1 + $clog2(CLOCK_FREQUENCY):0] counter;
  reg [1 + $clog2(CLOCK_FREQUENCY):0] newCounter;

  always @(*) 
  begin
    case (Speed)
      2'b00: newCounter = 0;
      2'b01: newCounter = CLOCK_FREQUENCY - 1;
      2'b10: newCounter = (CLOCK_FREQUENCY << 1) - 1;
      2'b11: newCounter = (CLOCK_FREQUENCY << 2) - 1;
      default: newCounter = 0;
    endcase
  end

  always @(posedge ClockIn) 
  begin
    if (Reset) 
      counter <= 0;
    else if (counter == 0) 
      counter <= newCounter;
    else 
      counter <= counter - 1;
  end

  assign Enable = (counter == 1'b0) ? 1'b1 : 1'b0;
endmodule