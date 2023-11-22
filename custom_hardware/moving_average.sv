module moving_avg_ci(
	input clk,                     // clock
	input reset,                 // reset, active low
	input clk_en,                      // clock enable, active high
	input [31:0] dataa,     // input A
	input [31:0] datab,     // input B
	output reg [31:0] result, // output
	input start,                   // start signal 
	output reg done                // operation is completed
);
	
	logic [31:0] fifo[0:15] = '{default:16'b0};
	logic [31:0] accumulate = 0;

	initial begin
		done = 0;
	end
	
	always @(clk_en) begin
		if(clk_en) begin
			
			//shift buffer to the right
			for (int i = 1; i <= 15; i++) begin
				fifo[i] = fifo[i - 1];
			end
			
			//sign extend to 32 bit 2's compliment and add to first index in buffer
			fifo[0] = {{16{dataa[15]}}, dataa[15:0]};
			
			//reset accumulator
			accumulate = 0;
			
			//add and accumulate all values
			for (int i = 0; i <= 15; i++) begin
				accumulate = accumulate + fifo[i];
			end
			
			//divide by 16 by bit shifting
			result = (accumulate >> 4);
			
			//remove any remaining sign bits from 32 bit calculation
			result[31:16] = 16'h0000;
			
			done = 1;
		end
		else begin
			done = 0;
		end
	end

endmodule
