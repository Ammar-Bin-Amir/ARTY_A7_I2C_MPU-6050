`timescale 1ns/1ns

module wrapper_tb;
    
    reg clk_pll;
    wire clk_div;
    wire clk;
    reg rst;
    reg en;
    // Registers Selector
    reg [3:0] register_selector;
    // I2C
    wire scl;
    wire tristate;
    wire sda;
    // Data
    wire [7:0] data;

    wrapper uut (
        .clk_pll (clk_pll),
        .clk_div (clk_div),
        .clk (clk),
        .rst (rst),
        .en (en),
        .register_selector (register_selector),
        .scl (scl),
        .tristate (tristate),
        .sda (sda),
        .data (data)
    );

    initial clk_pll = 0;
    always #10 clk_pll = ~clk_pll;

    reg sda_in;

    assign sda = tristate ? sda_in : 1'bz;

    initial begin
        sda_in = 0;
        #10 rst = 1;
        #50 rst = 0;
        for (integer i = 0; i < 16; i = i + 1) begin
            #9000000 register_selector = i;
            #1000 en = 1;
            #100000 en = 0;
        end
        #50000 $finish;
    end
    
    initial begin
        $dumpfile("./temp/wrapper_tb.vcd");
        $dumpvars(0,wrapper_tb);
    end

endmodule