`timescale 1ns/1ns
`include "clock_divider.v"

module clock_divider_tb;

    reg clk_in;
    wire clk_out;

    clock_divider #(125) uut (
        .clk_in (clk_in),
        .clk_out (clk_out)
    );

    initial begin
        $dumpfile("clock_divider_tb.vcd");
        $dumpvars(0,clock_divider_tb);
    end

    initial clk_in = 0;
    always #5 clk_in = ~clk_in;

    initial #1000 $finish;
    
endmodule