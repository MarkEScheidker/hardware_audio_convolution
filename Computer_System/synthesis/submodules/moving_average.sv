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

    reg [31:0] fifo[0:15];
	 reg [31:0] accumulate = 0;
    reg [3:0] pointer = 0;
    reg set_done = 0;

    // Reset and Clock Edge Handling
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pointer <= 0;
            set_done <= 0;
				accumulate <= 0;
            done <= 0;
            result <= 0;
            fifo <= '{default:32'b0};
        end
        else if (clk_en) begin
            if (start) begin
                fifo[pointer] <= dataa;
                pointer <= pointer + 1; // Wrap around the pointer
                result <= fifo[15]; // For debugging
                set_done <= 1;
            end
            else if (set_done) begin
					 accumulate = 0;
					 accumulate = accumulate + fifo[0];
					 accumulate = accumulate + fifo[1];
					 accumulate = accumulate + fifo[2];
					 accumulate = accumulate + fifo[3];
					 accumulate = accumulate + fifo[4];
					 accumulate = accumulate + fifo[5];
					 accumulate = accumulate + fifo[6];
					 accumulate = accumulate + fifo[7];
					 accumulate = accumulate + fifo[8];
					 accumulate = accumulate + fifo[9];
					 accumulate = accumulate + fifo[10];
					 accumulate = accumulate + fifo[11];
					 accumulate = accumulate + fifo[12];
					 accumulate = accumulate + fifo[13];
					 accumulate = accumulate + fifo[14];
					 accumulate = accumulate + fifo[15];
					 result = accumulate >> 4;
					 result[31:16] = 16'b0;
                done <= 1;
                set_done <= 0;
            end
            else begin
                done <= 0;
            end
        end
    end
endmodule