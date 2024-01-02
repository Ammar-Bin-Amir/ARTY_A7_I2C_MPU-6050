module clock_divider #(parameter DIVISIOR = 27'd10) (
    input wire clk_in,
    output reg clk_out
);
    
    reg [26:0] counter = 27'd0;

    always @(posedge clk_in) begin
        clk_out <= (counter < (DIVISIOR / 2)) ? 1'b0 : 1'b1;
        if (counter >= (DIVISIOR - 1)) begin
            counter <= 27'd0;
        end
        else begin
            counter <= counter + 27'd1;
        end
    end

endmodule