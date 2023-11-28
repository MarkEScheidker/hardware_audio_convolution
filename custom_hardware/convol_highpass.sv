module colvol_highpass_ci(
    input clk,                     // clock
    input reset,                   // reset, active low
    input clk_en,                  // clock enable, active high
    input [31:0] dataa,            // input A
    input [31:0] datab,            // input B
    output reg [31:0] result,      // output
    input start,                   // start signal 
    output reg done                // operation is completed
);
	
    reg [4:0] pointer = 0;
    reg [2:0]state = 0;
	 reg [35:0] fifo[0:31];
    reg [71:0] mult_results[0:31];
    reg [35:0] accumulate = 0;
	 reg [35:0] mult_array[0:31] = '{36'hffffff74f, 
												36'h000005474, 
												36'h000003ab0, 
												36'h000004401, 
												36'h000004e4e, 
												36'h000005497, 
												36'h000005468, 
												36'h000004b85, 
												36'h000003775, 
												36'h000001557, 
												36'hfffffe146, 
												36'hfffff94c9, 
												36'hfffff8000, 
												36'hfffff8000, 
												36'hfffff8000, 
												36'hfffff8000, 
												36'h000007fff, 
												36'h000007fff, 
												36'h000007fff, 
												36'h000007fff, 
												36'h000006b37, 
												36'h000001eba, 
												36'hfffffeaa9, 
												36'hfffffc88b, 
												36'hfffffb47b, 
												36'hfffffab98, 
												36'hfffffab69, 
												36'hfffffb1b2, 
												36'hfffffbbff, 
												36'hfffffc550, 
												36'hfffffab8c, 
												36'h0000008b1 };

    // Main logic always block
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset logic
            pointer <= 0;
            state <= 0;
            accumulate <= 0;
            done <= 0;
            result <= 0;
            fifo <= '{default:36'b0};
        end
        else if (state == 0 & clk_en) begin
        	fifo[pointer] <= {dataa[15:0], 20'b0};
        	pointer <= pointer - 1; // Wrap around the pointer
        	state <= 1;
        end
        else if (state == 1 & clk_en) begin
    		mult_results[0] <= fifo[(pointer - 5'b00001)] * mult_array[0];
    		mult_results[1] <= fifo[(pointer - 5'b00010)] * mult_array[1];
    		mult_results[2] <= fifo[(pointer - 5'b00011)] * mult_array[2];
    		mult_results[3] <= fifo[(pointer - 5'b00100)] * mult_array[3];
    		mult_results[4] <= fifo[(pointer - 5'b00101)] * mult_array[4];
    		mult_results[5] <= fifo[(pointer - 5'b00110)] * mult_array[5];
    		mult_results[6] <= fifo[(pointer - 5'b00111)] * mult_array[6];
    		mult_results[7] <= fifo[(pointer - 5'b01000)] * mult_array[7];
    		mult_results[8] <= fifo[(pointer - 5'b01001)] * mult_array[8];
    		mult_results[9] <= fifo[(pointer - 5'b01010)] * mult_array[9];
    		mult_results[10] <= fifo[(pointer - 5'b01011)] * mult_array[10];
    		mult_results[11] <= fifo[(pointer - 5'b01100)] * mult_array[11];
    		mult_results[12] <= fifo[(pointer - 5'b01101)] * mult_array[12];
    		mult_results[13] <= fifo[(pointer - 5'b01110)] * mult_array[13];
    		mult_results[14] <= fifo[(pointer - 5'b01111)] * mult_array[14];
    		mult_results[15] <= fifo[(pointer - 5'b10000)] * mult_array[15];
    		mult_results[16] <= fifo[(pointer - 5'b10001)] * mult_array[16];
    		mult_results[17] <= fifo[(pointer - 5'b10010)] * mult_array[17];
    		mult_results[18] <= fifo[(pointer - 5'b10011)] * mult_array[18];
    		mult_results[19] <= fifo[(pointer - 5'b10100)] * mult_array[19];
    		mult_results[20] <= fifo[(pointer - 5'b10101)] * mult_array[20];
    		mult_results[21] <= fifo[(pointer - 5'b10110)] * mult_array[21];
    		mult_results[22] <= fifo[(pointer - 5'b10111)] * mult_array[22];
    		mult_results[23] <= fifo[(pointer - 5'b11000)] * mult_array[23];
    		mult_results[24] <= fifo[(pointer - 5'b11001)] * mult_array[24];
    		mult_results[25] <= fifo[(pointer - 5'b11010)] * mult_array[25];
    		mult_results[26] <= fifo[(pointer - 5'b11011)] * mult_array[26];
    		mult_results[27] <= fifo[(pointer - 5'b11100)] * mult_array[27];
    		mult_results[28] <= fifo[(pointer - 5'b11101)] * mult_array[28];
    		mult_results[29] <= fifo[(pointer - 5'b11110)] * mult_array[29];
    		mult_results[30] <= fifo[(pointer - 5'b11111)] * mult_array[30];
    		mult_results[31] <= fifo[(pointer - 5'b00000)] * mult_array[31];
    		state <= 2;
	end
        else if (state == 2 & clk_en) begin
		accumulate = 0;
		accumulate = accumulate + mult_results[0][55:20];
		accumulate = accumulate + mult_results[1][55:20];
		accumulate = accumulate + mult_results[2][55:20];
		accumulate = accumulate + mult_results[3][55:20];
		accumulate = accumulate + mult_results[4][55:20];
		accumulate = accumulate + mult_results[5][55:20];
		accumulate = accumulate + mult_results[6][55:20];
		accumulate = accumulate + mult_results[7][55:20];
		accumulate = accumulate + mult_results[8][55:20];
		accumulate = accumulate + mult_results[9][55:20];
		accumulate = accumulate + mult_results[10][55:20];
		accumulate = accumulate + mult_results[11][55:20];
		accumulate = accumulate + mult_results[12][55:20];
		accumulate = accumulate + mult_results[13][55:20];
		accumulate = accumulate + mult_results[14][55:20];
		accumulate = accumulate + mult_results[15][55:20];
                state <= 3;
        end
        else if (state == 3 & clk_en) begin
		accumulate = accumulate + mult_results[16][55:20];
		accumulate = accumulate + mult_results[17][55:20];
		accumulate = accumulate + mult_results[18][55:20];
		accumulate = accumulate + mult_results[19][55:20];
		accumulate = accumulate + mult_results[20][55:20];
		accumulate = accumulate + mult_results[21][55:20];
		accumulate = accumulate + mult_results[22][55:20];
		accumulate = accumulate + mult_results[23][55:20];
		accumulate = accumulate + mult_results[24][55:20];
		accumulate = accumulate + mult_results[25][55:20];
		accumulate = accumulate + mult_results[26][55:20];
		accumulate = accumulate + mult_results[27][55:20];
		accumulate = accumulate + mult_results[28][55:20];
		accumulate = accumulate + mult_results[29][55:20];
		accumulate = accumulate + mult_results[30][55:20];
		accumulate = accumulate + mult_results[31][55:20];
		result[15:0] = accumulate[35:20];
                result[31:16] = 16'b0;
                done <= 1;
                state <= 4;
            end
        else begin
                state <= 0;
                done <= 0;
        end
      end
endmodule