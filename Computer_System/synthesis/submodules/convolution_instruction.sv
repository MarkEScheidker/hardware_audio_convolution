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

	initial begin
		done = 0;
		result = 0;
	end
	
	always @(clk_en) begin
		if(clk_en) begin
			for (int i = 1; i <= 31; i++) begin
				fifo[i] = fifo[i - 1];
			end
            fifo[0] = dataa[15:0];
			
			result[15:0] = fifo[31];
			
			done = 1;
		end
		else begin
			done = 0;
		end
	end

endmodule
