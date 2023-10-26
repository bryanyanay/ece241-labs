module part3
#(parameter CLOCK_FREQUENCY=50000000)(
	input wire ClockIn,
	input wire Reset,
	input wire Start,
	input wire [2:0] Letter,
	output wire DotDashOut,
	output wire NewBitOut
);

	localparam PULSE_DURATION = (CLOCK_FREQUENCY / 2);

	reg [11:0] current_code;
	reg [11:0] shift_reg;
	reg [1 + $clog2(CLOCK_FREQUENCY):0] counter = 0;

	reg [12:0] bitCounter;

	always @(posedge ClockIn) begin
		if (Reset) 
		begin
			shift_reg <= 12'b0;
			counter <= 0;
			bitCounter <= 0;
		end 
		else 
		begin
			if (Start) 
			begin
				case(Letter)
					3'b000 : current_code <= 12'b101110000000;
					3'b001 : current_code <= 12'b111010101000;
					3'b010 : current_code <= 12'b111010111010;
					3'b011 : current_code <= 12'b111010100000;
					3'b100 : current_code <= 12'b100000000000;
					3'b101 : current_code <= 12'b101011101000;
					3'b110 : current_code <= 12'b111011101000;
					3'b111 : current_code <= 12'b101010100000; 
				endcase
				bitCounter <= 13'b1111111111111;
			end
			
			if (counter == PULSE_DURATION) 
			begin
				counter <= 0;
				shift_reg <= current_code;
				current_code <= current_code << 1;
				bitCounter <= (bitCounter << 1);
			end 
			else 
			begin
				counter <= counter + 1;
			end
		end
	end

	assign DotDashOut = shift_reg[11];
	assign NewBitOut = (counter == 0 && bitCounter > 0) ? 1'b1 : 1'b0;

endmodule

