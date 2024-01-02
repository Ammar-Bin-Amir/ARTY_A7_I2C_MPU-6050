module wrapper (
    input wire clk_pll,
    // output wire clk,
    input wire rst,
    input wire en,
    // Registers Selector
    input wire [3:0] register_selector,
    // I2C
    output wire scl,
    output wire tristate,
    inout wire sda,
    // Data
    output wire [7:0] data
);
    
    // // PLL Clock
    // clk_wiz_0 uut_clk (
    //     .clk_out1 (clk),
    //     .clk_in1 (clk_pll)
    // );
    
    // InOut Buffer
    wire sda_out;

    assign sda = tristate ? 1'bz : sda_out;
    
    // I2C Master
    reg [6:0] ext_slave_address_in;
    reg ext_read_write_in;
    reg [7:0] ext_register_address_in;
    reg [7:0] ext_data_in;

    i2c_master uut (
        .clk (clk_pll),
        .rst (rst),
        .en (en),
        .scl (scl),
        .ext_slave_address_in (ext_slave_address_in),
        .ext_read_write_in (ext_read_write_in),
        .ext_register_address_in (ext_register_address_in),
        .ext_data_in (ext_data_in),
        .tristate (tristate),
        .sda_out (sda_out),
        .sda_in (sda),
        .ext_data_out (data)
    );

    // Wrapper
    localparam SLAVE_ADDRESS = 7'b110_1001;
    localparam WRITE = 1'b0;
    localparam READ = 1'b1;
    localparam REGISTER_SELF_TEST_X = 8'h0D;
    localparam REGISTER_SELF_TEST_Y = 8'h0E;
    localparam REGISTER_SELF_TEST_Z = 8'h0F;
    localparam REGISTER_TEMP_OUT_H = 8'h41;
    localparam REGISTER_TEMP_OUT_L = 8'h42;
    localparam REGISTER_GYRO_XOUT_H = 8'h43;
    localparam REGISTER_GYRO_XOUT_L = 8'h44;
    localparam REGISTER_GYRO_YOUT_H = 8'h45;
    localparam REGISTER_GYRO_YOUT_L = 8'h46;
    localparam REGISTER_GYRO_ZOUT_H = 8'h47;
    localparam REGISTER_GYRO_ZOUT_L = 8'h48;
    localparam REGISTER_WHO_AM_I = 8'h75;
    
    localparam NOTHING = 4'b0000;
    localparam READ_SELF_TEST_X = 4'b0001;
    localparam READ_SELF_TEST_Y = 4'b0010;
    localparam READ_SELF_TEST_Z = 4'b0011;
    localparam WRITE_SELF_TEST_X = 4'b0100;
    localparam WRITE_SELF_TEST_Y = 4'b0101;
    localparam WRITE_SELF_TEST_Z = 4'b0110;
    localparam READ_WHO_AM_I = 4'b0111;
    localparam READ_GYRO_XOUT_H = 4'b1000;
    localparam READ_GYRO_XOUT_L = 4'b1001;
    localparam READ_GYRO_YOUT_H = 4'b1010;
    localparam READ_GYRO_YOUT_L = 4'b1011;
    localparam READ_GYRO_ZOUT_H = 4'b1100;
    localparam READ_GYRO_ZOUT_L = 4'b1101;
    localparam READ_TEMP_OUT_H = 4'b1110;
    localparam READ_TEMP_OUT_L = 4'b1111;
    
    always @(*) begin
        ext_slave_address_in = 0;
        ext_read_write_in = 0;
        ext_register_address_in = 0;
        ext_data_in = 0;
        if (rst) begin
            ext_slave_address_in = 0;
            ext_read_write_in = 0;
            ext_register_address_in = 0;
            ext_data_in = 0;
        end
        else begin
            // if (en == 1'b0) begin
                case (register_selector)
                    // NOTHING: begin
                    
                    // end
                    READ_SELF_TEST_X: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_SELF_TEST_X;
                    end
                    READ_SELF_TEST_Y: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_SELF_TEST_Y;
                    end
                    READ_SELF_TEST_Z: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_SELF_TEST_Z;
                    end
                    WRITE_SELF_TEST_X: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = WRITE;
                        ext_register_address_in = REGISTER_SELF_TEST_X;
                        ext_data_in = 8'b000_00011;
                    end
                    WRITE_SELF_TEST_Y: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = WRITE;
                        ext_register_address_in = REGISTER_SELF_TEST_Y;
                        ext_data_in = 8'b000_01100;
                    end
                    WRITE_SELF_TEST_Z: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = WRITE;
                        ext_register_address_in = REGISTER_SELF_TEST_Z;
                        ext_data_in = 8'b000_10000;
                    end
                    READ_WHO_AM_I: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_WHO_AM_I;
                    end
                    READ_GYRO_XOUT_H: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_GYRO_XOUT_H;
                    end
                    READ_GYRO_XOUT_L: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_GYRO_XOUT_L;
                    end
                    READ_GYRO_YOUT_H: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_GYRO_YOUT_H;
                    end
                    READ_GYRO_YOUT_L: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_GYRO_YOUT_L;
                    end
                    READ_GYRO_ZOUT_H: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_GYRO_ZOUT_H;
                    end
                    READ_GYRO_ZOUT_L: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_GYRO_ZOUT_L;
                    end
                    READ_TEMP_OUT_H: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_TEMP_OUT_H;
                    end
                    READ_TEMP_OUT_L: begin
                        ext_slave_address_in = SLAVE_ADDRESS;
                        ext_read_write_in = READ;
                        ext_register_address_in = REGISTER_TEMP_OUT_L;
                    end
                    // default: 
                endcase
            // end
            // else begin
            //     ext_slave_address_in = SLAVE_ADDRESS;
            //     ext_read_write_in = 0;
            //     ext_register_address_in = 0;
            //     ext_data_in = 0;
            // end
        end
    end

endmodule