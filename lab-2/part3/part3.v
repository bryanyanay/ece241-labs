

module part3 (SW, HEX0);
  input [3:0] SW;
  output [6:0] HEX0;

  hex_decoder H(SW, HEX0);
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