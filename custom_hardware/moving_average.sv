module moving_avg_ci(
    input clk,                     // clock
    input reset,                   // reset, active low
    input clk_en,                  // clock enable, active high
    input [31:0] dataa,            // input A
    input [31:0] datab,            // input B
    output reg [31:0] result,      // output
    input start,                   // start signal 
    output reg done                // operation is completed
);

    reg [31:0] fifo[0:31];
    reg [31:0] accumulate = 0;
    reg [4:0] pointer = 0;
    reg [1:0]state = 0;
    reg [5:0] i; // Loop index

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
            for (i = 0; i < 16; i = i + 1) begin
                accumulate = accumulate + fifo[i];
            end
            state <= 2;
        end
        else if (state == 2 & clk_en) begin
            for (i = 16; i < 32; i = i + 1) begin
                accumulate = accumulate + fifo[i];
            end
            result = accumulate >> 5; // Dividing by 32
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
