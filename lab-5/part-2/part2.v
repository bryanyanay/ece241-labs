`timescale 1ms / 1ms

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