`timescale 1us / 1ns
module tb_DAC();

//module DAC(clk, rst, btn, add_sel, dac_csn, dac_ldacn, dac_wrn, dac_a_b, dac_d, led_out);

reg clk, rst;
reg [5:0] btn;
reg add_sel;

wire dac_csn, dac_ldacn, dac_wrn, dac_a_b;
wire [7:0] dac_d;
wire [7:0] led_out;

DAC D1(clk, rst, btn, add_sel, dac_csn, dac_ldacn, dac_wrn, dac_a_b, dac_d, led_out);

initial begin
    clk <= 0;
    rst <= 0;
    add_sel <= 0;
    btn <= 0;
    #10 rst <= 1;
    #10 rst <= 0;
    #10 rst <= 1;
    #1e+6 btn <= 6'b010000; // +1
    //#10 btn <= 0;
    
    #1e+6 btn <= 6'b000001;  //+8
    //#10 btn <= 0;
    
    end
    
    always begin
    #0.5 clk <= ~clk;
    end
    endmodule