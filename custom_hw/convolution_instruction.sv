module gcd_ci(
	input clk,                     // clock
	input reset,                 // reset, active low
	input clk_en,                      // clock enable, active high
	input [31:0] dataa,     // input A
	input [31:0] datab,     // input B
	output reg [31:0] result, // output
	input start,                   // start signal 
	output reg done                // operation is completed
);
	
	logic [15:0] fifo[0:31] = '{default:16'b0};
	
	always @(clk_en) begin
		if(clk_en) begin
			fifo = '{dataa[15:0], fifo[0:30]};
			done = 1;
		end
		else begin
			done = 0;
		end
	end

endmodule
