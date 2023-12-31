`timescale 1us / 1ns
//module LED_control(clk, rst, bin, seg_data, seg_sel, led_signal);

module tb_LEDcontrol();

reg clk, rst;
reg [7:0] bin;

wire [7:0] seg_data;
wire [7:0] seg_sel;
wire led_signal;

LED_control L1(clk, rst, bin, seg_data, seg_sel, led_signal);

initial begin
    clk <= 0;
    rst <= 1;
    #10 rst <= 0;
    
    
    #1e+6 bin <= 8'b00000000; // 0%
    
    #1e+6 bin <= 8'b00111111; // 25%
     
    #1e+6 bin <= 8'b01111111;  // 50%
    
    #1e+6 bin <= 8'b10111111;  // 75%
    
    #1e+6 bin <= 8'b11111111;  // 100%
    
    end
    
always begin
 #0.5 clk <= ~clk;
 end
 
 endmodule

    
    
