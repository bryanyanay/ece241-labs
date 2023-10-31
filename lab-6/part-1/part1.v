`timescale 1ns / 1ns

//SW[0] reset when 0
//SW[1] input signal

//KEY[0] clock signal

//LEDR[3:0] displays current state
//LEDR[9] displays output

module part1setup(input [0:0] KEY, input [1:0] SW, output [9:0] LEDR, output HEX0);
    wire [3:0] w;

    part1 P1 (KEY[0], SW[0], SW[1], LEDR[9], w[3:0]);
    hex_decoder HD (w[3:0], HEX0);
    assign LEDR[3:0] = w[3:0];
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

module part1(Clock, Reset, w, z, CurState);
    input Clock;
    input Reset;
    input w;
    output z;
    output [3:0] CurState;

    reg [3:0] y_Q, Y_D; // y_Q represents current state, Y_D represents next state

    localparam A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110;


    //State table
    //The state table should only contain the logic for state transitions
    //Do not mix in any output logic. The output logic should be handled separately.
    //This will make it easier to read, modify and debug the code.
    always@(*)
    begin: state_table
        case (y_Q)
            A: begin
                   if (!w) Y_D = A;
                   else Y_D = B;
               end
            B: begin
                   if(!w) Y_D = A;
                   else Y_D = C;
               end
            C: Y_D = (w) ? D : E;
            D: Y_D = (w) ? F : E;
            E: Y_D = (w) ? G : A;
            F: Y_D = (w) ? F : E;
            G: Y_D = (w) ? C : A;
            default: Y_D = A;
        endcase
    end // state_table

    // State Registers
    always @(posedge Clock)
    begin: state_FFs
        if(Reset == 1'b1)
            y_Q <=  A; // Should set reset state to state A
        else
            y_Q <= Y_D;
    end // state_FFS

    // Output logic
    // Set z to 1 to turn on LED when in relevant states
    assign z = ((y_Q == F) | (y_Q == G));

    assign CurState = y_Q;
endmodule
