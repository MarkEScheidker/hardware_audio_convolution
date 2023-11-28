module moving_avg_two_ci(
    input clk,                     // clock
    input reset,                   // reset, active low
    input clk_en,                  // clock enable, active high
    input [31:0] dataa,            // input A
    input [31:0] datab,            // input B
    output reg [31:0] result,      // output
    input start,                   // start signal 
    output reg done                // operation is completed
);

    reg [31:0] fifo[0:15];
    reg [31:0] accumulate = 0;
    reg [3:0] pointer = 0;
    reg [1:0]state = 0;
    reg [1:0]clk_counter = 0;

    // Main logic always block
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset logic
            pointer <= 0;
            state <= 0;
            accumulate <= 0;
            done <= 0;
            result <= 0;
            fifo <= '{default:32'b0};
        end
        else if (state == 0 & clk_en) begin
            fifo[pointer] <= dataa;
            pointer <= pointer + 1; // Wrap around the pointer
            state <= 1;
        end
          else if (state == 1 & clk_en) begin
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
                state <= 2;
          end
        else if (state == 2 & clk_en) begin
                accumulate = accumulate + fifo[10];
                accumulate = accumulate + fifo[11];
                accumulate = accumulate + fifo[12];
                accumulate = accumulate + fifo[13];
                accumulate = accumulate + fifo[14];
                accumulate = accumulate + fifo[15];
                result = accumulate >> 4;
                result[31:16] = 16'b0;
                done <= 1;
                state <= 3;
            end
         else begin
                state <= 0;
                done <= 0;
         end
      end
endmodule